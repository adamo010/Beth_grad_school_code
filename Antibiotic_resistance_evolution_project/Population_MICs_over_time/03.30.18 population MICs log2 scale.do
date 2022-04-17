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
twoway (connected log2mic passage if ab=="Rif" & comm_type=="Emono", lcolor(blue) lwidth(medium) mcolor(blue) msymbol(circle) msize(medlarge) ) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop", lcolor(green) lwidth (medium) mcolor(green) msymbol(circle) msize(medlarge)), ///
title("{it:E. coli} in Rifampicin, median MIC", size(large) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medlarge)) ///
ytitle("log{subscript:2}(Median MIC)", size(medlarge)) ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Rif Sal median
twoway (connected log2mic passage if ab=="Rif" & comm_type=="Smono", lcolor(gold) lwidth(medium) mcolor(gold) msymbol(circle) msize(medlarge) ) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop", lcolor(green) lwidth (medium) mcolor(green) msymbol(circle) msize(medlarge)), ///
title("{it:S. enterica} in Rifampicin, median MIC", size(large) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medlarge)) ///
ytitle("log{subscript:2}(Median MIC)", size(medlarge)) ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Amp Ec median
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Emono", lcolor(blue) lwidth(medium) mcolor(blue) msymbol(circle) msize(medlarge) ) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop", lcolor(green) lwidth (medium) mcolor(green) msymbol(circle) msize(medlarge)), ///
title("{it:E. coli} in Ampicillin, median MIC", size(large) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)6)) ytick(#7) ///
xtitle("Passage number", size(medlarge)) ///
ytitle("log{subscript:2}(Median MIC)", size(medlarge)) ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Amp Sal median
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Smono", lcolor(gold) lwidth(medium) mcolor(gold) msymbol(circle) msize(medlarge) ) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop", lcolor(green) lwidth (medium) mcolor(green) msymbol(circle) msize(medlarge)), ///
title("{it:S. enterica} in Ampicillin, median MIC", size(large) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)6)) ytick(#7) ///
xtitle("Passage number", size(medlarge)) ///
ytitle("log{subscript:2}(Median MIC)", size(medlarge)) ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

