"""
Random scan of the (m_S, lambda_HS) plane, every point through SPheno -> micrOMEGAs.
Rows are appended to results/random_scan.csv as they finish, so a partial file
is usable while the scan runs.

Usage:  python3 scan_random.py [npoints] [nproc] [seed]
"""
import csv
import os
import sys
from multiprocessing import Pool

import numpy as np

from hp_tools import run_point

M_MIN, M_MAX = 10.0, 1000.0
L_MIN, L_MAX = 1e-4, 1.0
F_POLE = 0.25          # fraction of points drawn in the Higgs-pole window
POLE = (50.0, 70.0)

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "results", "random_scan.csv")
KEYS = ["m_in", "lam_hs", "status", "Mdm", "Mh", "Omega", "Xf", "sSIp", "sSIn",
        "sigmaV", "Gh", "BRinv", "LZ2024", "XENON1T", "PandaX4T"]


def draw(n, rng):
    npole = int(F_POLE * n)
    m = np.concatenate([
        np.exp(rng.uniform(np.log(M_MIN), np.log(M_MAX), n - npole)),
        rng.uniform(*POLE, npole)])
    lam = np.exp(rng.uniform(np.log(L_MIN), np.log(L_MAX), n))
    return list(zip(m, lam))


def work(p):
    return run_point(*p)


if __name__ == "__main__":
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 2000
    nproc = int(sys.argv[2]) if len(sys.argv) > 2 else os.cpu_count()
    seed = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    pts = draw(n, np.random.default_rng(seed))

    new = not os.path.exists(OUT)
    with open(OUT, "a", newline="") as f, Pool(nproc) as pool:
        w = csv.DictWriter(f, fieldnames=KEYS, extrasaction="ignore", restval="")
        if new:
            w.writeheader()
        for i, r in enumerate(pool.imap_unordered(work, pts, chunksize=4), 1):
            w.writerow(r)
            f.flush()
            if i % 50 == 0:
                print(f"{i}/{n}", flush=True)
    print("wrote", OUT)
