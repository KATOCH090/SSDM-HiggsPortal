/*
  Singlet scalar Higgs-portal DM (SARAH model SSDM) -- single-point evaluation.

  Reads ./SPheno.spc.SSDM (path hard-coded in work/models/func1.mdl by SARAH),
  so run this executable from the directory containing the spectrum file.

  Usage:  ./main [dummy.par]      (the argument is optional)

  Output: one "RESULT key=value ..." line, easy to parse from a scan driver,
  preceded by human-readable diagnostics.

  Units: masses GeV, cross sections cm^2, <sigma v> cm^3/s, widths GeV.
*/
#include"../include/micromegas.h"
#include"../include/micromegas_aux.h"
#include"lib/pmodel.h"

#define PB2CM2 1.0E-36

int main(int argc,char** argv)
{
  int err;
  char cdmName[10];

  ForceUG=0;
  VZdecay=1; VWdecay=1;   /* include off-shell W*,Z* (3-body) final states below threshold */

  if(argc>1)
  { err=readVar(argv[1]);
    if(err==-1)    { printf("Can not open the file\n"); return 1; }
    else if(err>0) { printf("Wrong file contents at line %d\n",err); return 1; }
  }

  err=sortOddParticles(cdmName);
  if(err) { printf("Can't calculate %s\n",cdmName); printf("RESULT status=%d\n",err); return 1; }

  double Mdm=McdmN[1];
  double Mh=findValW("Mh");
  double LSH=findValW("LSH");

  /* ---------------- relic density (freeze-out) ---------------- */
  int fast=1; double Beps=1.E-4, Xf;
  double Omega=darkOmega(&Xf,fast,Beps,&err);
  printf("\nMdm=%.4E  Omega h^2=%.4E  Xf=%.3E\n",Mdm,Omega,Xf);
  if(Omega>0) printChannels(Xf,0.01,Beps,1,stdout);

  /* ---------------- direct detection: nucleon SI ---------------- */
  double pA0[2],pA5[2],nA0[2],nA5[2];
  double Nmass=0.939;
  nucleonAmplitudes(CDM[1],pA0,pA5,nA0,nA5);
  double SCcoeff=4/M_PI*3.8937966E8*pow(Nmass*Mdm/(Nmass+Mdm),2.);   /* -> pb */
  double sSIp=SCcoeff*pA0[0]*pA0[0]*PB2CM2;
  double sSIn=SCcoeff*nA0[0]*nA0[0]*PB2CM2;

  /* experimental 90% CL SI limits (cm^2) shipped with micrOMEGAs */
  double limLZ24 = LZ_2024(Mdm);
  double limXe1T = XENON1T_90(Mdm);
  double limPX4T = PandaX4T(Mdm);

  /* ---------------- indirect detection: <sigma v> today ---------------- */
  double SpA[NZ],SpE[NZ],SpP[NZ],SpNe[NZ],SpNm[NZ],SpNl[NZ];
  double sigmaV=calcSpectrum(4,SpA,SpE,SpP,SpNe,SpNm,SpNl,&err);   /* cm^3/s */

  /* ---------------- Higgs invisible decay ---------------- */
  txtList L;
  double wh=pWidth("h",&L);
  double BRinv = (2*Mdm<Mh) ? findBr(L,"~Ss,~Ss") : 0.;

  printf("\nsigma_SI(p)=%.3E cm^2  sigma_SI(n)=%.3E cm^2\n",sSIp,sSIn);
  printf("LZ2024 limit=%.3E  XENON1T limit=%.3E  PandaX4T limit=%.3E cm^2\n",limLZ24,limXe1T,limPX4T);
  printf("<sigma v>_0=%.3E cm^3/s   Gamma_h=%.3E GeV  BR(h->SS)=%.3E\n",sigmaV,wh,BRinv);

  printf("RESULT status=0 Mdm=%.8E Mh=%.8E LamSH=%.8E Omega=%.8E Xf=%.6E "
         "sSIp=%.6E sSIn=%.6E sigmaV=%.6E Gh=%.6E BRinv=%.6E "
         "LZ2024=%.6E XENON1T=%.6E PandaX4T=%.6E\n",
         Mdm,Mh,LSH,Omega,Xf,sSIp,sSIn,sigmaV,wh,BRinv,limLZ24,limXe1T,limPX4T);

  killPlots();
  return 0;
}
