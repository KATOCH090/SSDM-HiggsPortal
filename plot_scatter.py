"""
Scatter plots for singlet-scalar Higgs-portal DM.

  scatter_planck_points.png : solved Omega h^2 = 0.12 points (planck_curve.csv),
                              marked allowed / excluded
  scatter_random_omega.png  : random (m_S, lambda_HS) scan coloured by Omega h^2
  scatter_random_sigmaSI.png: rescaled sigma_SI vs m_S for the random scan
"""
import os

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib.colors import LinearSegmentedColormap, TwoSlopeNorm

HERE = os.path.dirname(os.path.abspath(__file__))
RES = os.path.join(HERE, "results")

OMEGA_PL = 0.120
BAND = (0.108, 0.132)        # +-10% (theory uncertainty of the relic calculation)
BR_INV_MAX = 0.107           # ATLAS, arXiv:2301.10731
A_XE, Z_XE = 131.29, 54

INK, MUTED, GRID = "#1f1f1e", "#6b6a63", "#d9d8d0"
C_LZ, C_X1T, C_PX, C_HINV = "#2a78d6", "#eb6834", "#1baf7a", "#008300"
C_OK, C_BAD = "#1f1f1e", "#b0afa6"
# diverging: blue = under-abundant, neutral grey at Planck, orange = over-abundant
DIV = LinearSegmentedColormap.from_list(
    "omega", ["#104281", "#3987e5", "#9ec5f4", "#d9d8d0", "#f5b393", "#eb6834", "#8a3108"])


def xe(sp, sn):
    """Xe-weighted per-nucleon SI cross section."""
    return ((Z_XE * np.sqrt(sp) + (A_XE - Z_XE) * np.sqrt(sn)) / A_XE) ** 2


# ---------------- limit curves in the (m, lambda) plane ----------------
pc = pd.read_csv(os.path.join(RES, "planck_curve.csv")).sort_values("m")
s1 = xe(pc.sSIp_per_lam2, pc.sSIn_per_lam2)
lim_m = pc.m.values
lam_LZ = np.sqrt(pc.LZ2024 / s1).values
lam_PX = np.sqrt(pc.PandaX4T / s1).values
lam_X1T = np.sqrt(pc.XENON1T / s1).values
with np.errstate(divide="ignore"):
    lam_hinv = np.where(pc.Ginv_per_lam2 > 0,
                        np.sqrt(BR_INV_MAX / (1 - BR_INV_MAX) * pc.Gh_SM / pc.Ginv_per_lam2),
                        np.inf)
hm = np.isfinite(lam_hinv)


def style(ax, ylabel=r"$\lambda_{HS}$", ylim=(1e-4, 4.0)):
    ax.set_xscale("log"); ax.set_yscale("log")
    ax.set_xlim(10, 1000); ax.set_ylim(*ylim)
    ax.set_xlabel(r"$m_S$ [GeV]"); ax.set_ylabel(ylabel)
    ax.grid(which="major", color=GRID, lw=0.5, zorder=0)
    for s in ("top", "right"):
        ax.spines[s].set_visible(False)


def limit_lines(ax):
    ax.plot(lim_m, lam_LZ, color=C_LZ, lw=1.8, label="LZ 2024 (90% CL)", zorder=4)
    ax.plot(lim_m, lam_PX, color=C_PX, lw=1.5, ls="--", label="PandaX-4T", zorder=4)
    ax.plot(lim_m, lam_X1T, color=C_X1T, lw=1.5, ls=":", label="XENON1T", zorder=4)
    ax.plot(lim_m[hm], lam_hinv[hm], color=C_HINV, lw=1.8,
            label=r"BR($h\to SS$) = 0.107", zorder=4)


def legend(ax, **kw):
    ax.legend(fontsize=8, frameon=True, facecolor="white", edgecolor=GRID,
              framealpha=0.95, **kw)


# ======== 1. solved Planck points as a scatter ========
ok = np.isfinite(pc.lam_planck)
p = pc[ok]
lzi = np.interp(p.m, lim_m, lam_LZ)
hvi = np.interp(p.m, lim_m[hm], lam_hinv[hm], right=np.inf) if hm.any() else np.inf
hvi = np.where(p.m > lim_m[hm].max(), np.inf, hvi)
allowed = (p.lam_planck < lzi) & (p.lam_planck < hvi)

fig, ax = plt.subplots(figsize=(7.2, 5.2), dpi=150)
limit_lines(ax)
ax.scatter(p.m[~allowed], p.lam_planck[~allowed], s=26, color=C_BAD, edgecolor="white",
           lw=0.8, zorder=5, label=r"$\Omega h^2=0.12$, excluded")
