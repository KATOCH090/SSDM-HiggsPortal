"""
Singlet-scalar Higgs-portal DM: run one parameter point through
    SPheno (SARAH model SSDM)  ->  micrOMEGAs (project SSDM_HP)

Conventions
-----------
SARAH SSDM Lagrangian:   -L  >  MS2/2 S^2 + LamSH S^2 |H|^2 + LamS/2 S^4
Arcadi et al. (1703.07364) eq. (12), real scalar (xi = 1/2):
                          -L  >  (lambda_HS/2) S^2 |H|^2
    =>  lambda_HS (paper) = 2 * LamSH (SARAH)

SPheno MINPAR 4 ("MSinput") is MS2 in GeV^2, NOT the mass.  Physical mass:
    m_S^2 = MS2 + LamSH v^2 = MS2 + lambda_HS v^2 / 2
"""
import os
import re
import shutil
import subprocess
import tempfile

# Root of your tool installation; override with:  export HEPTOOLS=/path/to/HEPTools
HEPTOOLS = os.environ.get("HEPTOOLS", "/home/rishabh-katoch/HEPTools")
SPHENO_EXE = f"{HEPTOOLS}/SPheno/SSDM/SPhenoSSDM"
TEMPLATE = f"{HEPTOOLS}/SPheno/SSDM/Input_Files/LesHouches.in.SSDM"
if not os.path.exists(TEMPLATE):   # fall back to the copy shipped with this repo
    TEMPLATE = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                            "model", "SPheno", "LesHouches.in.SSDM")
MICRO_EXE = f"{HEPTOOLS}/micromegas_6.2.3/SSDM_HP/main"

V_EW = 246.22      # GeV, as written by SPheno in Block HMIX
LAMBDA_H = 0.26    # Lambda1IN (SM quartic) giving m_h ~ 125 GeV
LAMS = 0.0         # DM self-coupling; irrelevant for freeze-out at tree level

with open(TEMPLATE) as f:
    _TEMPLATE_TXT = f.read()
# One-loop decays off: they recompute m_S^2 = MS2 + LamSH v'^2 with a slightly
# different v', which turns tachyonic when MS2 ~ -LamSH v^2 (light S, large lambda).
# Decays needed for DM physics are computed by micrOMEGAs anyway.
_TEMPLATE_TXT = re.sub(r"(?m)^\s*16\s+1(\s+# One-loop decays)", r" 16 0\1", _TEMPLATE_TXT)
assert " 16 0" in _TEMPLATE_TXT


def lesHouches(m_dm, lam_hs):
    """SPheno input for physical DM mass m_dm (GeV) and paper coupling lam_hs."""
    lamSH = lam_hs / 2.0
    ms2 = m_dm**2 - lamSH * V_EW**2
    minpar = {1: LAMBDA_H, 2: lamSH, 3: LAMS, 4: ms2}
    out, in_minpar = [], False
    for line in _TEMPLATE_TXT.splitlines():
        if re.match(r"\s*Block\s+", line, re.I):
            in_minpar = bool(re.match(r"\s*Block\s+MINPAR\b", line, re.I))
        elif in_minpar:
            m = re.match(r"\s*(\d+)\s+\S+\s*(#.*)?$", line)
            if m and int(m.group(1)) in minpar:
                i = int(m.group(1))
                line = f" {i}   {minpar[i]:.10E}    {m.group(2) or ''}"
        out.append(line)
    return "\n".join(out) + "\n"


_RESULT_RE = re.compile(r"^RESULT (.*)$", re.M)


def run_point(m_dm, lam_hs, keep_dir=None, timeout=300):
    """Return dict of observables (plus inputs); dict['status'] != 0 on failure."""
    res = {"m_in": m_dm, "lam_hs": lam_hs, "status": -1}
    wd = tempfile.mkdtemp(prefix="hp_")
    try:
        with open(os.path.join(wd, "LesHouches.in"), "w") as f:
            f.write(lesHouches(m_dm, lam_hs))
        p = subprocess.run([SPHENO_EXE, "LesHouches.in"], cwd=wd,
                           capture_output=True, text=True, timeout=timeout)
        spc = os.path.join(wd, "SPheno.spc.SSDM")
        if not os.path.exists(spc):
            res["status"] = -2          # SPheno failed
            res["msg"] = p.stdout[-300:]
            return res
        p = subprocess.run([MICRO_EXE], cwd=wd, capture_output=True,
                           text=True, timeout=timeout)
        m = _RESULT_RE.search(p.stdout)
        if not m:
            res["status"] = -3          # micrOMEGAs failed
            res["msg"] = p.stdout[-300:]
            return res
        for kv in m.group(1).split():
            k, v = kv.split("=")
            res[k] = float(v) if k != "status" else int(v)
        return res
    except subprocess.TimeoutExpired:
        res["status"] = -4
        return res
    finally:
        if keep_dir:
            shutil.copytree(wd, keep_dir, dirs_exist_ok=True)
        shutil.rmtree(wd, ignore_errors=True)


if __name__ == "__main__":
    import sys
    m, lam = float(sys.argv[1]), float(sys.argv[2])
    for k, v in run_point(m, lam).items():
        print(f"{k:10s} {v}")
