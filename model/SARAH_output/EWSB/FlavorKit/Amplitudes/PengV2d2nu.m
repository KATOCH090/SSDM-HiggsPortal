(* ----------------------------------------------------------------------------- *) 
(* This model was automatically created by SARAH version4.15.4  *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 *) 
(* (c) Florian Staub, 2013  *) 
(* ----------------------------------------------------------------------------- *) 
(* File created at 14:50 on 8.11.2025  *) 
(* ---------------------------------------------------------------------- *) 
 
 
LoopContributions[PengV2d2nu]={
(* Ah,Fd, Internal:bar[Fd], Propagator: VZ*) 
{{Ah,Fd, Internal->bar[Fd], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, Ah][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mS1 -> M[Ah],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1],MP -> M[VZ]}},
(* hh,Fd, Internal:bar[Fd], Propagator: VZ*) 
{{hh,Fd, Internal->bar[Fd], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, hh][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mS1 -> M[hh],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1],MP -> M[VZ]}},
(* Hp,Fu, Internal:bar[Fd], Propagator: VZ*) 
{{Hp,Fu, Internal->bar[Fd], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][i3,i2],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mS1 -> M[Hp],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt1],MP -> M[VZ]}},
(* VWp,Fu, Internal:bar[Fd], Propagator: VZ*) 
{{VWp,Fu, Internal->bar[Fd], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][i3,i2],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mV1 -> M[VWp],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt1],MP -> M[VZ]}},
(* VZ,Fd, Internal:bar[Fd], Propagator: VZ*) 
{{VZ,Fd, Internal->bar[Fd], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, VZ][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mV1 -> M[VZ],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1],MP -> M[VZ]}},
(* Fd,Ah, Internal:Fd, Propagator: VZ*) 
{{Fd,Ah, Internal->Fd, Propagator ->VZ},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, Ah][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, Ah][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, Ah][R][gt2,i1],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mF1 -> M[Fd][i1],mS1 -> M[Ah],MFin -> M[Fd][i3]-M[Fd][gt2],MP -> M[VZ]}},
(* Fd,hh, Internal:Fd, Propagator: VZ*) 
{{Fd,hh, Internal->Fd, Propagator ->VZ},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, hh][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, hh][R][gt2,i1],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mF1 -> M[Fd][i1],mS1 -> M[hh],MFin -> M[Fd][i3]-M[Fd][gt2],MP -> M[VZ]}},
(* Fu,Hp, Internal:Fd, Propagator: VZ*) 
{{Fu,Hp, Internal->Fd, Propagator ->VZ},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,gt1],coup2L -> Cp[bar[Fu], Fd, Hp][L][i1,i3],coup2R -> Cp[bar[Fu], Fd, Hp][R][i1,i3],coup1L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i1],coup1R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i1],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mF1 -> M[Fu][i1],mS1 -> M[Hp],MFin -> M[Fd][i3]-M[Fd][gt2],MP -> M[VZ]}},
(* Fu,VWp, Internal:Fd, Propagator: VZ*) 
{{Fu,VWp, Internal->Fd, Propagator ->VZ},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,gt1],coup2L -> Cp[bar[Fu], Fd, VWp][L][i1,i3],coup2R -> Cp[bar[Fu], Fd, VWp][R][i1,i3],coup1L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i1],coup1R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i1],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mF1 -> M[Fu][i1],mV1 -> M[VWp],MFin -> M[Fd][i3]-M[Fd][gt2],MP -> M[VZ]}},
(* Fd,VZ, Internal:Fd, Propagator: VZ*) 
{{Fd,VZ, Internal->Fd, Propagator ->VZ},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, VZ][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, VZ][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, VZ][R][gt2,i1],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},{mF1 -> M[Fd][i1],mV1 -> M[VZ],MFin -> M[Fd][i3]-M[Fd][gt2],MP -> M[VZ]}}
(* Ah,Fd,Fd, Propagator: VZ*) 
{{Ah,Fd,Fd, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,i2],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,i2],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* hh,Fd,Fd, Propagator: VZ*) 
{{hh,Fd,Fd, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,i2],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,i2],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* Hp,Fu,Fu, Propagator: VZ*) 
{{Hp,Fu,Fu, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i3],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i3],coup3L -> Cp[bar[Fu], Fu, VZ][L][i3,i2],coup3R -> Cp[bar[Fu], Fu, VZ][R][i3,i2],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* VWp,Fu,Fu, Propagator: VZ*) 
{{VWp,Fu,Fu, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i3],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i3],coup3L -> Cp[bar[Fu], Fu, VZ][L][i3,i2],coup3R -> Cp[bar[Fu], Fu, VZ][R][i3,i2],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* VZ,Fd,Fd, Propagator: VZ*) 
{{VZ,Fd,Fd, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, VZ][L][i3,i2],coup3R -> Cp[bar[Fd], Fd, VZ][R][i3,i2],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fd],hh,Ah, Propagator: VZ*) 
{{bar[Fd],hh,Ah, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, Ah][R][gt2,i1],coup3 -> Cp[Ah, hh, VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fd],Ah,hh, Propagator: VZ*) 
{{bar[Fd],Ah,hh, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1],coup3 -> Cp[Ah, hh, VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fd],VZ,hh, Propagator: VZ*) 
{{bar[Fd],VZ,hh, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1],coup3 -> Cp[hh, VZ, VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fd],hh,VZ, Propagator: VZ*) 
{{bar[Fd],hh,VZ, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, VZ][R][gt2,i1],coup3 -> Cp[hh, VZ, VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fu],conj[Hp],conj[Hp], Propagator: VZ*) 
{{bar[Fu],conj[Hp],conj[Hp], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i1],coup3 -> Cp[Hp, conj[Hp], VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fu],conj[VWp],conj[Hp], Propagator: VZ*) 
{{bar[Fu],conj[VWp],conj[Hp], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i1],coup3 -> Cp[Hp, conj[VWp], VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fu],conj[Hp],conj[VWp], Propagator: VZ*) 
{{bar[Fu],conj[Hp],conj[VWp], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i1],coup3 -> Cp[conj[Hp], VWp, VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fu],conj[VWp],conj[VWp], Propagator: VZ*) 
{{bar[Fu],conj[VWp],conj[VWp], Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i1],coup3 -> Cp[conj[VWp], VWp, VZ],coup4L -> Cp[bar[Fv], Fv, VZ][L][gt4,gt3],coup4R -> Cp[bar[Fv], Fv, VZ][R][gt4,gt3]},MP -> M[VZ],},
(* bar[Fe],Hp,Hp, Propagator: VZ*) 
{{bar[Fe],Hp,Hp, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[Hp]][L][i1,gt3],coup1R -> Cp[bar[Fe], Fv, conj[Hp]][R][i1,gt3],coup2L -> Cp[bar[Fv], Fe, Hp][L][gt4,i1],coup2R -> Cp[bar[Fv], Fe, Hp][R][gt4,i1],coup3 -> Cp[Hp, conj[Hp], VZ],coup4L -> Cp[bar[Fd], Fd, VZ][L][gt2,gt1],coup4R -> Cp[bar[Fd], Fd, VZ][R][gt2,gt1]},MP -> M[VZ],},
(* bar[Fe],VWp,Hp, Propagator: VZ*) 
{{bar[Fe],VWp,Hp, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[VWp]][L][i1,gt3],coup1R -> Cp[bar[Fe], Fv, conj[VWp]][R][i1,gt3],coup2L -> Cp[bar[Fv], Fe, Hp][L][gt4,i1],coup2R -> Cp[bar[Fv], Fe, Hp][R][gt4,i1],coup3 -> Cp[conj[Hp], VWp, VZ],coup4L -> Cp[bar[Fd], Fd, VZ][L][gt2,gt1],coup4R -> Cp[bar[Fd], Fd, VZ][R][gt2,gt1]},MP -> M[VZ],},
(* bar[Fe],Hp,VWp, Propagator: VZ*) 
{{bar[Fe],Hp,VWp, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[Hp]][L][i1,gt3],coup1R -> Cp[bar[Fe], Fv, conj[Hp]][R][i1,gt3],coup2L -> Cp[bar[Fv], Fe, VWp][L][gt4,i1],coup2R -> Cp[bar[Fv], Fe, VWp][R][gt4,i1],coup3 -> Cp[Hp, conj[VWp], VZ],coup4L -> Cp[bar[Fd], Fd, VZ][L][gt2,gt1],coup4R -> Cp[bar[Fd], Fd, VZ][R][gt2,gt1]},MP -> M[VZ],},
(* bar[Fe],VWp,VWp, Propagator: VZ*) 
{{bar[Fe],VWp,VWp, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[VWp]][L][i1,gt3],coup1R -> Cp[bar[Fe], Fv, conj[VWp]][R][i1,gt3],coup2L -> Cp[bar[Fv], Fe, VWp][L][gt4,i1],coup2R -> Cp[bar[Fv], Fe, VWp][R][gt4,i1],coup3 -> Cp[conj[VWp], VWp, VZ],coup4L -> Cp[bar[Fd], Fd, VZ][L][gt2,gt1],coup4R -> Cp[bar[Fd], Fd, VZ][R][gt2,gt1]},MP -> M[VZ],},
(* conj[Hp],Fe,Fe, Propagator: VZ*) 
{{conj[Hp],Fe,Fe, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[Hp]][L][i2,gt3],coup1R -> Cp[bar[Fe], Fv, conj[Hp]][R][i2,gt3],coup2L -> Cp[bar[Fv], Fe, Hp][L][gt4,i3],coup2R -> Cp[bar[Fv], Fe, Hp][R][gt4,i3],coup3L -> Cp[bar[Fe], Fe, VZ][L][i3,i2],coup3R -> Cp[bar[Fe], Fe, VZ][R][i3,i2],coup4L -> Cp[bar[Fd], Fd, VZ][L][gt2,gt1],coup4R -> Cp[bar[Fd], Fd, VZ][R][gt2,gt1]},MP -> M[VZ],},
(* conj[VWp],Fe,Fe, Propagator: VZ*) 
{{conj[VWp],Fe,Fe, Propagator ->VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fe], Fv, conj[VWp]][L][i2,gt3],coup1R -> Cp[bar[Fe], Fv, conj[VWp]][R][i2,gt3],coup2L -> Cp[bar[Fv], Fe, VWp][L][gt4,i3],coup2R -> Cp[bar[Fv], Fe, VWp][R][gt4,i3],coup3L -> Cp[bar[Fe], Fe, VZ][L][i3,i2],coup3R -> Cp[bar[Fe], Fe, VZ][R][i3,i2],coup4L -> Cp[bar[Fd], Fd, VZ][L][gt2,gt1],coup4R -> Cp[bar[Fd], Fd, VZ][R][gt2,gt1]},MP -> M[VZ],}
};