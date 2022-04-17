clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\Xboard analysis\04.03.19 FICI graphs mono and co-cultures.dta"

*variables: spp(E/S/ES), spp_num(1/2/3), rep(1-3), combo(various), combo_num(1-10), median_fici(#), low_fici(#), pred_or_real(pred/real)

 tabstat median_fici if (pred_or_real=="real" & spp=="E"), by(combo) stat(median min max) nototal long
 tabstat median_fici if (pred_or_real=="real" & spp=="S"), by(combo) stat(median min max) nototal long
 tabstat median_fici if (pred_or_real=="pred" & spp=="ES"), by(combo) stat(median min max) nototal long
 tabstat median_fici if (pred_or_real=="real" & spp=="ES"), by(combo) stat(median min max) nototal long
