*Let's try this again and see if we get anything useful
*NOT FINISHED as of 11.29.18: have two graphs for all isolates, one for isolates collapsed by population

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"

*First, try it without collapsing population
*also, only use resistant isolates(?)

generate dumb_shit = 1 if type=="anc" & evol_condn=="Eanc"
replace dumb_shit = 2 if type=="abfree_isol" & evol_condn=="Emono"
replace dumb_shit = 3 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 4 if type=="abfree_isol" & evol_condn=="Ecoop"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 6 if type=="anc" & evol_condn=="Coopanc"
replace dumb_shit = 7 if type=="anc" & evol_condn=="Sanc"
replace dumb_shit = 8 if type=="abfree_isol" & evol_condn=="Smono"
replace dumb_shit = 9 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 10 if type=="abfree_isol" & evol_condn=="Scoop"
replace dumb_shit = 11 if type=="res_isol" & evol_condn=="Scoop"

generate log2mic = ln(mic)/ln(2) 

*************************
*Rifampicin growth rates
*not by replicate
*************************

*Rif E monoculture GRs
regress mono_gr log2mic if dumb_shit==3 & ab=="Rif"
est store mono_ev_RifE
regress mono_gr log2mic if dumb_shit==5 & ab=="Rif"
est store coop_ev_RifE
suest mono_ev_RifE coop_ev_RifE
*This tests ?????
test [mono_ev_RifE_mean]log2mic=[coop_ev_RifE_mean]log2mic
*Compare if slopes are different (?)

*Rif Ecoli monoculture vs coculture: monoculture growth rates
*R2 value from regress command above (straight R2, not adjusted)

graph twoway (lfit mono_gr log2mic if dumb_shit==3 & ab=="Rif", color(midblue)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==5 & ab=="Rif", color(purple)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif", color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Rifampicin, {it:E. coli} isolates, log{subscript:2}MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Rifampicin, {&mu}g/mL", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medium)) yscale(range(0 0.8)) ///
text(0.5 4.2 "R{superscript:2}=0.4210", size(medsmall)) text(0.2 4.2 "R{superscript:2}= 0.0502", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} {it:p}=0.0319", size(medsmall) span)

*Rif S monoculture GRs
regress mono_gr log2mic if dumb_shit==9 & ab=="Rif"
est store mono_ev_RifS
regress mono_gr log2mic if dumb_shit==11 & ab=="Rif"
est store coop_ev_RifS
suest mono_ev_RifS coop_ev_RifS
test [mono_ev_RifS_mean]log2mic=[coop_ev_RifS_mean]log2mic

graph twoway (lfit mono_gr log2mic if dumb_shit==9 & ab=="Rif", color(gold)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif", color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==11 & ab=="Rif", color(green)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif", color(green) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Rifampicin, {it:S. enterica} isolates, log{subscript:2}MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Rifampicin, {&mu}g/mL", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0)) ///
text(0.95 4.2 "R{superscript:2}=0.2828", size(medsmall)) text(0.65 4.2 "R{superscript:2}= 0.0788", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} {it:p}=0.0044", size(medsmall) span)

***********************Collapsed by replicate***************************************

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2)
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

**********Rif Ecoli***************

*Mono GRs
regress meanmono_gr meanmic if ab=="Rif" & evol_condn=="Emono" & type=="res_isol"
est store mono_ev_RifE
regress meanmono_gr meanmic if ab=="Rif" & evol_condn=="Ecoop" & type=="res_isol"
est store coop_ev_RifE
suest mono_ev_RifE coop_ev_RifE
*This tests ?????
test [mono_ev_RifE_mean]meanmic=[coop_ev_RifE_mean]meanmic
*Compare if slopes are different (?)

