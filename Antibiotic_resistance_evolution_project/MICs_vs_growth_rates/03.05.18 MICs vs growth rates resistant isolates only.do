*Return to doom: mic vs. growth rate

*variable names are: ab(Rif/Amp), ab_num(1/2), spp(E/S), spp_num(1/2), comm_type (mono/coop), comm_type_num(1/2),  ///
*spptype(Emono/Ecoop/Smono/Scoop), spptype_num(1/2/3/4), *rep(1-6), mic(some#), isolate_id,  ///
*mono_gr(#), mono_yield(#), coop_gr(#), coop_yield(#)

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\MICs vs growth rates\03.05.18 MICs vs growth rates resistant isolates only.dta", clear

generate log2mic = ln(mic)/ln(2) 

*************************
*Monoculture growth rates
*************************

*Rif Ecoli monoculture vs coculture ignore reps
graph twoway (scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Emono" & ab=="Rif", color(midblue)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(midgreen)), ///
title("{it:E. coli} Rifampicin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] (ug/mL)", size(medsmall)) ytitle("Monoculture hrowth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medium)) yscale(range(0 0.8))

*Rif Sal monoculture vs coculture ignore reps
graph twoway (scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif", color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Smono" & ab=="Rif", color(cranberry)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Scoop" & ab=="Rif", color(midgreen)), ///
title("{it:S. enterica} Rifampicin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] (ug/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1, labsize(medium)) yscale(range(0 1))

*Amp Ecoli monoculture vs coculture ignore reps
graph twoway (scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Emono" & ab=="Amp", color(midblue)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(midgreen)), ///
title("{it:E. coli} Ampicillin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] (ug/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1.4, labsize(medium)) yscale(range(0 1.4))

*Amp Sal monoculture vs coculture ignore reps
graph twoway (scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp", color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Smono" & ab=="Amp", color(cranberry)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Scoop" & ab=="Amp", color(midgreen)), ///
title("{it:S. enterica} Ampicillin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] (ug/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2))

***********************
*Coculture growth rates
***********************

*Rif Ecoli monoculture vs coculture ignore reps
graph twoway (scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Emono" & ab=="Rif", color(midblue)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(midgreen)), ///
title("{it:E. coli} Rifampicin, resistant isolate log2MICs" "vs. cooperative growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] (ug/mL)", size(medsmall)) ytitle("Cooperative growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.6, labsize(medium)) yscale(range(0 0.6))

*Rif Sal monoculture vs coculture ignore reps
graph twoway (scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif", color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Smono" & ab=="Rif", color(cranberry)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Scoop" & ab=="Rif", color(midgreen)), ///
title("{it:S. enterica} Rifampicin, resistant isolate log2MICs" "vs. cooperative growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] (ug/mL)", size(medsmall)) ytitle("Cooperative growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.6, labsize(medium)) yscale(range(0 0.6))

*Amp Ecoli monoculture vs coculture ignore reps
graph twoway (scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Emono" & ab=="Amp", color(midblue)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(midgreen)), ///
title("{it:E. coli} Ampicillin, resistant isolate log2MICs" "vs. cooperative growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] (ug/mL)", size(medsmall)) ytitle("Cooperative growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7))

*Amp Sal monoculture vs coculture ignore reps
graph twoway (scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp", color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Smono" & ab=="Amp", color(cranberry)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Scoop" & ab=="Amp", color(midgreen)), ///
title("{it:S. enterica} Ampicillin, resistant isolate log2MICs" "vs. cooperative growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] (ug/mL)", size(medsmall)) ytitle("Cooperative growth rate", size(medium) margin(vsmall)) ///
legend(colfirst rows(1) order(1 "Monoculture-evolved" 3 "Coculture-evolved") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7))



