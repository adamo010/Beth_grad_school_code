****** Amp P10 MICs over time: try to make boxplots for each time point

*variables: spp (E/S), spp_num(1/2), evol(mono/coop), evol_num(1/2), comm_type(Emono/Smono/Ecoop/Scoop), comm_type_num(1/2/3/4),
*ab(Rif/Amp), ab_num(1/2), passage(1-20), rep(1-6), mic(#)

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\05.25.18 population MICs for stats no precalculated medians.dta"

generate log2mic = ln(mic)/ln(2) 

collapse (mean) meanmic= log2mic (sd) sdmic= log2mic (count) n= log2mic, by(spp evol comm_type ab passage)
*basically the only variable absent here is rep, because we are collapsing different rep values into a single mean value per spp/evol/comm_type etc.
generate himic = meanmic + invttail(n-1,0.025)*(sdmic / sqrt(n))
generate lomic = meanmic - invttail(n-1,0.025)*(sdmic / sqrt(n))

*Rif Ecoli
graph twoway (connected meanmic passage if ab=="Rif" & comm_type=="Emono", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Emono", lwidth(medium) lcolor(midblue)) ///
(connected meanmic passage if ab=="Rif" & comm_type=="Ecoop", ///
lcolor(purple) lwidth(thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Ecoop", lwidth(medium) lcolor(purple)), ///
title("{it:E. coli} in Rifampicin, average log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
xtitle("Passage", size(medium)) ///
xlabel(0(1)20, labsize(medsmall)) xscale(range(0 20)) ///
ylabel(-3(1)7, labsize(medsmall)) yscale(range(-3 7)) ///
ytitle("log{subscript:2}(MIC) in Rifampicin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))

*Rif Sal
graph twoway (connected meanmic passage if ab=="Rif" & comm_type=="Smono", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Smono", lwidth(medium) lcolor(gold)) ///
(connected meanmic passage if ab=="Rif" & comm_type=="Scoop", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Scoop", lwidth(medium) lcolor(green)), ///
title("{it:S. enterica} in Rifampicin, average log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
xtitle("Passage", size(medium)) ///
xlabel(0(1)20, labsize(medsmall)) xscale(range(0 20)) ///
ylabel(-3(1)7, labsize(medsmall)) yscale(range(-3 7)) ///
ytitle("log{subscript:2}(MIC) in Rifampicin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 3 "Co-culture-evolved {it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))

*Amp Ecoli
graph twoway (connected meanmic passage if ab=="Amp" & comm_type=="Emono" & passage<=10, ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Emono" & passage<=10, lwidth(medium) lcolor(midblue)) ///
(connected meanmic passage if ab=="Amp" & comm_type=="Ecoop" & passage<=10, ///
lcolor(purple) lwidth(thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Ecoop" & passage<=10, lwidth(medium) lcolor(purple)), ///
title("{it:E. coli} in Ampicillin, average log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
xtitle("Passage", size(medium)) ///
xlabel(0(1)10, labsize(medsmall)) xscale(range(0 10)) ///
ylabel(-1(1)7, labsize(medsmall)) yscale(range(-1 7)) ///
ytitle("log{subscript:2}(MIC) in Ampicillin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))

*Amp Sal
graph twoway (connected meanmic passage if ab=="Amp" & comm_type=="Smono" & passage<=10, ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Smono" & passage<=10, lwidth(medium) lcolor(gold)) ///
(connected meanmic passage if ab=="Amp" & comm_type=="Scoop" & passage<=10, ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Scoop" & passage<=10, lwidth(medium) lcolor(green)), ///
title("{it:S. enterica} in Ampicillin, average log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
xtitle("Passage", size(medium)) ///
xlabel(0(1)10, labsize(medsmall)) xscale(range(0 10)) ///
ylabel(-1(1)6, labsize(medsmall)) yscale(range(-1 6)) ///
ytitle("log{subscript:2}(MIC) in Ampicillin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 3 "Co-culture-evolved {it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))

***************
*Amp Ecoli
graph twoway (connected meanmic passage if ab=="Amp" & comm_type=="Emono", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Emono", lwidth(medium) lcolor(midblue)) ///
(connected meanmic passage if ab=="Amp" & comm_type=="Ecoop", ///
lcolor(purple) lwidth(thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Ecoop", lwidth(medium) lcolor(purple)), ///
title("{it:E. coli} in Ampicillin, average log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
xtitle("Passage", size(medium)) ///
xlabel(0(1)20, labsize(medsmall)) xscale(range(0 20)) ///
ylabel(-1(1)7, labsize(medsmall)) yscale(range(-1 7)) ///
ytitle("log{subscript:2}(MIC) in Ampicillin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))

*Amp Sal
graph twoway (connected meanmic passage if ab=="Amp" & comm_type=="Smono", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Smono", lwidth(medium) lcolor(gold)) ///
(connected meanmic passage if ab=="Amp" & comm_type=="Scoop", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Scoop", lwidth(medium) lcolor(green)), ///
title("{it:S. enterica} in Ampicillin, average log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
xtitle("Passage", size(medium)) ///
xlabel(0(1)20, labsize(medsmall)) xscale(range(0 20)) ///
ylabel(-1(1)8, labsize(medsmall)) yscale(range(-1 8)) ///
ytitle("log{subscript:2}(MIC) in Ampicillin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 3 "Co-culture-evolved {it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))
