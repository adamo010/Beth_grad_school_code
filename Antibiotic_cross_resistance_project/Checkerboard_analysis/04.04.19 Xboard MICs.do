 
 clear
 use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\Xboard analysis\04.04.19 Xboard MICs.dta"
 
 tabstat mic if (pred_or_real=="real" & spp=="E"), by(ab) stat(median min max) nototal long
 tabstat mic if (pred_or_real=="real" & spp=="S"), by(ab) stat(median min max) nototal long
 tabstat mic if (pred_or_real=="real" & spp=="ES"), by(ab) stat(median min max) nototal long
 tabstat mic if (pred_or_real=="pred" & spp=="ES"), by(ab) stat(median min max) nototal long
