"""
lambda_HS vs m_S plane for singlet-scalar Higgs-portal DM
(cf. Fig. 4, upper-left, of arXiv:1703.07364), with current limits.

Exclusion boundaries use the exact tree-level scaling  sigma_SI, Gamma(h->SS) ~ lambda^2
from a reference point per mass, and assume S makes up all of the DM (as in the paper).
"""
import os

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

HERE = os.path.dirname(os.path.abspath(__file__))
df = pd.read_csv(os.path.join(HERE, "results", "planck_curve.csv")).sort_values("m")

BR_INV_MAX = 0.107   # ATLAS combination, arXiv:2301.10731 (95% CL)
A_XE, Z_XE = 131.29, 54

INK, MUTED = "#1f1f1e", "#6b6a63"
C_LZ, C_X1T, C_PX, C_HINV = "#2a78d6", "#eb6834", "#1baf7a", "#008300"


def sigma_xe_per_lam2(d):
    """Xe-weighted per-nucleon SI cross section (what experiments quote)."""
    ap, an = np.sqrt(d.sSIp_per_lam2), np.sqrt(d.sSIn_per_lam2)
    return ((Z_XE * ap + (A_XE - Z_XE) * an) / A_XE) ** 2


s1 = sigma_xe_per_lam2(df)
lam_LZ = np.sqrt(df.LZ2024 / s1)
lam_X1T = np.sqrt(df.XENON1T / s1)
lam_PX = np.sqrt(df.PandaX4T / s1)
# BR_inv = G_inv/(G_SM+G_inv) < B  <=>  G_inv < B/(1-B) G_SM
with np.errstate(divide="ignore"):
    lam_hinv = np.where(df.Ginv_per_lam2 > 0,
                        np.sqrt(BR_INV_MAX / (1 - BR_INV_MAX) * df.Gh_SM / df.Ginv_per_lam2),
                        np.inf)

m = df.m.values
YMIN, YMAX = 1e-4, 4.0

fig, ax = plt.subplots(figsize=(7.2, 5.2), dpi=150)
ax.fill_between(m, lam_LZ, YMAX, color=C_LZ, alpha=0.22, lw=0, label="LZ 2024 excluded (90% CL)")
ax.plot(m, lam_LZ, color=C_LZ, lw=1.5)
ax.plot(m, lam_PX, color=C_PX, lw=1.5, ls="--", label="PandaX-4T (2021)")
ax.plot(m, lam_X1T, color=C_X1T, lw=1.5, ls=":", label="XENON1T (2018)")
hm = np.isfinite(lam_hinv)
ax.fill_between(m[hm], lam_hinv[hm], YMAX, color=C_HINV, alpha=0.18, lw=0,
                label=r"BR($h\to SS$) > 0.107 (ATLAS)")
ax.plot(m[hm], lam_hinv[hm], color=C_HINV, lw=1.5)

ok = np.isfinite(df.lam_planck)
ax.plot(m[ok], df.lam_planck[ok], color=INK, lw=2.2, label=r"$\Omega h^2 = 0.12$ (Planck)")

# which part of the Planck line survives all constraints
allowed = ok & (df.lam_planck < lam_LZ) & (df.lam_planck < lam_hinv)
if allowed.any():
    ax.scatter(m[allowed], df.lam_planck[allowed], s=22, color=INK, zorder=5,
               edgecolor="white", linewidth=1.0, label="Planck & allowed")

ax.set_xscale("log"); ax.set_yscale("log")
ax.set_xlim(10, 1000); ax.set_ylim(YMIN, YMAX)
ax.set_xlabel(r"$m_S$ [GeV]"); ax.set_ylabel(r"$\lambda_{HS}$")
ax.set_title("Scalar Higgs portal: SARAH → SPheno → micrOMEGAs 6.2.3", fontsize=10, color=INK)
ax.text(0.02, 0.02, r"$\mathcal{L}\supset-\frac{\lambda_{HS}}{2}S^2|H|^2$  "
        r"($\lambda_{HS}=2\,$LamSH)", transform=ax.transAxes, fontsize=8, color=MUTED)
ax.grid(which="major", color="#d9d8d0", lw=0.5)
for s in ("top", "right"):
    ax.spines[s].set_visible(False)
ax.legend(loc="lower right", fontsize=8, frameon=True, facecolor="white", edgecolor="#d9d8d0", framealpha=0.95)
fig.tight_layout()

for ext in ("pdf", "png"):
    fig.savefig(os.path.join(HERE, "results", f"fig4_scalar_higgs_portal.{ext}"))
print("saved results/fig4_scalar_higgs_portal.{pdf,png}")

# ---- secondary: sigma_SI along the Planck line vs limits ----
fig2, ax2 = plt.subplots(figsize=(7.2, 5.0), dpi=150)
d = df[ok]
sig = ((Z_XE * np.sqrt(d.sSIp) + (A_XE - Z_XE) * np.sqrt(d.sSIn)) / A_XE) ** 2
ax2.plot(d.m, sig, color=INK, lw=2.2, label=r"$\sigma_{SI}$ on $\Omega h^2=0.12$ line")
ax2.plot(df.m, df.LZ2024, color=C_LZ, lw=1.5, label="LZ 2024")
ax2.plot(df.m, df.PandaX4T, color=C_PX, lw=1.5, ls="--", label="PandaX-4T")
ax2.plot(df.m, df.XENON1T, color=C_X1T, lw=1.5, ls=":", label="XENON1T")
ax2.set_xscale("log"); ax2.set_yscale("log"); ax2.set_xlim(10, 1000)
ax2.set_xlabel(r"$m_S$ [GeV]"); ax2.set_ylabel(r"$\sigma_{SI}$ (per nucleon, Xe) [cm$^2$]")
ax2.grid(which="major", color="#d9d8d0", lw=0.5)
for s in ("top", "right"):
    ax2.spines[s].set_visible(False)
ax2.legend(fontsize=8, frameon=False)
fig2.tight_layout()
fig2.savefig(os.path.join(HERE, "results", "sigmaSI_planck_line.png"))
fig2.savefig(os.path.join(HERE, "results", "sigmaSI_planck_line.pdf"))

print("\nSurviving Planck points (m, lambda_HS):")
print(df.loc[allowed, ["m", "lam_planck", "Omega", "BRinv"]].to_string(index=False))
