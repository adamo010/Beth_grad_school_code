*variables: spp(E/S/ES), spp_num(1/2/3), rep(1-3), combo(various), combo_num(1-10), median_fici(#), low_fici(#), pred_or_real(pred/real)

*based on data from 04.01.Xboard analysis in Stata with coop preds

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\Xboard analysis\04.03.19 FICI graphs mono and co-cultures.dta"

*stats
ranksum median_fici if(combo_num==1 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==2 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==3 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==4 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==5 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==6 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==7 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==8 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==9 & spp=="ES"), by(pred_or_real) 
ranksum median_fici if(combo_num==10 & spp=="ES"), by(pred_or_real) 

collapse (sd) sdfici= median_fici (mean) meanfici= median_fici (count) n=median_fici, by(spp spp_num combo combo_num pred_or_real)

generate hifici = meanfici + invttail(n-1,0.025)*(sdfici / sqrt(n))
generate lowfici = meanfici - invttail(n-1,0.025)*(sdfici / sqrt(n))

*Pred FICIs alone 1st
generate ficispp = 1 if spp=="ES" & pred_or_real=="real" & combo_num==1
replace ficispp = 2 if spp=="ES" & pred_or_real=="pred" & combo_num==1
replace ficispp = 4 if spp=="ES" & pred_or_real=="real" & combo_num==2
replace ficispp = 5 if spp=="ES" & pred_or_real=="pred" & combo_num==2
replace ficispp = 7 if spp=="ES" & pred_or_real=="real" & combo_num==3
replace ficispp = 8 if spp=="ES" & pred_or_real=="pred" & combo_num==3
replace ficispp = 10 if spp=="ES" & pred_or_real=="real" & combo_num==4
replace ficispp = 11 if spp=="ES" & pred_or_real=="pred" & combo_num==4
replace ficispp = 13 if spp=="ES" & pred_or_real=="real" & combo_num==5
replace ficispp = 14 if spp=="ES" & pred_or_real=="pred" & combo_num==5
replace ficispp = 16 if spp=="ES" & pred_or_real=="real" & combo_num==6
replace ficispp = 17 if spp=="ES" & pred_or_real=="pred" & combo_num==6
replace ficispp = 19 if spp=="ES" & pred_or_real=="real" & combo_num==7
replace ficispp = 20 if spp=="ES" & pred_or_real=="pred" & combo_num==7
replace ficispp = 22 if spp=="ES" & pred_or_real=="real" & combo_num==8
replace ficispp = 23 if spp=="ES" & pred_or_real=="pred" & combo_num==8
replace ficispp = 25 if spp=="ES" & pred_or_real=="real" & combo_num==9
replace ficispp = 26 if spp=="ES" & pred_or_real=="pred" & combo_num==9
replace ficispp = 28 if spp=="ES" & pred_or_real=="real" & combo_num==10
replace ficispp = 29 if spp=="ES" & pred_or_real=="pred" & combo_num==10

**********Median values**************
graph twoway (scatter meanfici ficispp if spp=="ES" & pred_or_real=="real", mcolor(green) msymbol(cirlce) msize(vlarge) mlcolor(black) mlwidth(vthin)) ///
(scatter meanfici ficispp if spp=="ES" & pred_or_real=="pred", mcolor(green*0.25) msymbol(cirlce) msize(vlarge) mlcolor(black) mlwidth(vthin)) ///
(rcap hifici lowfici ficispp, lcolor(black) lwidth(medthin)), ///
title("{it:E. coli-S. enterica} coculture" "real and predicted FICI values", color(black) margin(zero) size(large)) ///
ytitle("Mean FICI", color(black) size(medlarge)) xtitle("Antibiotic combination", color(black) size(medlarge) margin(medsmall)) ///
xlabel(1.5 `" "Nalx/" "Strep" "' 4.5 `" "Nalx/" "Bleo" "' 7.5 `" "Strep/" "Cipro" "' 10.5 `" "Nalx/" "Spx" "' ///
13.5 `" "Nalx/" "Doxy" "' 16.5 `" "Spx/" "Strep" "' 19.5 `" "Nalx/" "Cipro" "' 22.5 `" "Cipro/" "Bleo" "' ///
25.5 `" "Strep/" "Doxy" "' 28.5 `" "Spx/" "Doxy" "', labsize(medsmall)) ///
legend(colfirst rows(1) order(1 "Observed ES co-culture" 2 "Predicted ES co-culture") size(medsmall)) ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
ylabel(-1(0.5)3.5, labsize(medium) angle(horizontal)) yscale(range(-1 3.5)) ///
yline(0.8, lcolor(green) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
yline(2, lcolor(red) lwidth(medium) lpattern(shortdash)) ///
text(1.5 10.5 "*", size(huge))
note("Points below the red line represent synergy" "Points above the green line represent antagonism", color(black) size(medsmall)) ///

*Pred FICIs alone 1st
generate ficispp2 = 1 if spp=="ES" & pred_or_real=="pred" & combo_num==1
replace ficispp2 = 3 if spp=="ES" & pred_or_real=="pred" & combo_num==2
replace ficispp2 = 5 if spp=="ES" & pred_or_real=="pred" & combo_num==3
replace ficispp2 = 7 if spp=="ES" & pred_or_real=="pred" & combo_num==4
replace ficispp2 = 9 if spp=="ES" & pred_or_real=="pred" & combo_num==5
replace ficispp2 = 11 if spp=="ES" & pred_or_real=="pred" & combo_num==6
replace ficispp2 = 13 if spp=="ES" & pred_or_real=="pred" & combo_num==7
replace ficispp2 = 15 if spp=="ES" & pred_or_real=="pred" & combo_num==8
replace ficispp2 = 17 if spp=="ES" & pred_or_real=="pred" & combo_num==9
replace ficispp2 = 19 if spp=="ES" & pred_or_real=="pred" & combo_num==10

**********Median values**************
graph twoway (scatter meanfici ficispp2 if spp=="ES" & pred_or_real=="real", mcolor(green) msymbol(cirlce) msize(vlarge) mlcolor(black) mlwidth(vthin)) ///
(scatter meanfici ficispp2 if spp=="ES" & pred_or_real=="pred", mcolor(green*0.25) msymbol(cirlce) msize(vlarge) mlcolor(black) mlwidth(vthin)) ///
(rcap hifici lowfici ficispp2, lcolor(black) lwidth(medthin)), ///
title("{it:E. coli-S. enterica} coculture" "predicted FICI values", color(black) margin(zero) size(large)) ///
ytitle("Mean FICI", color(black) size(medlarge)) xtitle("Antibiotic combination", color(black) size(medlarge) margin(medsmall)) ///
xlabel(1 `" "Nalx/" "Strep" "' 3 `" "Nalx/" "Bleo" "' 5 `" "Strep/" "Cipro" "' 7 `" "Nalx/" "Spx" "' ///
9 `" "Nalx/" "Doxy" "' 11 `" "Spx/" "Strep" "' 13 `" "Nalx/" "Cipro" "' 15 `" "Cipro/" "Bleo" "' ///
17 `" "Strep/" "Doxy" "' 19 `" "Spx/" "Doxy" "', labsize(medsmall)) ///
legend(colfirst rows(1) order(2 "Predicted ES co-culture") size(medsmall)) ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
ylabel(-1(0.5)3.5, labsize(medium) angle(horizontal)) yscale(range(-1 3.5)) ///
yline(0.8, lcolor(green) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
yline(2, lcolor(red) lwidth(medium) lpattern(shortdash)) 
note("Points below the red line represent synergy" "Points above the green line represent antagonism", color(black) size(medsmall)) ///
