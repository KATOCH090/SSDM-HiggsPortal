(* ----------------------------------------------------------------------------- *) 
(* This model was automatically created by SARAH version4.15.4  *) 
(* SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 *) 
(* (c) Florian Staub, 2013  *) 
(* ----------------------------------------------------------------------------- *) 
(* File created at 14:50 on 8.11.2025  *) 
(* ---------------------------------------------------------------------- *) 
 
 
LoopContributions[A2q]={
chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][gt2,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][gt2,gt1]},}
(* Ah,Fd, Internal:bar[Fd]*) 
{{Ah,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, Ah][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3]},{mS1 -> M[Ah],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* hh,Fd, Internal:bar[Fd]*) 
{{hh,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, hh][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3]},{mS1 -> M[hh],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* Hp,Fu, Internal:bar[Fd]*) 
{{Hp,Fu,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][i3,i2],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3]},{mS1 -> M[Hp],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* VWp,Fu, Internal:bar[Fd]*) 
{{VWp,Fu,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][i3,i2],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3]},{mV1 -> M[VWp],mF1 -> M[Fu][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* VZ,Fd, Internal:bar[Fd]*) 
{{VZ,Fd,Internal->bar[Fd]},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][i3,i2],coup2R -> Cp[bar[Fd], Fd, VZ][R][i3,i2],coup3L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup3R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3]},{mV1 -> M[VZ],mF1 -> M[Fd][i2],MFin -> M[Fd][i3]-M[Fd][gt1]}},
(* Fd,Ah, Internal:Fd*) 
{{Fd,Ah,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, Ah][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, Ah][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, Ah][R][gt2,i1]},{mF1 -> M[Fd][i1],mS1 -> M[Ah],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fd,hh, Internal:Fd*) 
{{Fd,hh,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, hh][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, hh][R][gt2,i1]},{mF1 -> M[Fd][i1],mS1 -> M[hh],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fu,Hp, Internal:Fd*) 
{{Fu,Hp,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1],coup2L -> Cp[bar[Fu], Fd, Hp][L][i1,i3],coup2R -> Cp[bar[Fu], Fd, Hp][R][i1,i3],coup1L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i1],coup1R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i1]},{mF1 -> M[Fu][i1],mS1 -> M[Hp],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fu,VWp, Internal:Fd*) 
{{Fu,VWp,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1],coup2L -> Cp[bar[Fu], Fd, VWp][L][i1,i3],coup2R -> Cp[bar[Fu], Fd, VWp][R][i1,i3],coup1L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i1],coup1R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i1]},{mF1 -> M[Fu][i1],mV1 -> M[VWp],MFin -> M[Fd][i3]-M[Fd][gt2]}},
(* Fd,VZ, Internal:Fd*) 
{{Fd,VZ,Internal->Fd},chargefactor -> 1,{coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,gt1],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][i1,i3],coup2R -> Cp[bar[Fd], Fd, VZ][R][i1,i3],coup1L -> Cp[bar[Fd], Fd, VZ][L][gt2,i1],coup1R -> Cp[bar[Fd], Fd, VZ][R][gt2,i1]},{mF1 -> M[Fd][i1],mV1 -> M[VZ],MFin -> M[Fd][i3]-M[Fd][gt2]}}
(* Ah,Fd,Fd*) 
{{Ah,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, Ah][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2]},},
(* hh,Fd,Fd*) 
{{hh,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2]},},
(* Hp,Fu,Fu*) 
{{Hp,Fu,Fu},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i3],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i3],coup3L -> Cp[bar[Fu], Fu, Ah][L][i3,i2],coup3R -> Cp[bar[Fu], Fu, Ah][R][i3,i2]},},
(* VWp,Fu,Fu*) 
{{VWp,Fu,Fu},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i2,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i2,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i3],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i3],coup3L -> Cp[bar[Fu], Fu, Ah][L][i3,i2],coup3R -> Cp[bar[Fu], Fu, Ah][R][i3,i2]},},
(* VZ,Fd,Fd*) 
{{VZ,Fd,Fd},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i2,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i2,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][gt2,i3],coup2R -> Cp[bar[Fd], Fd, VZ][R][gt2,i3],coup3L -> Cp[bar[Fd], Fd, Ah][L][i3,i2],coup3R -> Cp[bar[Fd], Fd, Ah][R][i3,i2]},},
(* bar[Fd],hh,Ah*) 
{{bar[Fd],hh,Ah},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, Ah][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, Ah][R][gt2,i1],coup3 -> Cp[Ah, Ah, hh]},},
(* bar[Fd],Ah,hh*) 
{{bar[Fd],Ah,hh},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, Ah][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, Ah][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1],coup3 -> Cp[Ah, Ah, hh]},},
(* bar[Fd],VZ,hh*) 
{{bar[Fd],VZ,hh},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, VZ][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, VZ][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, hh][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, hh][R][gt2,i1],coup3 -> Cp[Ah, hh, VZ]},},
(* bar[Fd],hh,VZ*) 
{{bar[Fd],hh,VZ},chargefactor -> 1,{coup1L -> Cp[bar[Fd], Fd, hh][L][i1,gt1],coup1R -> Cp[bar[Fd], Fd, hh][R][i1,gt1],coup2L -> Cp[bar[Fd], Fd, VZ][L][gt2,i1],coup2R -> Cp[bar[Fd], Fd, VZ][R][gt2,i1],coup3 -> Cp[Ah, hh, VZ]},},
(* bar[Fu],conj[VWp],conj[Hp]*) 
{{bar[Fu],conj[VWp],conj[Hp]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, VWp][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, VWp][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, conj[Hp]][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, conj[Hp]][R][gt2,i1],coup3 -> Cp[Ah, Hp, conj[VWp]]},},
(* bar[Fu],conj[Hp],conj[VWp]*) 
{{bar[Fu],conj[Hp],conj[VWp]},chargefactor -> 1,{coup1L -> Cp[bar[Fu], Fd, Hp][L][i1,gt1],coup1R -> Cp[bar[Fu], Fd, Hp][R][i1,gt1],coup2L -> Cp[bar[Fd], Fu, conj[VWp]][L][gt2,i1],coup2R -> Cp[bar[Fd], Fu, conj[VWp]][R][gt2,i1],coup3 -> Cp[Ah, conj[Hp], VWp]},}
};