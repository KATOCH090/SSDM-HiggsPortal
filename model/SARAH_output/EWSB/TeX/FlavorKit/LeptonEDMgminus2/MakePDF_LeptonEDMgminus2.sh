#!/bin/bash 
pdflatex Observable_LeptonEDMgminus2.tex 
cd Diagrams 
find . -name "*.mp" -exec mpost {} \; 
cd .. 
pdflatex  Observable_LeptonEDMgminus2.tex 
echo "" 
echo "PDF for Observable LeptonEDMgminus2 finished" 
echo "Thanks for using SARAH" 
echo "" 
