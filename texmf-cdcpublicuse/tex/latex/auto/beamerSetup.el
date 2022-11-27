(TeX-add-style-hook
 "beamerSetup"
 (lambda ()
   (TeX-add-symbols
    '("together" 1)
    "aboveMin"
    "aAgg"
    "adj"
    "adjPar"
    "aE"
    "aFunc"
    "Age"
    "age"
    "ALevBF"
    "aLevBF"
    "ALev"
    "aLev"
    "Alive"
    "Alt"
    "ARat"
    "aRat"
    "aMin"
    "ASS"
    "aSS"
    "ATarg"
    "aTarg"
    "BE"
    "bE"
    "BLevBF"
    "bLevBF"
    "BLevE"
    "bLevE"
    "BLevU"
    "bLevU"
    "BLev"
    "bLev"
    "BRat"
    "bRat"
    "bMin"
    "bRatE"
    "bRatU"
    "BRatE"
    "BTarg"
    "bTarg"
    "bTargE"
    "BTargTarg"
    "bTargTarg"
    "BU"
    "bU"
    "cAgg"
    "ccRat"
    "CDF"
    "CEndFunc"
    "cEndFunc"
    "cEss"
    "CE"
    "cE"
    "CFunc"
    "cFunc"
    "cFuncBelow"
    "cFuncAbove"
    "cFuncMax"
    "CGroOverG"
    "CGroOverR"
    "CGroPF"
    "cGroPF"
    "CGroPS"
    "Chi"
    "chiFunc"
    "CLevBF"
    "cLevBF"
    "CLevE"
    "cLevE"
    "cLevFunc"
    "CLevU"
    "cLevU"
    "CLev"
    "cLev"
    "Cons"
    "cons"
    "cPDVFunc"
    "CPDV"
    "cPPP"
    "cPP"
    "cP"
    "CRatE"
    "cRatE"
    "CRatU"
    "cRatU"
    "CRat"
    "cRat"
    "CARA"
    "CRRA"
    "CTargE"
    "CTarg"
    "cTarg"
    "cTargE"
    "cTargTarg"
    "corr"
    "curr"
    "Curr"
    "CU"
    "cU"
    "debtLim"
    "Debt"
    "debt"
    "depr"
    "Discount"
    "DiscRate"
    "DiscAlt"
    "DiscAltuAdj"
    "Dvdnd"
    "dvdnd"
    "edvdnd"
    "DivGro"
    "divGro"
    "Div"
    "div"
    "EEndMap"
    "EpShkInv"
    "InvEpShkInv"
    "effUnits"
    "eFunc"
    "ek"
    "empState"
    "EPrem"
    "eprem"
    "EpremLog"
    "erate"
    "Err"
    "err"
    "error"
    "Estdr"
    "Evarr"
    "EVarr"
    "expend"
    "xpend"
    "Ex"
    "FFunc"
    "fFunc"
    "FDist"
    "fDist"
    "FLev"
    "fLev"
    "fP"
    "fPP"
    "FP"
    "FPP"
    "GovNW"
    "govNW"
    "GovSpend"
    "govSpend"
    "h"
    "hFunc"
    "H"
    "Hi"
    "Habit"
    "habit"
    "Ham"
    "HLev"
    "hLev"
    "HRat"
    "hRat"
    "hEnd"
    "hEndMin"
    "hMin"
    "HMin"
    "iFunc"
    "IFunc"
    "ILev"
    "iLev"
    "impg"
    "ImpG"
    "impr"
    "ImpR"
    "Inc"
    "inc"
    "Inv"
    "inv"
    "IRat"
    "iRat"
    "itc"
    "PostITC"
    "jFunc"
    "kapRent"
    "kapShare"
    "Kap"
    "kap"
    "KLevBF"
    "kLevBF"
    "KLev"
    "kLev"
    "KFunc"
    "kFunc"
    "KRat"
    "kRat"
    "kTarg"
    "kTargE"
    "Labor"
    "labor"
    "labShare"
    "Leisure"
    "leisure"
    "LGro"
    "lGro"
    "LLevBF"
    "lLevBF"
    "lLev"
    "LLev"
    "LRat"
    "Lo"
    "MaxMaxMPC"
    "MaxMinMPC"
    "MinMinMPC"
    "MaxMPC"
    "MaxMPS"
    "Mean"
    "m"
    "mEss"
    "ME"
    "mE"
    "MRatE"
    "mRatE"
    "mFunc"
    "MinMPC"
    "MinMPS"
    "MLevBF"
    "mLevBF"
    "mLevE"
    "MLev"
    "mLev"
    "MPCE"
    "MPCFunc"
    "MPCPPF"
    "MPCP"
    "MPCU"
    "MPC"
    "MPSFunc"
    "MPS"
    "MRat"
    "mRat"
    "MSS"
    "mSS"
    "mTarg"
    "MU"
    "mU"
    "Next"
    "nFunc"
    "NLev"
    "nLev"
    "NRat"
    "nRat"
    "n"
    "Num"
    "OLevBF"
    "oLevBF"
    "OLev"
    "oLev"
    "ORat"
    "oRat"
    "PatPGroAdj"
    "patpGroAdj"
    "PatPGroG"
    "patpGrog"
    "patpGrohat"
    "PatPGro"
    "patpGro"
    "PatR"
    "patr"
    "Pat"
    "pat"
    "pDeadRate"
    "pDead"
    "pDieRate"
    "PDies"
    "pDies"
    "PDV"
    "PGroAdj"
    "pGroAdj"
    "PGrouAdj"
    "pGrouAdj"
    "PGro"
    "pGro"
    "phiFunc"
    "PIHMPC"
    "PInc"
    "Plabor"
    "PLabor"
    "PLevBF"
    "pLevBF"
    "PLev"
    "pLev"
    "pRat"
    "PLives"
    "pLives"
    "pNotZero"
    "pSav"
    "PopE"
    "popE"
    "EmpGro"
    "empGro"
    "PopGro"
    "popGro"
    "PopLev"
    "PopU"
    "Pop"
    "power"
    "pPDVFunc"
    "PPDV"
    "Price"
    "kPriceAfterITC"
    "ProdFunc"
    "prodFunc"
    "prudEx"
    "prud"
    "PShk"
    "pShk"
    "pShkMin"
    "pshk"
    "PtyGro"
    "ptyGro"
    "PtyLev"
    "ptyLev"
    "PtyLab"
    "ptyLab"
    "pZero"
    "q"
    "RevFunc"
    "revFunc"
    "Rev"
    "rev"
    "rfree"
    "Rfree"
    "R"
    "RFunc"
    "RGross"
    "rGross"
    "riskyshare"
    "Risky"
    "RiskyAlt"
    "risky"
    "riskyAlt"
    "Rnorm"
    "rnorm"
    "Rport"
    "rport"
    "Rprod"
    "rprod"
    "RProd"
    "rProd"
    "RCpnd"
    "Save"
    "save"
    "SDF"
    "sdr"
    "saveRate"
    "Seniority"
    "seniority"
    "ShkMeanOne"
    "ShkMeanOneLog"
    "ShkMeanOneLogVar"
    "ShkMeanOneLogStd"
    "ShkLogZero"
    "ShkLogZeroLog"
    "ShkLogZeroLogVar"
    "ShkLogZeroLogStd"
    "SE"
    "sE"
    "sFunc"
    "SLevE"
    "sLevE"
    "SLevU"
    "sLevU"
    "SLev"
    "sLev"
    "SRatE"
    "sRatE"
    "SRatU"
    "sRatU"
    "SRat"
    "sRat"
    "Steady"
    "STargE"
    "sTargE"
    "STarg"
    "sTarg"
    "STargTarg"
    "sTargTarg"
    "Stocks"
    "stocks"
    "straight"
    "Surplus"
    "surplus"
    "SU"
    "sU"
    "Target"
    "TaxCorp"
    "TaxFree"
    "TaxLev"
    "TaxPaid"
    "TaxRate"
    "TaxNetTrans"
    "taxNetTrans"
    "tax"
    "taxDep"
    "Tax"
    "TaxUI"
    "TaxComb"
    "TaxCombInv"
    "tBak"
    "TEatBak"
    "TEat"
    "TEndBak"
    "TEnd"
    "TermTime"
    "tFwd"
    "tHorOfm"
    "tHor"
    "timeRate"
    "tinyAmount"
    "hours"
    "Hours"
    "TMap"
    "tNow"
    "tShkAll"
    "TShkEmp"
    "tShkEmp"
    "tShkEmpMin"
    "tshkEmp"
    "TShk"
    "tShk"
    "tshk"
    "tSS"
    "tThen"
    "DeprFac"
    "Depr"
    "unins"
    "Severance"
    "SeveranceRatio"
    "SeverancePayment"
    "uPDVFunc"
    "uPPP"
    "uPP"
    "uP"
    "urate"
    "uFunc"
    "util"
    "uInvEpShkuInv"
    "ValAlt"
    "valfn"
    "vk"
    "Value"
    "VEndFunc"
    "vEndFunc"
    "VEnd"
    "vEnd"
    "vEss"
    "VE"
    "vE"
    "vFirm"
    "VFunc"
    "vFunc"
    "vLevBF"
    "VLevFunc"
    "vLevFunc"
    "VLev"
    "vLev"
    "vNorm"
    "VRat"
    "vRat"
    "VNum"
    "vNum"
    "vTarg"
    "VU"
    "vU"
    "vInv"
    "VInv"
    "Wage"
    "wage"
    "WAllLev"
    "wAllLev"
    "WAllRat"
    "wAllRat"
    "WAll"
    "wAll"
    "kPrice"
    "WBeg"
    "wBeg"
    "Wealth"
    "wealth"
    "WEnd"
    "wEnd"
    "Wend"
    "wend"
    "WEndRat"
    "wEndRat"
    "wFunc"
    "WGro"
    "WGroPF"
    "wGro"
    "WHum"
    "wHum"
    "Whum"
    "whum"
    "whumMin"
    "wLev"
    "WMid"
    "Wmid"
    "wMid"
    "wmid"
    "WMkt"
    "wMkt"
    "wmkt"
    "WPre"
    "wPre"
    "wTot"
    "WTot"
    "wtot"
    "Wtot"
    "wRat"
    "WRat"
    "wNet"
    "WNet"
    "XFer"
    "xFer"
    "xFunc"
    "XLev"
    "xLev"
    "XperGro"
    "xperGro"
    "XRat"
    "xRat"
    "yFunc"
    "yLevBF"
    "YLev"
    "yLev"
    "YRat"
    "yRat"
    "yTarg"
    "yTargE"
    "zAgg"
    "zFunc"
    "ZLevBF"
    "zLevBF"
    "ZLev"
    "zLev"
    "ZRat"
    "zRat"
    "vOpt"
    "vOptAlt"
    "NFALev"
    "NFARat"
    "NI"
    "GDPLev"
    "GDPRat"
    "GDPGro"
    "gdpLev"
    "gdpRat"
    "weight"
    "bi"
    "ei"
    "reqd"
    "recm")
   (LaTeX-add-environments
    "CDCPrivate")))
