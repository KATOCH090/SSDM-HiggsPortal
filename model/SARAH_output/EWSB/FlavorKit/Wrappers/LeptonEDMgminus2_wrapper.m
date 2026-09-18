ProcessWrapper = True; 
NameProcess = "LeptonEDMgminus2" 
ExternalFields = {bar[ChargedLepton], ChargedLepton, Photon}; 

SumContributionsOperators["LeptonEDMgminus2"] = { 
{Lgminus2, DP2lSL + DP2lSR}, 
{Ledm, DP2lSR - DP2lSL}
						};

NormalizationOperators["LeptonEDMgminus2"] ={
    "Lgminus2(1,1) = (Lgminus2(1,1)-Lgminus2SM(1,1))*0.5_dp*mf_l_mz(1)/sqrt(Alpha_MZ*4*Pi)",
    "Lgminus2(2,2) = (Lgminus2(2,2)-Lgminus2SM(2,2))*0.5_dp*mf_l_mz(2)/sqrt(Alpha_MZ*4*Pi)",
    "Lgminus2(3,3) = (Lgminus2(3,3)-Lgminus2SM(3,3))*0.5_dp*mf_l_mz(3)/sqrt(Alpha_MZ*4*Pi)",
    "Ledm(1,1) = (Ledm(1,1)-LedmSM(1,1))*0.25_dp*0.1973269718e-13",
"Ledm(2,2) = (Ledm(2,2)-LedmSM(2,2))*0.25_dp*0.1973269718e-13",
"Ledm(3,3) = (Ledm(3,3)-LedmSM(3,3))*0.25_dp*0.1973269718e-13"
};
