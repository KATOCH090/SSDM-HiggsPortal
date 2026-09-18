! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.4 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:49 on 8.11.2025   
! ----------------------------------------------------------------------  
 
 
Module RGEs_SSDM 
 
Use Control 
Use Settings 
Use Model_Data_SSDM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters66(g,g1,g2,g3,LS,LSH,Lam,Yu,Yd,Ye,MS2,mu2)

Implicit None 
Real(dp), Intent(in) :: g(66) 
Real(dp),Intent(out) :: g1,g2,g3,MS2

Complex(dp),Intent(out) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters66' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
LS= Cmplx(g(4),g(5),dp) 
LSH= Cmplx(g(6),g(7),dp) 
Lam= Cmplx(g(8),g(9),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+10), g(SumI+11), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+28), g(SumI+29), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+46), g(SumI+47), dp) 
End Do 
 End Do 
 
MS2= g(64) 
mu2= Cmplx(g(65),g(66),dp) 
Do i1=1,66 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters66

Subroutine ParametersToG66(g1,g2,g3,LS,LSH,Lam,Yu,Yd,Ye,MS2,mu2,g)

Implicit None 
Real(dp), Intent(out) :: g(66) 
Real(dp), Intent(in) :: g1,g2,g3,MS2

Complex(dp), Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG66' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(LS,dp)  
g(5) = Aimag(LS)  
g(6) = Real(LSH,dp)  
g(7) = Aimag(LSH)  
g(8) = Real(Lam,dp)  
g(9) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+10) = Real(Yu(i1,i2), dp) 
g(SumI+11) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+28) = Real(Yd(i1,i2), dp) 
g(SumI+29) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+46) = Real(Ye(i1,i2), dp) 
g(SumI+47) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(64) = MS2  
g(65) = Real(mu2,dp)  
g(66) = Aimag(mu2)  
Iname = Iname - 1 
 
End Subroutine ParametersToG66

Subroutine rge66(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,MS2,betaMS21,betaMS22,DMS2
Complex(dp) :: LS,betaLS1,betaLS2,DLS,LSH,betaLSH1,betaLSH2,DLSH,Lam,betaLam1,        & 
& betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)            & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3),mu2,betamu21,betamu22,Dmu2
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YuadjYu(3,3),adjYdYd(3,3),adjYeYe(3,3),adjYuYu(3,3),        & 
& YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YuadjYdYd(3,3),YuadjYuYu(3,3),            & 
& adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYuYuadjYu(3,3),YdadjYdYdadjYd(3,3),             & 
& YeadjYeYeadjYe(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYdadjYdYdadjYd,TrYeadjYeYeadjYe,TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lamp2,LSp2,LSHp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge66' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters66(gy,g1,g2,g3,LS,LSH,Lam,Yu,Yd,Ye,MS2,mu2)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lamp2 =Lam**2 
 LSp2 =LS**2 
 LSHp2 =LSH**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 41._dp*(g1p3)/10._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -19._dp*(g2p3)/6._dp

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! LS 
!-------------------- 
 
betaLS1  = 4*(LSHp2 + 9._dp*(LSp2))

 
 
If (TwoLoopRGE) Then 
betaLS2 = 0

 
DLS = oo16pi2*( betaLS1 + oo16pi2 * betaLS2 ) 

 
Else 
DLS = oo16pi2* betaLS1 
End If 
 
 
Call Chop(DLS) 

!-------------------- 
! LSH 
!-------------------- 
 
betaLSH1  = (LSH*(-9._dp*(g1p2) - 45._dp*(g2p2) + 60._dp*(Lam) + 120._dp*(LS)         & 
&  + 80._dp*(LSH) + 60._dp*(TrYdadjYd) + 20._dp*(TrYeadjYe) + 60._dp*(TrYuadjYu)))/10._dp

 
 
If (TwoLoopRGE) Then 
betaLSH2 = 0

 
DLSH = oo16pi2*( betaLSH1 + oo16pi2 * betaLSH2 ) 

 
Else 
DLSH = oo16pi2* betaLSH1 
End If 
 
 
Call Chop(DLSH) 

!-------------------- 
! Lam 
!-------------------- 
 
betaLam1  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)               & 
& /4._dp - (9*g1p2*Lam)/5._dp - 9*g2p2*Lam + 12._dp*(Lamp2) + 4._dp*(LSHp2)              & 
&  + 12*Lam*TrYdadjYd - 12._dp*(TrYdadjYdYdadjYd) + 4*Lam*TrYeadjYe - 4._dp*(TrYeadjYeYeadjYe)& 
&  + 12*Lam*TrYuadjYu - 12._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) +               & 
&  3._dp*(TrYdadjYd) + TrYeadjYe + 3._dp*(TrYuadjYu))*Yu - (3*(YuadjYdYd -               & 
&  YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd)               & 
&  - 4._dp*(TrYeadjYe) - 12._dp*(TrYuadjYu))*Yd) + 6*(YdadjYdYd - YdadjYuYu))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrYdadjYd)              & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Ye + 3._dp*(YeadjYeYe)/2._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! MS2 
!-------------------- 
 
