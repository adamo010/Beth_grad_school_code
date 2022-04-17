*variables: time (0-9), emono_mic, smono_mic, ecoop_mic, scoop_mic, coop_mic

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\06.05.18 time hypothesis dummy data.dta"

generate emono_mic2 = ln(emono_mic)/ln(2) 
generate smono_mic2 = ln(smono_mic)/ln(2) 
generate ecoop_mic2 = ln(ecoop_mic)/ln(2) 
generate scoop_mic2 = ln(scoop_mic)/ln(2) 
generate coop_mic2 = ln(coop_mic)/ln(2) 

*Monoculture evol model graph: both moncultures on one graph
twoway (connected emono_mic2 time if time<=4, lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected smono_mic2 time if time<=4, lcolor(gold) lwidth(thick) mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
xlabel(, labsize(large)) xscale(range(0 4)) xtick(#5) ///
ylabel(, labsize(large) angle(horizontal)) yscale(range(0(0.5)5)) ymtick(#11) ///
xtitle("Time", size(vlarge)) ///
ytitle("log{subscript:2}(MIC)", size(vlarge)) ///
legend(colfirst rows(1) order(1 "{it:E. coli} monoculture" 2 "{it: S. enterica} monoculture") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(0.8) aspectratio(0.6)

*Monoculture evol model: E only
twoway (connected emono_mic2 time if time<=4, lcolor(midblue) lwidth(thick) ///
mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} monoculture resistance evolution", size(huge) color(black)) ///
xlabel(, labsize(vlarge)) xscale(range(0 4)) xtick(#5) ///
ylabel(, labsize(vlarge) angle(horizontal)) yscale(range(0(0.5)5)) ytick(#11) ///
xtitle("Time", size(vlarge) color(black)) ///
ytitle("log{subscript:2}(MIC)", size(vlarge) color(black)) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(0.8) aspectratio(0.6)

*Monoculture evol model: S only
twoway (connected smono_mic2 time if time<=4, lcolor(gold) lwidth(thick) ///
mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} monoculture resistance evolution", size(huge) color(black)) ///
xlabel(, labsize(vlarge)) xscale(range(0 4)) xtick(#5) ///
ylabel(, labsize(vlarge) angle(horizontal)) yscale(range(0(0.5)5)) ymtick(#11) ///
xtitle("Time", size(vlarge) color(black)) ///
ytitle("log{subscript:2}(MIC)", size(vlarge) color(black)) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(0.8) aspectratio(0.6)

*Coculture evol model graph by spp
twoway (connected ecoop_mic2 time if time<=4, lcolor(midblue) lwidth(thick) ///
mcolor(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected scoop_mic2 time if time<=4, lcolor(gold) lwidth(thick) ///
mcolor(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture resistance evolution, by species", size(huge) color(black)) ///
xlabel(, labsize(vlarge)) xscale(range(0 4)) xtick(#5) ///
ylabel(, labsize(vlarge) angle(horizontal)) yscale(range(0(0.5)5)) ytick(#11) ///
xtitle("Time", size(vlarge)) ///
ytitle("log{subscript:2}(MIC)", size(vlarge)) ///
legend(colfirst rows(1) order(1 "{it:E. coli} co-culture" 2 "{it: S. enterica} co-culture") size(large)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(0.8) aspectratio(0.6)

*Coculture evol model graph with total co-culture
twoway(connected coop_mic2 time if time<=4, lcolor(midgreen) lwidth(thick) ///
mcolor(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture resistance evolution, effective MIC", size(huge) color(black)) ///
xlabel(, labsize(vlarge)) xscale(range(0 4)) xtick(#5) ///
ylabel(, labsize(vlarge) angle(horizontal)) yscale(range(0(0.5)5)) ytick(#11) ///
xtitle("Time", size(vlarge)) ///
ytitle("log{subscript:2}(MIC)", size(vlarge)) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(0.8) aspectratio(0.6)


