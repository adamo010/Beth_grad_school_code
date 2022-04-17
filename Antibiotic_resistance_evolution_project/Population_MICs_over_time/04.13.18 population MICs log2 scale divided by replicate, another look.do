****Another way to look at rep-specific MICs over time

*variables to choose from: spp (E,S), spp_num (1,2), evol (mono, coop) ///
*evol_num (1,2) comm_type (Emono, Smono, Ecoop, Scoop), comm_type_num (1,2,3,4) ////
*ab(Amp, Rif) ab_num (1,2) passage (1-20) rep (1-6) mic (some number)

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*ECoop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen

*NB: in coop, there are species-specific MICs, so do seperate graphs for each spp evolved in coop

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\01.30.18 population MICs first pass.dta", clear

generate log2mic = ln(mic)/ln(2) 

******************
*Rifampicin
******************

*Rif Ecoli monoculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Emono", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:E. coli} in Rifampicin monoculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(blue) lwidth(medium) mcolor(blue) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 


*Rif Sal monoculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Smono", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:S. enterica} in Rifampicin monoculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(cranberry) lwidth(medium) mcolor(cranberry) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 


*Rif Ecoli coculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Ecoop", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:E. coli} in Rifampicin coculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(green) lwidth(medium) mcolor(green) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 

*Rif Sal coculture
twoway(connected log2mic passage if ab=="Rif" & comm_type=="Scoop", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:S. enterica} in Rifampicin coculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(green) lwidth(medium) mcolor(green) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 


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
lcolor(cranberry) lwidth(medium) mcolor(cranberry) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(medium)) xscale(range(0 20)) xtick(#21) ///
ylabel(, labsize(medium) angle(horizontal)) yscale(range(0(0.5)4)) ytick(#9) ///
xtitle("Passage number", size(medium)) ///
ytitle("log{subscript:2}(MIC)", size(medium)) 


*Amp Ecoli coculture
twoway(connected log2mic passage if ab=="Amp" & comm_type=="Ecoop", ///
by(rep, graphregion(fcolor(white)) plotregion(margin(zero)) title("{it:E. coli} in Ampicillin coculture-evolved, log{subscript:2}MIC by replicate", size(medlarge) color(black) margin(zero))) ///
lcolor(green) lwidth(medium) mcolor(green) msymbol(circle) msize(medlarge) mlcolor(black) mlwidth(vthin)), ///
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