betaMS21  = 12*LS*MS2 + 8*LSH*mu2

 
 
If (TwoLoopRGE) Then 
betaMS22 = 0

 
DMS2 = oo16pi2*( betaMS21 + oo16pi2 * betaMS22 ) 

 
Else 
DMS2 = oo16pi2* betaMS21 
End If 
 
 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 2*LSH*MS2 - (9*g1p2*mu2)/10._dp - (9*g2p2*mu2)/2._dp + 6*Lam*mu2 +        & 
&  6*mu2*TrYdadjYd + 2*mu2*TrYeadjYe + 6*mu2*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Call ParametersToG66(Dg1,Dg2,Dg3,DLS,DLSH,DLam,DYu,DYd,DYe,DMS2,Dmu2,f)

Iname = Iname - 1 
 
End Subroutine rge66  

Subroutine GToParameters67(g,g1,g2,g3,LS,LSH,Lam,Yu,Yd,Ye,MS2,mu2,v)

Implicit None 
Real(dp), Intent(in) :: g(67) 
Real(dp),Intent(out) :: g1,g2,g3,MS2,v

Complex(dp),Intent(out) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters67' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
LS= Cmplx(g(4),g(5),dp) 
LSH= Cmplx(g(6),g(7),dp) 
Lam= Cmplx(g(8),g(9),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+10), g(SumI+11), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+28), g(SumI+29), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+46), g(SumI+47), dp) 
End Do 
 End Do 
 
MS2= g(64) 
mu2= Cmplx(g(65),g(66),dp) 
v= g(67) 
Do i1=1,67 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters67

Subroutine ParametersToG67(g1,g2,g3,LS,LSH,Lam,Yu,Yd,Ye,MS2,mu2,v,g)

Implicit None 
Real(dp), Intent(out) :: g(67) 
Real(dp), Intent(in) :: g1,g2,g3,MS2,v

Complex(dp), Intent(in) :: LS,LSH,Lam,Yu(3,3),Yd(3,3),Ye(3,3),mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG67' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(LS,dp)  
g(5) = Aimag(LS)  
g(6) = Real(LSH,dp)  
g(7) = Aimag(LSH)  
g(8) = Real(Lam,dp)  
g(9) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+10) = Real(Yu(i1,i2), dp) 
g(SumI+11) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+28) = Real(Yd(i1,i2), dp) 
g(SumI+29) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+46) = Real(Ye(i1,i2), dp) 
g(SumI+47) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(64) = MS2  
g(65) = Real(mu2,dp)  
g(66) = Aimag(mu2)  
g(67) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG67

