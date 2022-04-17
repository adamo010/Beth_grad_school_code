*First pass at looking at MICs over time in AbR evol study
*This is gonna be a huge mess, but gotta start somewhere
*used data from excel file 01.17.18 Compiled Amp and Rif MICs with updated Amp coop reps 1-2

*variables to choose from: spp (E,S), spp_num (1,2), evol (mono, coop) ///
*evol_num (1,2) comm_type (Emono, Smono, Ecoop, Scoop), comm_type_num (1,2,3,4) ////
*ab(Amp, Rif) ab_num (1,2) passage (1-20) rep (1-6) mic (some number)

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\01.31.18 population MICs precalculated mean and median.dta", clear

generate log2mic = ln(med_mic)/ln(2) 

*Rif Ec median
twoway (connected log2mic passage if ab=="Rif" & comm_type=="Emono", lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop", lcolor(purple) lwidth (thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(vlarge)) ///
ytitle("") ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(0.8) aspectratio(0.6) 

*Rif Sal median
twoway (connected log2mic passage if ab=="Rif" & comm_type=="Smono", lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop", lcolor(midgreen) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(vlarge)) ///
ytitle("") ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

*Amp Ec median
*Y-axis is problematic for some reason
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Emono" & passage<=10, lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & passage<=10, lcolor(purple) lwidth (thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 10)) xtick(#11) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)6)) ymtick(#9) ///
xtitle("Passage number", size(vlarge)) ///
ytitle("") ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

*Amp Sal median
*Y-axis is problematic for some reason
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Smono" & passage<=10, lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & passage<=10, lcolor(midgreen) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 10)) xtick(#10) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(vlarge)) ///
ytitle("") ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

*Amp Ec median up to P20
*Y-axis is problematic for some reason
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Emono", lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop", lcolor(purple) lwidth (thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)8)) ymtick(#13) ///
xtitle("Passage number", size(vlarge)) ///
ytitle("") ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

*Amp Sal median up to P20
*Y-axis is problematic for some reason
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Smono", lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop", lcolor(midgreen) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)8)) ytick(#9) ///
xtitle("Passage number", size(vlarge)) ///
ytitle("") ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 


