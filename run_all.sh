#!/bin/bash
# =============================================================================
#  Singlet-scalar Higgs-portal DM: full automated pipeline
#     SARAH output -> SPheno -> micrOMEGAs -> scans -> plots
#
#  Usage:   ./run_all.sh [NPROC] [NRANDOM]
#           NPROC   parallel workers        (default: all cores)
#           NRANDOM random-scan points      (default: 2000)
#
#  Steps:
#   1. (re)build micrOMEGAs project SSDM_HP from SARAH's CalcHEP output
#   2. sanity check one benchmark point
#   3. Planck-curve scan  (lambda giving Omega h^2 = 0.12 per mass)
#   4. random (m_S, lambda_HS) scan
#   5. all plots into results/
# =============================================================================
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HEPTOOLS="${HEPTOOLS:-/home/rishabh-katoch/HEPTools}"   # override: export HEPTOOLS=/path
# CalcHEP model files: SARAH output if present, else the copy shipped in this repo
SARAH_CHEP="$HEPTOOLS/SARAH-4.15.4/Output/SSDM/EWSB/CHep"
[ -d "$SARAH_CHEP" ] || SARAH_CHEP="$HERE/model/CalcHEP"
MO="$HEPTOOLS/micromegas_6.2.3"
PROJ="$MO/SSDM_HP"
SPHENO="$HEPTOOLS/SPheno/SSDM/SPhenoSSDM"

NPROC="${1:-$(nproc)}"
NRANDOM="${2:-2000}"

cd "$HERE"
mkdir -p results logs

echo "== [1/5] micrOMEGAs project $PROJ"
[ -x "$SPHENO" ] || { echo "SPheno executable not found: $SPHENO"; exit 1; }
if [ ! -d "$PROJ" ]; then
    (cd "$MO" && ./newProject SSDM_HP)
    rm -f "$PROJ/main.cpp"
fi
# always use the unmodified SARAH model files (MSs read from the SLHA spectrum)
cp "$SARAH_CHEP"/*.mdl "$PROJ/work/models/"
cp "$HERE/micromegas_main/main.c" "$PROJ/main.c"
(cd "$PROJ" && make main=main.c > "$HERE/logs/build.log" 2>&1) \
    || { echo "micrOMEGAs build failed, see logs/build.log"; exit 1; }

echo "== [2/5] benchmark point m_S=114.15 GeV, lambda_HS=0.1"
python3 hp_tools.py 114.15 0.1 | tee logs/benchmark.log
grep -q "status     0" logs/benchmark.log || { echo "benchmark failed"; exit 1; }

echo "== [3/5] Planck-curve scan ($NPROC workers)"
python3 scan_planck.py "$NPROC" | tee logs/scan_planck.log

echo "== [4/5] random scan: $NRANDOM points"
rm -f results/random_scan.csv
python3 scan_random.py "$NRANDOM" "$NPROC" 1 | tee logs/scan_random.log

echo "== [5/5] plots"
python3 plot_fig4.py    | tee logs/plots.log
python3 plot_scatter.py | tee -a logs/plots.log

echo
echo "Done. Plots and CSV files are in $HERE/results/"
ls -1 results/