Subroutine rge67(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,MS2,betaMS21,betaMS22,DMS2,v,betav1,betav2,Dv
Complex(dp) :: LS,betaLS1,betaLS2,DLS,LSH,betaLSH1,betaLSH2,DLSH,Lam,betaLam1,        & 
& betaLam2,DLam,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)            & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3),mu2,betamu21,betamu22,Dmu2
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YuadjYu(3,3),adjYdYd(3,3),adjYeYe(3,3),adjYuYu(3,3),        & 
& YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YuadjYdYd(3,3),YuadjYuYu(3,3),            & 
& adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYuYuadjYu(3,3),YdadjYdYdadjYd(3,3),             & 
& YeadjYeYeadjYe(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYdadjYdYdadjYd,TrYeadjYeYeadjYe,TrYuadjYuYuadjYu

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3

Complex(dp) :: Lamp2,LSp2,LSHp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge67' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters67(gy,g1,g2,g3,LS,LSH,Lam,Yu,Yd,Ye,MS2,mu2,v)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 Lamp2 =Lam**2 
 LSp2 =LS**2 
 LSHp2 =LSH**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 41._dp*(g1p3)/10._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -19._dp*(g2p3)/6._dp

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! LS 
!-------------------- 
 
betaLS1  = 4*(LSHp2 + 9._dp*(LSp2))

 
 
If (TwoLoopRGE) Then 
betaLS2 = 0

 
DLS = oo16pi2*( betaLS1 + oo16pi2 * betaLS2 ) 

 
Else 
DLS = oo16pi2* betaLS1 
End If 
 
 
Call Chop(DLS) 

!-------------------- 
! LSH 
!-------------------- 
 
betaLSH1  = (LSH*(-9._dp*(g1p2) - 45._dp*(g2p2) + 60._dp*(Lam) + 120._dp*(LS)         & 
&  + 80._dp*(LSH) + 60._dp*(TrYdadjYd) + 20._dp*(TrYeadjYe) + 60._dp*(TrYuadjYu)))/10._dp

 
 
If (TwoLoopRGE) Then 
betaLSH2 = 0

 
DLSH = oo16pi2*( betaLSH1 + oo16pi2 * betaLSH2 ) 

 
Else 
DLSH = oo16pi2* betaLSH1 
End If 
 
 
Call Chop(DLSH) 

!-------------------- 
! Lam 
!-------------------- 
 
betaLam1  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)               & 
& /4._dp - (9*g1p2*Lam)/5._dp - 9*g2p2*Lam + 12._dp*(Lamp2) + 4._dp*(LSHp2)              & 
&  + 12*Lam*TrYdadjYd - 12._dp*(TrYdadjYdYdadjYd) + 4*Lam*TrYeadjYe - 4._dp*(TrYeadjYeYeadjYe)& 
&  + 12*Lam*TrYuadjYu - 12._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) +               & 
&  3._dp*(TrYdadjYd) + TrYeadjYe + 3._dp*(TrYuadjYu))*Yu - (3*(YuadjYdYd -               & 
&  YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd)               & 
&  - 4._dp*(TrYeadjYe) - 12._dp*(TrYuadjYu))*Yd) + 6*(YdadjYdYd - YdadjYuYu))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrYdadjYd)              & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Ye + 3._dp*(YeadjYeYe)/2._dp

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! MS2 
!-------------------- 
 
betaMS21  = 12*LS*MS2 + 8*LSH*mu2

 
 
If (TwoLoopRGE) Then 
betaMS22 = 0

 
DMS2 = oo16pi2*( betaMS21 + oo16pi2 * betaMS22 ) 

 
Else 
DMS2 = oo16pi2* betaMS21 
End If 
 
 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 2*LSH*MS2 - (9*g1p2*mu2)/10._dp - (9*g2p2*mu2)/2._dp + 6*Lam*mu2 +        & 
&  6*mu2*TrYdadjYd + 2*mu2*TrYeadjYe + 6*mu2*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = (v*(9._dp*(g1p2) + 45._dp*(g2p2) - 60._dp*(TrYdadjYd) - 20._dp*(TrYeadjYe)  & 
&  - 60._dp*(TrYuadjYu) + 3*g1p2*Xi + 15*g2p2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
Call ParametersToG67(Dg1,Dg2,Dg3,DLS,DLSH,DLam,DYu,DYd,DYe,DMS2,Dmu2,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge67  

End Module RGEs_SSDM 
 
