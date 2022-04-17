*variables: spp(E/S/ES), spp_num(1/2/3), rep(1-3), combo(various), combo_num(1-10), median_fici(#), low_fici(#), pred_or_real(pred/real)

*based on data from 04.01.Xboard analysis in Stata with coop preds.xls

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR multiple abs project\Xboard analysis\04.03.19 FICI graphs mono and co-cultures.dta"

*stats
ranksum median_fici if(combo_num==1 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==2 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==3 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==4 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==5 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==6 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==7 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==8 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==9 & spp!="ES"), by(spp) 
ranksum median_fici if(combo_num==10 & spp!="ES"), by(spp) 

collapse (sd) sdfici= median_fici (mean) meanfici= median_fici (count) n=median_fici, by(spp spp_num combo combo_num pred_or_real)

generate hifici = meanfici + invttail(n-1,0.025)*(sdfici / sqrt(n))
generate lowfici = meanfici - invttail(n-1,0.025)*(sdfici / sqrt(n))

generate ficispp = 1 if spp=="E" & combo_num==1
replace ficispp = 2 if spp=="S" & combo_num==1
replace ficispp = 4 if spp=="E" & combo_num==2
replace ficispp = 5 if spp=="S" & combo_num==2
replace ficispp = 7 if spp=="E" & combo_num==3
replace ficispp = 8 if spp=="S" & combo_num==3
replace ficispp = 10 if spp=="E" & combo_num==4
replace ficispp = 11 if spp=="S" & combo_num==4
replace ficispp = 13 if spp=="E" & combo_num==5
replace ficispp = 14 if spp=="S" & combo_num==5
replace ficispp = 16 if spp=="E" & combo_num==6
replace ficispp = 17 if spp=="S" & combo_num==6
replace ficispp = 19 if spp=="E" & combo_num==7
replace ficispp = 20 if spp=="S" & combo_num==7
replace ficispp = 22 if spp=="E" & combo_num==8
replace ficispp = 23 if spp=="S" & combo_num==8
replace ficispp = 25 if spp=="E" & combo_num==9
replace ficispp = 26 if spp=="S" & combo_num==9
replace ficispp = 28 if spp=="E" & combo_num==10
replace ficispp = 29 if spp=="S" & combo_num==10

**********Median values**************
graph twoway (scatter meanfici ficispp if spp=="E", mcolor(midblue) msymbol(cirlce) msize(vlarge) mlcolor(black) mlwidth(vthin)) ///
(scatter meanfici ficispp if spp=="S", mcolor(gold) msymbol(cirlce) msize(vlarge) mlcolor(black) mlwidth(vthin)) ///
(rcap hifici lowfici ficispp, lcolor(black) lwidth(medthin)), ///
title("{it:E. coli} and {it:S. enterica} FICI values", color(black) margin(zero) size(large)) ///
ytitle("Mean FICI", color(black) size(medlarge)) xtitle("Antibiotic combination", color(black) size(medlarge) margin(medsmall)) ///
xlabel(1.5 `" "Nalx/" "Strep" "' 4.5 `" "Nalx/" "Bleo" "' 7.5 `" "Strep/" "Cipro" "' 10.5 `" "Nalx/" "Spx" "' ///
13.5 `" "Nalx/" "Doxy" "' 16.5 `" "Spx/" "Strep" "' 19.5 `" "Nalx/" "Cipro" "' 22.5 `" "Cipro/" "Bleo" "' ///
25.5 `" "Strep/" "Doxy" "' 28.5 `" "Spx/" "Doxy" "', labsize(medsmall)) ///
legend(colfirst rows(1) order(1 "{it:E. coli}" 2 "{it:S. enterica}") size(medsmall)) ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
ylabel(0(0.5)3, labsize(medium) angle(horizontal)) yscale(range(0 3)) ///
yline(0.8, lcolor(red) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
yline(2, lcolor(green) lwidth(medium) lpattern(shortdash)) ///
text(1.4 1.5 "*", size(huge)) text(2.1 16.5 "*", size(huge)) text(1 28.5 "*", size(huge)) ///
note("Points below the red line represent synergy" "Points above the green line represent antagonism", color(black) size(medsmall)) 


*if needed, see below:
legend(colfirst rows(5) order(1 "Nalidixic acid- streptomycin" 2 "Nalidixic acid- bleomycin" 3 "Streptomycin- ciprofloxacin" ///
4 "Nalidixic acid- spectinomycin" 5 "Nalidixic acid- doxycyline" 6 "Spectinomycin- streptomycin" 7 "Nalidixic acid- ciprofloxacin" ///
8 "Ciprofloxacin- bleomycin" 9 "Streptomycin- doxycycline" 10 "Spectinomycin- doxycycline") size(medsmall)) ///

stripplot median_fici if spp=="E", over(combo_num) stack center vertical separate(combo) jitter(3 3 3 3 3 3 3 3 3 3) ///
title("Median FICI values for {it:E.coli}" "across ten antibiotic combinations", size(medlarge) color(black) margin(zero)) ///
ytitle("Median FICI value", size(medium)) xtitle("Antibiotic combination", size(medium) margin(vsmall)) ///
msymbol(circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(5) order(1 "Nalidixic acid- streptomycin" 2 "Nalidixic acid- bleomycin" 3 "Streptomycin- ciprofloxacin" ///
4 "Nalidixic acid- spectinomycin" 5 "Nalidixic acid- doxycyline" 6 "Spectinomycin- streptomycin" 7 "Nalidixic acid- ciprofloxacin" ///
8 "Ciprofloxacin- bleomycin" 9 "Streptomycin- doxycycline" 10 "Spectinomycin- doxycycline") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0(0.5)3, labsize(medium) angle(horizontal)) yscale(range(0 3)) ///
yline(0.8, lcolor(red) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
note("Points below the red line represent synergy", color(black) size(medsmall))

*S. enterica values
stripplot median_fici if spp=="S", over(combo_num) stack center vertical separate(combo) jitter(3 3 3 3 3 3 3 3 3 3) ///
title("Median FICI values for {it:S. enterica}" "across ten antibiotic combinations", size(medlarge) color(black) margin(zero)) ///
ytitle("Median FICI value", size(medium)) xtitle("Antibiotic combination", size(medium) margin(vsmall)) ///
msymbol(circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(5) order(1 "Nalidixic acid- streptomycin" 2 "Nalidixic acid- bleomycin" 3 "Streptomycin- ciprofloxacin" ///
4 "Nalidixic acid- spectinomycin" 5 "Nalidixic acid- doxycyline" 6 "Spectinomycin- streptomycin" 7 "Nalidixic acid- ciprofloxacin" ///
8 "Ciprofloxacin- bleomycin" 9 "Streptomycin- doxycycline" 10 "Spectinomycin- doxycycline") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0.5(0.25)1.5, labsize(medium) angle(horizontal)) yscale(range(0.5 1.5)) ///
yline(0.8, lcolor(red) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
note("Points below the red line represent synergy", color(black) size(medsmall))


**********Minimum values**************
*E. coli values
stripplot low_fici if spp=="E", over(combo_num) stack center vertical separate(combo) jitter(3 3 3 3 3 3 3 3 3 3) ///
title("Minimum FICI values for {it:E.coli}" "across ten antibiotic combinations", size(medlarge) color(black) margin(zero)) ///
ytitle("Minimum FICI value", size(medium)) xtitle("Antibiotic combination", size(medium) margin(vsmall)) ///
msymbol(circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(5) order(1 "Nalidixic acid- streptomycin" 2 "Nalidixic acid- bleomycin" 3 "Streptomycin- ciprofloxacin" ///
4 "Nalidixic acid- spectinomycin" 5 "Nalidixic acid- doxycyline" 6 "Spectinomycin- streptomycin" 7 "Nalidixic acid- ciprofloxacin" ///
8 "Ciprofloxacin- bleomycin" 9 "Streptomycin- doxycycline" 10 "Spectinomycin- doxycycline") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0(0.25)1.5, labsize(medium) angle(horizontal)) yscale(range(0 1.5)) ///
yline(0.8, lcolor(red) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
note("Points below the red line represent synergy", color(black) size(medsmall))

*S. enterica values
stripplot low_fici if spp=="S", over(combo_num) stack center vertical separate(combo) jitter(3 3 3 3 3 3 3 3 3 3) ///
title("Minimum FICI values for {it:S. enterica}" "across ten antibiotic combinations", size(medlarge) color(black) margin(zero)) ///
ytitle("Minimum FICI value", size(medium)) xtitle("Antibiotic combination", size(medium) margin(vsmall)) ///
msymbol(circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(5) order(1 "Nalidixic acid- streptomycin" 2 "Nalidixic acid- bleomycin" 3 "Streptomycin- ciprofloxacin" ///
4 "Nalidixic acid- spectinomycin" 5 "Nalidixic acid- doxycyline" 6 "Spectinomycin- streptomycin" 7 "Nalidixic acid- ciprofloxacin" ///
8 "Ciprofloxacin- bleomycin" 9 "Streptomycin- doxycycline" 10 "Spectinomycin- doxycycline") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0(0.25)1.5, labsize(medium) angle(horizontal)) yscale(range(0 1.5)) ///
yline(0.8, lcolor(red) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
note("Points below the red line represent synergy", color(black) size(medsmall))