graph twoway (lfit meanmono_gr meanmic if ab=="Rif" & evol_condn=="Emono" & type=="res_isol", color(midblue)) ///
(scatter meanmono_gr meanmic if ab=="Rif" & evol_condn=="Emono" & type=="res_isol", color(midblue) msymbol(circle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(9) mlabc(midblue)) ///
(lfit meanmono_gr meanmic if ab=="Rif" & evol_condn=="Ecoop" & type=="res_isol", color(purple)) ///
(scatter meanmono_gr meanmic if ab=="Rif" & evol_condn=="Ecoop" & type=="res_isol", color(purple) msymbol(circle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(9) mlabc(purple)), ///
title("Rifampicin, {it:S. enterica} isolates, log{subscript:2}MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Rifampicin, {&mu}g/mL", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
xlabel(0(1)8, labsize(medium)) xscale(range(0 8))

*Coop GRs

xxxxxx

*****Rif Sal*******
*Mono GRs

XXXXXXXXXXXXX

*Coop GRs

XXXXXXXXXX

**********Amp Ecoli**************
*Mono GRs
regress meanmono_gr meanmic if ab=="Amp" & evol_condn=="Emono" & type=="res_isol"
est store mono_ev_AmpE
regress meanmono_gr meanmic if ab=="Amp" & evol_condn=="Ecoop" & type=="res_isol"
est store coop_ev_AmpE
suest mono_ev_AmpE coop_ev_AmpE
*This tests ?????
test [mono_ev_AmpE_mean]meanmic=[coop_ev_AmpE_mean]meanmic
*Compare if slopes are different (?)

graph twoway (lfit meanmono_gr meanmic if ab=="Amp" & evol_condn=="Emono" & type=="res_isol", color(midblue)) ///
(scatter meanmono_gr meanmic if ab=="Amp" & evol_condn=="Emono" & type=="res_isol", color(midblue) msymbol(circle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(6) mlabc(midblue)) ///
(lfit meanmono_gr meanmic if ab=="Amp" & evol_condn=="Ecoop" & type=="res_isol", color(purple)) ///
(scatter meanmono_gr meanmic if ab=="Amp" & evol_condn=="Ecoop" & type=="res_isol", color(purple) msymbol(circle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(12) mlabc(purple)), ///
title("Ampicillin, {it:S. enterica} isolates, log{subscript:2}MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Ampicillin, {&mu}g/mL", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1, labsize(medium)) yscale(range(0 1)) ///
xlabel(-1.5(0.5)3, labsize(medium)) xscale(range(-1.5 3))

*Coop GRs
regress meancoop_gr meanmic if ab=="Amp" & evol_condn=="Emono" & type=="res_isol"
est store mono_ev_AmpE
regress meancoop_gr meanmic if ab=="Amp" & evol_condn=="Ecoop" & type=="res_isol"
est store coop_ev_AmpE
suest mono_ev_AmpE coop_ev_AmpE
*This tests ?????
test [mono_ev_AmpE_mean]meanmic=[coop_ev_AmpE_mean]meanmic
*Compare if slopes are different (?)

graph twoway (lfit meancoop_gr meanmic if ab=="Amp" & evol_condn=="Emono" & type=="res_isol", color(midblue)) ///
(scatter meancoop_gr meanmic if ab=="Amp" & evol_condn=="Emono" & type=="res_isol", color(midblue) msymbol(triangle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(6) mlabc(midblue)) ///
(lfit meancoop_gr meanmic if ab=="Amp" & evol_condn=="Ecoop" & type=="res_isol", color(purple)) ///
(scatter meancoop_gr meanmic if ab=="Amp" & evol_condn=="Ecoop" & type=="res_isol", color(purple) msymbol(triangle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(12) mlabc(purple)), ///
title("Ampicillin, {it:S. enterica} isolates, log{subscript:2}MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Ampicillin, {&mu}g/mL", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
xlabel(-1.5(0.5)2.5, labsize(medium)) xscale(range(-1.5 2.5))


**********Amp Sal**************
*Mono GRs
regress meanmono_gr meanmic if ab=="Amp" & evol_condn=="Smono" & type=="res_isol"
est store mono_ev_AmpE
regress meanmono_gr meanmic if ab=="Amp" & evol_condn=="Scoop" & type=="res_isol"
est store coop_ev_AmpE
suest mono_ev_AmpE coop_ev_AmpE
*This tests ?????
test [mono_ev_AmpE_mean]meanmic=[coop_ev_AmpE_mean]meanmic
*Compare if slopes are different (?)

graph twoway (lfit meanmono_gr meanmic if ab=="Amp" & evol_condn=="Smono" & type=="res_isol", color(gold)) ///
(scatter meanmono_gr meanmic if ab=="Amp" & evol_condn=="Smono" & type=="res_isol", color(gold) msymbol(circle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(6) mlabc(gold)) ///
(lfit meanmono_gr meanmic if ab=="Amp" & evol_condn=="Scoop" & type=="res_isol", color(green)) ///
(scatter meanmono_gr meanmic if ab=="Amp" & evol_condn=="Scoop" & type=="res_isol", color(green) msymbol(circle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(12) mlabc(green)), ///
title("Ampicillin, {it:S. enterica} isolates, log{subscript:2}MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Ampicillin, {&mu}g/mL", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1, labsize(medium)) yscale(range(0 1)) ///
xlabel(-3(0.5)2.5, labsize(medium)) xscale(range(-3 2.5))

*Coop GRs
regress meancoop_gr meanmic if ab=="Amp" & evol_condn=="Smono" & type=="res_isol"
est store mono_ev_AmpE
regress meancoop_gr meanmic if ab=="Amp" & evol_condn=="Scoop" & type=="res_isol"
est store coop_ev_AmpE
suest mono_ev_AmpE coop_ev_AmpE
*This tests ?????
test [mono_ev_AmpE_mean]meanmic=[coop_ev_AmpE_mean]meanmic
*Compare if slopes are different (?)

graph twoway (lfit meancoop_gr meanmic if ab=="Amp" & evol_condn=="Smono" & type=="res_isol", color(gold)) ///
(scatter meancoop_gr meanmic if ab=="Amp" & evol_condn=="Smono" & type=="res_isol", color(gold) msymbol(triangle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(9) mlabc(gold)) ///
(lfit meancoop_gr meanmic if ab=="Amp" & evol_condn=="Scoop" & type=="res_isol", color(green)) ///
(scatter meancoop_gr meanmic if ab=="Amp" & evol_condn=="Scoop" & type=="res_isol", color(green) msymbol(triangle) msize(large) ///
mlcolor(black) mlwidth(vthin) mlabel(pop_id) mlabp(9) mlabc(green)), ///
title("Ampicillin, {it:S. enterica} isolates, log{subscript:2}MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}MIC in Ampicillin, {&mu}g/mL", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved, resistant" 3 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
xlabel(-3(0.5)2.5, labsize(medium)) xscale(range(-3 2.5))