ax.scatter(p.m[allowed], p.lam_planck[allowed], s=34, color=C_OK, edgecolor="white",
           lw=0.8, zorder=6, label=r"$\Omega h^2=0.12$, allowed")
style(ax)
ax.set_title(r"Points with $\Omega h^2 = 0.12$  (SPheno → micrOMEGAs)", fontsize=10, color=INK)
legend(ax, loc="lower right")
fig.tight_layout()
for ext in ("png", "pdf"):
    fig.savefig(os.path.join(RES, f"scatter_planck_points.{ext}"))
print(f"planck points: {len(p)} total, {int(allowed.sum())} allowed")

# ======== 2./3. random scan ========
rf = os.path.join(RES, "random_scan.csv")
if os.path.exists(rf):
    r = pd.read_csv(rf)
    nall = len(r)
    r = r[(r.status == 0) & (r.Omega > 0)].copy()
    r["sXe"] = xe(r.sSIp, r.sSIn)
    r["inband"] = r.Omega.between(*BAND)
    norm = TwoSlopeNorm(vmin=-4, vcenter=np.log10(OMEGA_PL), vmax=3)
    order = np.argsort(np.abs(np.log10(r.Omega) - np.log10(OMEGA_PL)))[::-1]
    r = r.iloc[order]            # points closest to Planck drawn on top

    fig, ax = plt.subplots(figsize=(7.8, 5.2), dpi=150)
    sc = ax.scatter(r.Mdm, r.lam_hs, c=np.log10(r.Omega.clip(1e-4, 1e3)), cmap=DIV,
                    norm=norm, s=9, lw=0, zorder=2)
    b = r[r.inband]
    ax.scatter(b.Mdm, b.lam_hs, s=28, facecolor=INK, edgecolor="white", lw=0.8, zorder=5,
               label=rf"${BAND[0]}<\Omega h^2<{BAND[1]}$ ({len(b)})")
    limit_lines(ax)
    style(ax, ylim=(1e-4, 1.0))
    cb = fig.colorbar(sc, ax=ax, pad=0.02)
    cb.set_label(r"$\log_{10}\,\Omega h^2$   (blue: under-abundant, orange: over-abundant)",
                 fontsize=8)
    ax.set_title(f"Random scan: {len(r)} points (SPheno → micrOMEGAs)", fontsize=10, color=INK)
    legend(ax, loc="lower right")
    fig.tight_layout()
    for ext in ("png", "pdf"):
        fig.savefig(os.path.join(RES, f"scatter_random_omega.{ext}"))

    # sigma_SI rescaled by the local fraction xi = Omega/Omega_PL (capped at 1)
    xi = np.minimum(r.Omega / OMEGA_PL, 1.0)
    fig, ax = plt.subplots(figsize=(7.8, 5.2), dpi=150)
    sc = ax.scatter(r.Mdm, xi * r.sXe, c=np.log10(r.Omega.clip(1e-4, 1e3)), cmap=DIV,
                    norm=norm, s=9, lw=0, zorder=2)
    ax.scatter(b.Mdm, np.minimum(b.Omega / OMEGA_PL, 1) * b.sXe, s=28, facecolor=INK,
               edgecolor="white", lw=0.8, zorder=5, label="Planck band")
    ax.plot(pc.m, pc.LZ2024, color=C_LZ, lw=1.8, label="LZ 2024", zorder=4)
    ax.plot(pc.m, pc.PandaX4T, color=C_PX, lw=1.5, ls="--", label="PandaX-4T", zorder=4)
    ax.plot(pc.m, pc.XENON1T, color=C_X1T, lw=1.5, ls=":", label="XENON1T", zorder=4)
    style(ax, ylabel=r"$\xi\,\sigma_{SI}$ [cm$^2$],  $\xi=\min(\Omega h^2/0.12,\,1)$",
          ylim=(1e-52, 1e-40))
    cb = fig.colorbar(sc, ax=ax, pad=0.02)
    cb.set_label(r"$\log_{10}\,\Omega h^2$", fontsize=8)
    ax.set_title("Direct detection, rescaled by relic fraction", fontsize=10, color=INK)
    legend(ax, loc="lower right")
    fig.tight_layout()
    for ext in ("png", "pdf"):
        fig.savefig(os.path.join(RES, f"scatter_random_sigmaSI.{ext}"))
    print(f"random scan: {nall} rows, {len(r)} valid, {len(b)} in Planck band")
