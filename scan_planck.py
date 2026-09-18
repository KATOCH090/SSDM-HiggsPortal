"""
Reproduce the scalar Higgs-portal panel of Fig. 4 of arXiv:1703.07364
(updated with LZ 2024 + current Higgs-invisible limit).

For each DM mass:
  1. reference point lam_hs = LAM_REF -> sigma_SI/lam^2 and Gamma(h->SS)/lam^2
     (both scale exactly as lam^2 at tree level, so exclusion boundaries follow
      analytically without a 2D grid);
  2. root-find lam_hs such that Omega h^2 = 0.12 (Planck), full SPheno+micrOMEGAs
     chain at every step.

Output: results/planck_curve.csv
"""
import csv
import math
import os
import sys
from multiprocessing import Pool

import numpy as np

from hp_tools import run_point

OMEGA_PL = 0.120
TOL = 0.01                 # relative tolerance on Omega
LAM_MIN, LAM_MAX = 1e-5, 4.0
LAM_REF = 1e-2
OUTDIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "results")


def mass_grid():
    m = np.concatenate([
        np.geomspace(10, 1000, 45),
        np.arange(52, 70.01, 0.5),   # Higgs pole region
        np.arange(72, 92, 2.0),      # WW/ZZ thresholds
        [120, 125, 130, 170, 175, 180],   # hh and tt thresholds
    ])
    return np.unique(np.round(m, 3))


def solve_planck(m):
    """lam_hs giving Omega=0.12.  Omega falls monotonically with lam, and away
    from the pole Omega ~ 1/lam^2, so the update lam *= sqrt(Omega/0.12) is used,
    safeguarded by a log-bisection bracket."""
    lo, hi = LAM_MIN, LAM_MAX
    lam = 0.05 if abs(m - 62.5) > 5 else 1e-3
    history = []
    for _ in range(30):
        r = run_point(m, lam)
        if r["status"] != 0 or r["Omega"] <= 0:
            # SPheno aborts when MS2 ~ -LamSH v^2 is so fine-tuned that its decay
            # routines see a tachyonic S (light S, large lambda): treat as upper bracket
            hi = lam
            if hi / lo < 1.02:
                return None, history
            lam = math.sqrt(lo * hi)
            continue
        om = r["Omega"]
        history.append((lam, om))
        if abs(om / OMEGA_PL - 1) < TOL:
            return r, history
        if om > OMEGA_PL:
            lo = lam
        else:
            hi = lam
        best = min(history, key=lambda h: abs(math.log(h[1] / OMEGA_PL)))
        if best[0] == lam:
            best_r = r
        if hi / lo < 1.01:
            # near the h pole micrOMEGAs' fast mode has ~few-% numerical noise in
            # Omega(lambda); once the bracket is <1% accept the closest point
            return best_r, history
        if lam >= LAM_MAX and om > OMEGA_PL:
            return None, history          # under-abundant impossible: overclosed
        new = lam * math.sqrt(om / OMEGA_PL)
        if not (lo < new < hi) or len(history) > 8:
            new = math.sqrt(lo * hi)      # geometric bisection
        lam = min(new, LAM_MAX)
    return None, history


def work(m):
    ref = run_point(m, LAM_REF)
    pl, hist = solve_planck(m)
    row = {"m": m}
    if ref["status"] == 0:
        row.update(Mdm_ref=ref["Mdm"], sSIp_per_lam2=ref["sSIp"] / LAM_REF**2,
                   sSIn_per_lam2=ref["sSIn"] / LAM_REF**2,
                   Ginv_per_lam2=(ref["Gh"] * ref["BRinv"]) / LAM_REF**2,
                   Gh_SM=ref["Gh"] * (1 - ref["BRinv"]),
                   LZ2024=ref["LZ2024"], XENON1T=ref["XENON1T"],
                   PandaX4T=ref["PandaX4T"])
    if pl:
        row.update(lam_planck=pl["lam_hs"], Mdm=pl["Mdm"], Omega=pl["Omega"],
                   sSIp=pl["sSIp"], sSIn=pl["sSIn"], sigmaV=pl["sigmaV"],
                   BRinv=pl["BRinv"], Xf=pl["Xf"], Mh=pl["Mh"], n_iter=len(hist))
    else:
        row.update(lam_planck=float("nan"), n_iter=len(hist))
    print(f"m={m:8.3f}  lam_planck={row['lam_planck']:.4e}  iters={len(hist)}",
          flush=True)
    return row


if __name__ == "__main__":
    os.makedirs(OUTDIR, exist_ok=True)
    masses = mass_grid()
    nproc = int(sys.argv[1]) if len(sys.argv) > 1 else os.cpu_count()

    # Warm-up (serial): micrOMEGAs compiles each new annihilation channel into
    # SSDM_HP/work/so_generated on first use; do it once per kinematic regime
    # so parallel workers don't race on the compilation.
    for m in (10, 40, 62, 70, 85, 100, 150, 200, 500, 1000):
        run_point(m, 0.1)

    with Pool(nproc) as pool:
        rows = pool.map(work, masses, chunksize=1)

    keys = sorted({k for r in rows for k in r}, key=lambda k: (k != "m", k))
    out = os.path.join(OUTDIR, "planck_curve.csv")
    with open(out, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=keys, restval="")
        w.writeheader()
        w.writerows(sorted(rows, key=lambda r: r["m"]))
    print("wrote", out)
