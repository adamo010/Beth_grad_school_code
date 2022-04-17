*variables: spp(E/S/ES), spp_num(1/2/3), rep(1-3), combo(various), combo_num(1-10), median_fici(#), low_fici(#)

*based on data from 03.25.19 Xboard analysis in stata.xls

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\Xboard analysis\03.25.19 FICI analysis graphs.dta"

**********Median values**************
*E. coli values
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

*Co-culture values
stripplot median_fici if spp=="ES", over(combo_num) stack center vertical separate(combo) jitter(3 3 3 3 3 3 3 3 3 3) ///
title("Median FICI values for the {it:E. coli- S. enterica}" "across ten antibiotic combinations", size(medlarge) color(black) margin(zero)) ///
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

*Co-culture values
stripplot low_fici if spp=="ES", over(combo_num) stack center vertical separate(combo) jitter(3 3 3 3 3 3 3 3 3 3) ///
title("Minimum FICI values for the {it:E. coli- S. enterica}" "across ten antibiotic combinations", size(medlarge) color(black) margin(zero)) ///
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
ylabel(0(0.25)2, labsize(medium) angle(horizontal)) yscale(range(0 2)) ///
yline(0.8, lcolor(red) lwidth(medium) lpattern(shortdash)) yline(1, lcolor(black) lwidth(medium)) ///
note("Points below the red line represent synergy", color(black) size(medsmall))

