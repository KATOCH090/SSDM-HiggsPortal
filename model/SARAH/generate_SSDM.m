(* Regenerate all SARAH output for the SSDM model.
   Usage:  math -script generate_SSDM.m      (or evaluate in a notebook)
   Requires model/SARAH/*.m copied to $HEPTOOLS/SARAH-4.15.4/Models/SSDM/ *)
heptools = Environment["HEPTOOLS"];
If[heptools === $Failed, heptools = "/home/rishabh-katoch/HEPTools"];
Get[FileNameJoin[{heptools, "SARAH-4.15.4", "SARAH.m"}]];
Start["SSDM"];
MakeSPheno[];   (* -> Output/SSDM/EWSB/SPheno  *)
MakeCHep[];     (* -> Output/SSDM/EWSB/CHep    (micrOMEGAs) *)
MakeUFO[];      (* -> Output/SSDM/EWSB/UFO     (MadGraph)   *)
MakeTeX[];      (* -> Output/SSDM/EWSB/TeX     (Feynman rules, pdf) *)
