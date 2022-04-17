*Ampicillin MICs over time dropping contaminated replicates
*used data from excel file 01.17.18 Compiled Amp and Rif MICs with updated Amp coop reps 1-2

*variables to choose from: spp (E,S), spp_num (1,2), evol (mono, coop) ///
*evol_num (1,2) comm_type (Emono, Smono, Ecoop, Scoop), comm_type_num (1,2,3,4) ////
*ab(Amp, Rif) ab_num (1,2) passage (1-20) rep (1-6) mic (some number)

*Start with replicate-specific graphs

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\01.30.18 population MICs first pass.dta", clear

generate log2mic = ln(mic)/ln(2) 

******************
*Ampicillin
******************

*Amp Ecoli monoculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Emono", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:E. coli} in Ampicillin monoculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(blue) lwidth(medium) mcolor(blue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 

*Amp Sal monoculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Smono", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:S. enterica} in Ampicillin monoculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(gold) lwidth(medium) mcolor(gold) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 

*Amp Ecoli coculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:E. coli} in Ampicillin coculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(purple) lwidth(medium) mcolor(purple) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 

*Amp Sal coculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Scoop", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:S. enterica} in Ampicillin coculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(green) lwidth(medium) mcolor(green) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 

*Now do median graphs: had to redo median/average calculations, which is fine
*got these data from a spreadsheet called 10.04.18 Compiled Amp and Rif MICs remove Amp reps 1 and 2

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\10.04.18 population MICs Amp dropping contaminated replicates.dta"

generate log2mic = ln(med_mic)/ln(2) 
*Amp Ec median 
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Emono", lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop", lcolor(purple) lwidth (thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(0(2)8, labsize(large) angle(horizontal)) yscale(range(0(2)8)) ytick(#5)  ///
xtitle("Passage number", size(large)) ///
ytitle("") ///
title("{it:E. coli} in Ampicillin over time reps 3-6," "median log{subscript:2}MIC", size(large) color(black) margin(zero)) ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(medlarge)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

*Amp Sal median
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Smono", lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop", lcolor(midgreen) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(0(2)8, labsize(large) angle(horizontal)) yscale(range(0(2)8)) ytick(#5)  ///
xtitle("Passage number", size(large)) ///
ytitle("") ///
title("{it:S. enterica} in Ampicillin over time reps 3-6," "median log{subscript:2}MIC", size(large) color(black) margin(zero)) ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(medlarge)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

****************************************
*Now do all reps just for sanity's sake
****************************************

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\01.31.18 population MICs precalculated mean and median.dta", clear

generate log2mic = ln(med_mic)/ln(2) 

*Amp Ec median all reps
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Emono", lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop", lcolor(purple) lwidth (thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(0(2)8, labsize(large) angle(horizontal)) yscale(range(0(2)8)) ytick(#5)  ///
xtitle("Passage number", size(large)) ///
ytitle("") ///
title("{it:E. coli} in Ampicillin over time all reps," "median log{subscript:2}MIC", size(large) color(black) margin(zero)) ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it:E. coli} cooperative") size(medlarge)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 

*Amp Sal median up to P20
twoway (connected log2mic passage if ab=="Amp" & comm_type=="Smono", lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop", lcolor(midgreen) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 20)) xtick(#21) ///
ylabel(0(2)8, labsize(large) angle(horizontal)) yscale(range(0(2)8)) ytick(#5)  ///
xtitle("Passage number", size(large)) ///
ytitle("") ///
title("{it:S. enterica} in Ampicillin over time all reps," "median log{subscript:2}MIC", size(large) color(black) margin(zero)) ///
legend(colfirst rows(1) order(1 "{it:S. enterica} monoculture" 2 "{it:S. enterica} cooperative") size(medlarge)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(0.8) aspectratio(0.6) 






