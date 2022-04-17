*****New look: no log2mic, SE instead of SD
*variables: spp (E/S), spp_num(1/2), evol(mono/coop), evol_num(1/2), comm_type(Emono/Smono/Ecoop/Scoop), comm_type_num(1/2/3/4),
*ab(Rif/Amp), ab_num(1/2), passage(1-20), rep(1-6), mic(#)

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\05.25.18 population MICs for stats no precalculated medians.dta"

*remove Rif Smono rep3, which has issues
drop in 161/180

collapse (mean) meanmic= mic (semean) semic= mic (count) n= mic, by(spp evol comm_type ab passage)
*basically the only variable absent here is rep, because we are collapsing different rep values into a single mean value per spp/evol/comm_type etc.
generate himic = meanmic + semic
generate lomic = meanmic - semic

*Rif Ecoli
graph twoway (connected meanmic passage if ab=="Rif" & comm_type=="Emono", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Emono", lwidth(medium) lcolor(midblue)) ///
(connected meanmic passage if ab=="Rif" & comm_type=="Ecoop", ///
lcolor(purple) lwidth(thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Ecoop", lwidth(medium) lcolor(purple)), ///
title("{it:E. coli} in Rifampicin, average MIC over time", size(large) color(black) margin(zero)) ///
xtitle("Transfer", size(medlarge)) ///
xlabel(0(1)20, labsize(medium)) xscale(range(0 20)) ///
ylabel(0(5)40, angle(horizontal) labsize(medium)) yscale(range(0 40)) ///
ytitle("MIC in Rifampicin", size(medlarge)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}") size(medium)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.55, placement(west)) ///
note("Transfer x culture type (mono or coop): p= 0.0328", size(medium)) 

*Rif Sal (no rep 3)
graph twoway (connected meanmic passage if ab=="Rif" & comm_type=="Smono", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Smono", lwidth(medium) lcolor(gold)) ///
(connected meanmic passage if ab=="Rif" & comm_type=="Scoop", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Rif" & comm_type=="Scoop", lwidth(medium) lcolor(green)), ///
title("{it:S. enterica} in Rifampicin, average MIC over time", size(large) color(black) margin(zero)) ///
xtitle("Transfer", size(medlarge)) ///
xlabel(0(1)20, labsize(medium)) xscale(range(0 20)) ///
ylabel(0(10)100, angle(horizontal) labsize(medium)) yscale(range(0 100)) ///
ytitle("MIC in Rifampicin", size(medlarge)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 3 "Co-culture-evolved {it:S. enterica}") size(medium)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.5, placement(west)) ///
note("Transfer x culture type (mono or coop): p= 0.010", size(medium)) 

*Amp Ecoli
graph twoway (connected meanmic passage if ab=="Amp" & comm_type=="Emono" & passage<=10, ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Emono" & passage<=10, lwidth(medium) lcolor(midblue)) ///
(connected meanmic passage if ab=="Amp" & comm_type=="Ecoop" & passage<=10, ///
lcolor(purple) lwidth(thick) mcolor(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Ecoop" & passage<=10, lwidth(medium) lcolor(purple)), ///
title("{it:E. coli} in Ampicillin, average MIC over time", size(large) color(black) margin(zero)) ///
xtitle("Transfer", size(medlarge)) ///
xlabel(0(1)10, labsize(medium)) xscale(range(0 10)) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) yscale(range(0 60)) ///
ytitle("MIC in Ampicillin", size(medlarge)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}") size(medium)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.55, placement(west)) ///
note("Transfer x culture type (mono or coop): p= 0.007", size(medium)) 


*Amp Sal
graph twoway (connected meanmic passage if ab=="Amp" & comm_type=="Smono" & passage<=10, ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Smono" & passage<=10, lwidth(medium) lcolor(gold)) ///
(connected meanmic passage if ab=="Amp" & comm_type=="Scoop" & passage<=10, ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(rcap himic lomic passage if ab=="Amp" & comm_type=="Scoop" & passage<=10, lwidth(medium) lcolor(green)), ///
title("{it:S. enterica} in Ampicillin, average MIC over time", size(large) color(black) margin(zero)) ///
xtitle("Transfer", size(medlarge)) ///
xlabel(0(1)10, labsize(medium)) xscale(range(0 10)) ///
ylabel(0(5)35, angle(horizontal) labsize(medium)) yscale(range(0 35)) ///
ytitle("MIC in Ampicillin", size(medlarge)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 3 "Co-culture-evolved {it:S. enterica}") size(medium)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.55, placement(west)) ///
note("Transfer x culture type (mono or coop): p= 0.0272", size(medium)) 

