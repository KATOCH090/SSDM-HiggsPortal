(* ----------------------------------------------------------------------------- *) 
(* This model was automatically created by SARAH version4.15.4  *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 *) 
(* (c) Florian Staub, 2013  *) 
(* ----------------------------------------------------------------------------- *) 
(* File created at 14:50 on 8.11.2025  *) 
(* ---------------------------------------------------------------------- *) 
 
 
LoopContributions[LeptonEDMgminus2]={
chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, VP][L][gt1,gt2],coup1R -> Cp[bar[Fe], Fe, VP][R][gt1,gt2]},}
(* Ah,bar[Fe], Internal:Fe*) 
{{Ah,bar[Fe],Internal->Fe},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, Ah][L][gt1,i2],coup1R -> Cp[bar[Fe], Fe, Ah][R][gt1,i2],coup2L -> Cp[bar[Fe], Fe, Ah][L][i2,i3],coup2R -> Cp[bar[Fe], Fe, Ah][R][i2,i3],coup3L -> Cp[bar[Fe], Fe, VP][L][i3,gt2],coup3R -> Cp[bar[Fe], Fe, VP][R][i3,gt2]},{mS1 -> M[Ah],mF1 -> M[Fe][i2],MFin -> M[Fe][i3]-M[Fe][gt1]}},
(* Fe,hh, Internal:Fe*) 
{{Fe,hh,Internal->Fe},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, hh][L][gt1,i1],coup1R -> Cp[bar[Fe], Fe, hh][R][gt1,i1],coup2L -> Cp[bar[Fe], Fe, hh][L][i1,i3],coup2R -> Cp[bar[Fe], Fe, hh][R][i1,i3],coup3L -> Cp[bar[Fe], Fe, VP][L][i3,gt2],coup3R -> Cp[bar[Fe], Fe, VP][R][i3,gt2]},{mF1 -> M[Fe][i1],mS1 -> M[hh],MFin -> M[Fe][i3]-M[Fe][gt1]}},
(* Fe,VZ, Internal:Fe*) 
{{Fe,VZ,Internal->Fe},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, VZ][L][gt1,i1],coup1R -> Cp[bar[Fe], Fe, VZ][R][gt1,i1],coup2L -> Cp[bar[Fe], Fe, VZ][L][i1,i3],coup2R -> Cp[bar[Fe], Fe, VZ][R][i1,i3],coup3L -> Cp[bar[Fe], Fe, VP][L][i3,gt2],coup3R -> Cp[bar[Fe], Fe, VP][R][i3,gt2]},{mF1 -> M[Fe][i1],mV1 -> M[VZ],MFin -> M[Fe][i3]-M[Fe][gt1]}},
(* Fv,Hp, Internal:Fe*) 
{{Fv,Hp,Internal->Fe},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[Hp]][L][gt1,i1],coup1R -> Cp[bar[Fe], Fv, conj[Hp]][R][gt1,i1],coup2L -> Cp[bar[Fv], Fe, Hp][L][i1,i3],coup2R -> Cp[bar[Fv], Fe, Hp][R][i1,i3],coup3L -> Cp[bar[Fe], Fe, VP][L][i3,gt2],coup3R -> Cp[bar[Fe], Fe, VP][R][i3,gt2]},{mF1 -> 0,mS1 -> M[Hp],MFin -> M[Fe][i3]-M[Fe][gt1]}},
(* Fv,VWp, Internal:Fe*) 
{{Fv,VWp,Internal->Fe},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[VWp]][L][gt1,i1],coup1R -> Cp[bar[Fe], Fv, conj[VWp]][R][gt1,i1],coup2L -> Cp[bar[Fv], Fe, VWp][L][i1,i3],coup2R -> Cp[bar[Fv], Fe, VWp][R][i1,i3],coup3L -> Cp[bar[Fe], Fe, VP][L][i3,gt2],coup3R -> Cp[bar[Fe], Fe, VP][R][i3,gt2]},{mF1 -> 0,mV1 -> M[VWp],MFin -> M[Fe][i3]-M[Fe][gt1]}},
(* bar[Fe],Ah, Internal:bar[Fe]*) 
{{bar[Fe],Ah,Internal->bar[Fe]},chargefactor -> 1,{coup3L -> Cp[bar[Fe], Fe, VP][L][gt1,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][gt1,i3],coup2L -> Cp[bar[Fe], Fe, Ah][L][i3,i1],coup2R -> Cp[bar[Fe], Fe, Ah][R][i3,i1],coup1L -> Cp[bar[Fe], Fe, Ah][L][i1,gt2],coup1R -> Cp[bar[Fe], Fe, Ah][R][i1,gt2]},{mF1 -> M[Fe][i1],mS1 -> M[Ah],MFin -> M[Fe][i3]-M[Fe][gt2]}},
(* hh,Fe, Internal:bar[Fe]*) 
{{hh,Fe,Internal->bar[Fe]},chargefactor -> 1,{coup3L -> Cp[bar[Fe], Fe, VP][L][gt1,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][gt1,i3],coup2L -> Cp[bar[Fe], Fe, hh][L][i3,i2],coup2R -> Cp[bar[Fe], Fe, hh][R][i3,i2],coup1L -> Cp[bar[Fe], Fe, hh][L][i2,gt2],coup1R -> Cp[bar[Fe], Fe, hh][R][i2,gt2]},{mS1 -> M[hh],mF1 -> M[Fe][i2],MFin -> M[Fe][i3]-M[Fe][gt2]}},
(* VZ,Fe, Internal:bar[Fe]*) 
{{VZ,Fe,Internal->bar[Fe]},chargefactor -> 1,{coup3L -> Cp[bar[Fe], Fe, VP][L][gt1,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][gt1,i3],coup2L -> Cp[bar[Fe], Fe, VZ][L][i3,i2],coup2R -> Cp[bar[Fe], Fe, VZ][R][i3,i2],coup1L -> Cp[bar[Fe], Fe, VZ][L][i2,gt2],coup1R -> Cp[bar[Fe], Fe, VZ][R][i2,gt2]},{mV1 -> M[VZ],mF1 -> M[Fe][i2],MFin -> M[Fe][i3]-M[Fe][gt2]}},
(* Hp,Fv, Internal:bar[Fe]*) 
{{Hp,Fv,Internal->bar[Fe]},chargefactor -> 1,{coup3L -> Cp[bar[Fe], Fe, VP][L][gt1,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][gt1,i3],coup2L -> Cp[bar[Fe], Fv, conj[Hp]][L][i3,i2],coup2R -> Cp[bar[Fe], Fv, conj[Hp]][R][i3,i2],coup1L -> Cp[bar[Fv], Fe, Hp][L][i2,gt2],coup1R -> Cp[bar[Fv], Fe, Hp][R][i2,gt2]},{mS1 -> M[Hp],mF1 -> 0,MFin -> M[Fe][i3]-M[Fe][gt2]}},
(* VWp,Fv, Internal:bar[Fe]*) 
{{VWp,Fv,Internal->bar[Fe]},chargefactor -> 1,{coup3L -> Cp[bar[Fe], Fe, VP][L][gt1,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][gt1,i3],coup2L -> Cp[bar[Fe], Fv, conj[VWp]][L][i3,i2],coup2R -> Cp[bar[Fe], Fv, conj[VWp]][R][i3,i2],coup1L -> Cp[bar[Fv], Fe, VWp][L][i2,gt2],coup1R -> Cp[bar[Fv], Fe, VWp][R][i2,gt2]},{mV1 -> M[VWp],mF1 -> 0,MFin -> M[Fe][i3]-M[Fe][gt2]}}
(* Ah,bar[Fe],bar[Fe]*) 
{{Ah,bar[Fe],bar[Fe]},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, Ah][L][gt1,i2],coup1R -> Cp[bar[Fe], Fe, Ah][R][gt1,i2],coup2L -> Cp[bar[Fe], Fe, Ah][L][i3,gt2],coup2R -> Cp[bar[Fe], Fe, Ah][R][i3,gt2],coup3L -> Cp[bar[Fe], Fe, VP][L][i2,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][i2,i3]},},
(* Fv,Hp,Hp*) 
{{Fv,Hp,Hp},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[Hp]][L][gt1,i1],coup1R -> Cp[bar[Fe], Fv, conj[Hp]][R][gt1,i1],coup2L -> Cp[bar[Fv], Fe, Hp][L][i1,gt2],coup2R -> Cp[bar[Fv], Fe, Hp][R][i1,gt2],coup3 -> Cp[Hp, conj[Hp], VP]},},
(* Fv,VWp,Hp*) 
{{Fv,VWp,Hp},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[VWp]][L][gt1,i1],coup1R -> Cp[bar[Fe], Fv, conj[VWp]][R][gt1,i1],coup2L -> Cp[bar[Fv], Fe, Hp][L][i1,gt2],coup2R -> Cp[bar[Fv], Fe, Hp][R][i1,gt2],coup3 -> Cp[conj[Hp], VP, VWp]},},
(* Fv,Hp,VWp*) 
{{Fv,Hp,VWp},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[Hp]][L][gt1,i1],coup1R -> Cp[bar[Fe], Fv, conj[Hp]][R][gt1,i1],coup2L -> Cp[bar[Fv], Fe, VWp][L][i1,gt2],coup2R -> Cp[bar[Fv], Fe, VWp][R][i1,gt2],coup3 -> Cp[Hp, conj[VWp], VP]},},
(* Fv,VWp,VWp*) 
{{Fv,VWp,VWp},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[VWp]][L][gt1,i1],coup1R -> Cp[bar[Fe], Fv, conj[VWp]][R][gt1,i1],coup2L -> Cp[bar[Fv], Fe, VWp][L][i1,gt2],coup2R -> Cp[bar[Fv], Fe, VWp][R][i1,gt2],coup3 -> Cp[conj[VWp], VP, VWp]},},
(* hh,bar[Fe],bar[Fe]*) 
{{hh,bar[Fe],bar[Fe]},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, hh][L][gt1,i2],coup1R -> Cp[bar[Fe], Fe, hh][R][gt1,i2],coup2L -> Cp[bar[Fe], Fe, hh][L][i3,gt2],coup2R -> Cp[bar[Fe], Fe, hh][R][i3,gt2],coup3L -> Cp[bar[Fe], Fe, VP][L][i2,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][i2,i3]},},
(* VZ,bar[Fe],bar[Fe]*) 
{{VZ,bar[Fe],bar[Fe]},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fe, VZ][L][gt1,i2],coup1R -> Cp[bar[Fe], Fe, VZ][R][gt1,i2],coup2L -> Cp[bar[Fe], Fe, VZ][L][i3,gt2],coup2R -> Cp[bar[Fe], Fe, VZ][R][i3,gt2],coup3L -> Cp[bar[Fe], Fe, VP][L][i2,i3],coup3R -> Cp[bar[Fe], Fe, VP][R][i2,i3]},}
};