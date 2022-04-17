*variables: spp(E/S/ES), spp_num(1/2/3), hyp_type(ind/ind, syn/syn, ant/ant, syn/add), hyp_num(1/2/3/4), median_fici(#), low_fici(#)

*based on data from 03.26.19 FIC hypothesis graphs.xls

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\04.03.19 FICI demo hypothesis graphs.dta"

**********Median values**************
*Ind/ind
stripplot median_fici if hyp_type=="ind/ind", over(spp_num) stack center vertical separate(spp_num) jitter(3 3 3) ///
ytitle("Median FICI", size(huge)) xtitle("") ///
msymbol(circle circle circle) msize(vhuge vhuge vhuge) mcolor(midblue gold green) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(off) aspectratio(1) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 "E" 2 "S" 3 "ES", labsize(huge)) ///
ylabel(0(0.5)2, labsize(huge) angle(horizontal)) yscale(range(0 2)) ///
yline(0.8, lcolor(red) lwidth(thick) lpattern(shortdash)) yline(1, lcolor(black) lwidth(thick))

*Syn/syn
stripplot median_fici if hyp_type=="syn/syn", over(spp_num) stack center vertical separate(spp_num) jitter(3 3 3) ///
ytitle("Median FICI", size(huge)) xtitle("") ///
msymbol(circle circle circle) msize(vhuge vhuge vhuge) mcolor(midblue gold green) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(off) aspectratio(1) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 "E" 2 "S" 3 "ES", labsize(huge)) ///
ylabel(0(0.5)1.5, labsize(huge) angle(horizontal)) yscale(range(0 1.5)) ///
yline(0.8, lcolor(red) lwidth(thick) lpattern(shortdash)) yline(1, lcolor(black) lwidth(thick))

*Ant/ant
stripplot median_fici if hyp_type=="ant/ant", over(spp_num) stack center vertical separate(spp_num) jitter(3 3 3) ///
ytitle("Median FICI", size(huge)) xtitle("") ///
msymbol(circle circle circle) msize(vhuge vhuge vhuge) mcolor(midblue gold green) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(off) aspectratio(1) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 "E" 2 "S" 3 "ES", labsize(huge)) ///
ylabel(0(0.5)2.5, labsize(huge) angle(horizontal)) yscale(range(0 2.5)) ///
yline(0.8, lcolor(red) lwidth(thick) lpattern(shortdash)) yline(1, lcolor(black) lwidth(thick)) ///
yline(2, lcolor(green) lwidth(thick) lpattern(shortdash)) yline(1, lcolor(black) lwidth(thick))

*Syn/add
stripplot median_fici if hyp_type=="syn/add", over(spp_num) stack center vertical separate(spp_num) jitter(3 3 3) ///
ytitle("Median FICI", size(huge)) xtitle("") ///
msymbol(circle circle circle) msize(vhuge vhuge vhuge) mcolor(midblue gold green) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(off) aspectratio(1) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 "E" 2 "S" 3 "ES", labsize(huge)) ///
ylabel(0(0.5)1.5, labsize(huge) angle(horizontal)) yscale(range(0 1.5)) ///
yline(0.8, lcolor(red) lwidth(thick) lpattern(shortdash)) yline(1, lcolor(black) lwidth(thick))
