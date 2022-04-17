*variables to choose from: spp (E,S), spp_num (1,2), evol (mono, coop) ///
*evol_num (1,2) comm_type (Emono, Smono, Ecoop, Scoop), comm_type_num (1,2,3,4) ////
*ab(Amp, Rif) ab_num (1,2) passage (1-20) rep (1-6) mic (some number)

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*ECoop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*NB: in coop, there are species-specific MICs, so do seperate graphs for each spp evolved in coop

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\01.30.18 population MICs first pass.dta", clear

generate log2mic = ln(mic)/ln(2) 

******************
*Rifampicin
******************

*Rif Ecoli monoculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Emono" & rep==1, lcolor(blue) lwidth(medium) mcolor(blue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Emono" & rep==2, lcolor(bluishgrey) lwidth(medium) mcolor(bluishgrey) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Emono" & rep==3, lcolor(cyan) lwidth(medium) mcolor(cyan) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Emono" & rep==4, lcolor(eltblue) lwidth(medium) mcolor(eltblue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Emono" & rep==5, lcolor(midblue) lwidth(medium) mcolor(midblue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Rif" & comm_type=="Emono" & rep==6, lcolor(teal) lwidth(medium) mcolor(teal) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:E. coli} in Rifampicin monoculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Rif Sal monoculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Smono" & rep==1, lcolor(cranberry) lwidth(medium) mcolor(cranberry) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Smono" & rep==2, lcolor(pink*0.5) lwidth(medium) mcolor(pink*0.5) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Smono" & rep==3, lcolor(maroon) lwidth(medium) mcolor(maroon) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Smono" & rep==4, lcolor(red) lwidth(medium) mcolor(red) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Smono" & rep==5, lcolor(magenta) lwidth(medium) mcolor(magenta) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Rif" & comm_type=="Smono" & rep==6, lcolor(erose) lwidth(medium) mcolor(erose) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:S. enterica} in Rifampicin monoculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Rif Ecoli coculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop" & rep==1, lcolor(lime*0.7) lwidth(medium) mcolor(lime*0.7) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop" & rep==2, lcolor(dkgreen) lwidth(medium) mcolor(dkgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop" & rep==3, lcolor(olive_teal) lwidth(medium) mcolor(olive_teal) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop" & rep==4, lcolor(midgreen) lwidth(medium) mcolor(midgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop" & rep==5, lcolor(mint) lwidth(medium) mcolor(mint) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop" & rep==6, lcolor(eltgreen) lwidth(medium) mcolor(eltgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:E. coli} in Rifampicin coculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Rif Sal coculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Scoop" & rep==1, lcolor(lime*0.7) lwidth(medium) mcolor(lime*0.7) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop" & rep==2, lcolor(dkgreen) lwidth(medium) mcolor(dkgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop" & rep==3, lcolor(olive_teal) lwidth(medium) mcolor(olive_teal) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop" & rep==4, lcolor(midgreen) lwidth(medium) mcolor(midgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop" & rep==5, lcolor(mint) lwidth(medium) mcolor(mint) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Rif" & comm_type=="Scoop" & rep==6, lcolor(eltgreen) lwidth(medium) mcolor(eltgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:S. enterica} in Rifampicin coculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

******************
*Ampicillin
******************

*Amp Ecoli monoculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Emono" & rep==1, lcolor(blue) lwidth(medium) mcolor(blue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Emono" & rep==2, lcolor(bluishgrey) lwidth(medium) mcolor(bluishgrey) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Emono" & rep==3, lcolor(cyan) lwidth(medium) mcolor(cyan) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Emono" & rep==4, lcolor(eltblue) lwidth(medium) mcolor(eltblue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Emono" & rep==5, lcolor(midblue) lwidth(medium) mcolor(midblue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Amp" & comm_type=="Emono" & rep==6, lcolor(teal) lwidth(medium) mcolor(teal) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:E. coli} in Ampicillin monoculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Amp Sal monoculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Smono" & rep==1, lcolor(cranberry) lwidth(medium) mcolor(cranberry) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Smono" & rep==2, lcolor(pink*0.5) lwidth(medium) mcolor(pink*0.5) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Smono" & rep==3, lcolor(maroon) lwidth(medium) mcolor(maroon) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Smono" & rep==4, lcolor(red) lwidth(medium) mcolor(red) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Smono" & rep==5, lcolor(magenta) lwidth(medium) mcolor(magenta) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Amp" & comm_type=="Smono" & rep==6, lcolor(erose) lwidth(medium) mcolor(erose) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:S. enterica} in Ampicillin monoculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Amp Ecoli coculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & rep==1, lcolor(lime*0.7) lwidth(medium) mcolor(lime*0.7) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & rep==2, lcolor(dkgreen) lwidth(medium) mcolor(dkgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & rep==3, lcolor(olive_teal) lwidth(medium) mcolor(olive_teal) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & rep==4, lcolor(midgreen) lwidth(medium) mcolor(midgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & rep==5, lcolor(mint) lwidth(medium) mcolor(mint) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop" & rep==6, lcolor(eltgreen) lwidth(medium) mcolor(eltgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:E. coli} in Ampicillin coculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

*Amp Sal coculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & rep==1, lcolor(lime*0.7) lwidth(medium) mcolor(lime*0.7) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & rep==2, lcolor(dkgreen) lwidth(medium) mcolor(dkgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & rep==3, lcolor(olive_teal) lwidth(medium) mcolor(olive_teal) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & rep==4, lcolor(midgreen) lwidth(medium) mcolor(midgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) ///
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & rep==5, lcolor(mint) lwidth(medium) mcolor(mint) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)) /// 
(connected log2mic passage if ab=="Amp" & comm_type=="Scoop" & rep==6, lcolor(eltgreen) lwidth(medium) mcolor(eltgreen) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), /// 
title("{it:S. enterica} in Ampicillin coculture-evolved," "log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero)) ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(Median MIC)", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6") size(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) 

