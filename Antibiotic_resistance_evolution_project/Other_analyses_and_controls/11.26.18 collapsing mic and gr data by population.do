***Collapsing MIC and GR data by population
 *NOTE: I did this on the saved 11.15.18 dataset and saved it, but JUST IN CASE future Beth needs this:
 *destring coop_gr, replace ignore(NA)
 *This command converted coop_gr to a numerical variable vs. the string variable it was coded as because of a fucking NA read
 *(this command also removes NA and replaces it with .)
 
************************First: by mono_gr*************************************************
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*New variables here: pop_id, ab, type(abfree_isol, res_isol), evol_condn(Emono/Smono/Ecoop/Scoop), growth_condn(mono), spp(E/S),
*rep(1-6), meanmono_gr(#)

generate dumb_shit = 0.5 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 2.5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 7 if type=="res_isol" & evol_condn=="Scoop"

*Rif E mono stats
ranksum meanmono_gr if(ab=="Rif" & (dumb_shit==0.5 | dumb_shit==2.5)), by(dumb_shit)
ranksum meanmono_gr if(ab=="Rif" & (dumb_shit==5 | dumb_shit==7)), by(dumb_shit)

*Rif mono growth rates
*15 underscores for this p-value
stripplot meanmono_gr if ab=="Rif", over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5) ///
title("Rifampicin, monoculture growth rates", size(large) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue purple gold green)  ///
msymbol(circle circle circle circle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:E. coli}" "' 2.5 `" "Coculture-" "evolved" "{it:E. coli}" "' ///
5 `" "Monoculture-" "evolved" "{it:S. enterica}" "' 7 `" "Coculture-" "evolved" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") xscale(range(0 8)) ///
ylabel(0(0.1)1.0, labsize(medlarge)) yscale(range(0 1.0)) ///
text(0.75 1.5 "p=0.1093", size(medium)) ///
text(0.73 1.5 "_______________", size(medium)) ///
text(0.92 6 "p=0.0374", size(medium)) ///
text(0.90 6 "_______________", size(medium))

*Amp stats
ranksum meanmono_gr if(ab=="Amp" & (dumb_shit==0.5 | dumb_shit==2.5)), by(dumb_shit)
ranksum meanmono_gr if(ab=="Amp" & (dumb_shit==5 | dumb_shit==7)), by(dumb_shit)

*Amp mono growth rates
*15 underscores for this p-value
stripplot meanmono_gr if ab=="Amp", over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5) ///
title("Ampicillin, monoculture growth rates", size(large) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue purple gold green)  ///
msymbol(circle circle circle circle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:E. coli}" "' 2.5 `" "Coculture-" "evolved" "{it:E. coli}" "' ///
5 `" "Monoculture-" "evolved" "{it:S. enterica}" "' 7 `" "Coculture-" "evolved" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") xscale(range(0 8)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) ///
text(0.98 1.5 "p=0.2623", size(medium)) ///
text(0.96 1.5 "_______________", size(medium)) ///
text(1.04 6 "p=0.6310", size(medium)) ///
text(1.01 6 "_______________", size(medium))

************************Second: by coop_gr*************************************************
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*New variables here: pop_id, ab, type(abfree_isol, res_isol), evol_condn(Emono/Smono/Ecoop/Scoop), growth_condn(mono), spp(E/S),
*rep(1-6), meancoop_gr(#)

generate dumb_shit = 0.5 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 2.5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 7 if type=="res_isol" & evol_condn=="Scoop"

*Rif E mono stats
ranksum meancoop_gr if(ab=="Rif" & (dumb_shit==0.5 | dumb_shit==2.5)), by(dumb_shit)
ranksum meancoop_gr if(ab=="Rif" & (dumb_shit==5 | dumb_shit==7)), by(dumb_shit)

*Rif mono growth rates
*15 underscores for this p-value
stripplot meancoop_gr if ab=="Rif", over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5) ///
title("Rifampicin, co-culture growth rates", size(large) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue purple gold green)  ///
msymbol(circle circle circle circle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:E. coli}" "' 2.5 `" "Coculture-" "evolved" "{it:E. coli}" "' ///
5 `" "Monoculture-" "evolved" "{it:S. enterica}" "' 7 `" "Coculture-" "evolved" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") xscale(range(0 8)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
text(0.55 1.5 "p=0.7488", size(medium)) ///
text(0.53 1.5 "_______________", size(medium)) ///
text(0.62 6 "p=0.2623", size(medium)) ///
text(0.60 6 "_______________", size(medium))

*Amp stats
ranksum meancoop_gr if(ab=="Amp" & (dumb_shit==0.5 | dumb_shit==2.5)), by(dumb_shit)
ranksum meancoop_gr if(ab=="Amp" & (dumb_shit==5 | dumb_shit==7)), by(dumb_shit)

*Amp mono growth rates
*15 underscores for this p-value
stripplot meancoop_gr if ab=="Amp", over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5) ///
title("Ampicillin, co-culture growth rates", size(large) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue purple gold green)  ///
msymbol(circle circle circle circle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:E. coli}" "' 2.5 `" "Coculture-" "evolved" "{it:E. coli}" "' ///
5 `" "Monoculture-" "evolved" "{it:S. enterica}" "' 7 `" "Coculture-" "evolved" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") xscale(range(0 8)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) ///
text(0.66 1.5 "p=0.2002", size(medium)) ///
text(0.64 1.5 "_______________", size(medium)) ///
text(0.60 6 "p=0.1495", size(medium)) ///
text(0.58 6 "_______________", size(medium))

************************Third: by log2mic*************************************************

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

*New variables here: pop_id, ab, type(abfree_isol, res_isol), evol_condn(Emono/Smono/Ecoop/Scoop), growth_condn(mono), spp(E/S),
*rep(1-6), meancoop_gr(#)

generate dumb_shit = 0.5 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 2.5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 7 if type=="res_isol" & evol_condn=="Scoop"

*Rif E mono stats
ranksum meanmic if(ab=="Rif" & (dumb_shit==0.5 | dumb_shit==2.5)), by(dumb_shit)
ranksum meanmic if(ab=="Rif" & (dumb_shit==5 | dumb_shit==7)), by(dumb_shit)

*Rif MICs
*15 underscores for this p-value
stripplot meanmic if ab=="Rif", over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5) ///
title("Rifampicin, resistant isolate MICs", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Rifampicin, {&mu}g/mL", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue purple gold green)  ///
msymbol(circle circle circle circle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:E. coli}" "' 2.5 `" "Coculture-" "evolved" "{it:E. coli}" "' ///
5 `" "Monoculture-" "evolved" "{it:S. enterica}" "' 7 `" "Coculture-" "evolved" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") xscale(range(0 8)) ///
ylabel(0(1)9, labsize(medlarge)) yscale(range(0 9)) ///
text(7.8 1.5 "p=0.1697", size(medium)) ///
text(7.6 1.5 "_______________", size(medium)) ///
text(8.1 6 "p=0.1727", size(medium)) ///
text(7.9 6 "_______________", size(medium))

*Amp stats
ranksum meanmic if(ab=="Amp" & (dumb_shit==0.5 | dumb_shit==2.5)), by(dumb_shit)
ranksum meanmic if(ab=="Amp" & (dumb_shit==5 | dumb_shit==7)), by(dumb_shit)

*Amp mono growth rates
*15 underscores for this p-value
stripplot meanmic if ab=="Amp", over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5) ///
title("Ampicillin, resistant isolate MICs", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Ampicillin, {&mu}g/mL", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue purple gold green)  ///
msymbol(circle circle circle circle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:E. coli}" "' 2.5 `" "Coculture-" "evolved" "{it:E. coli}" "' ///
5 `" "Monoculture-" "evolved" "{it:S. enterica}" "' 7 `" "Coculture-" "evolved" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") xscale(range(0 8)) ///
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3 3)) ///
text(2.8 1.5 "p=0.2920", size(medium)) ///
text(2.6 1.5 "_______________", size(medium)) ///
text(2.7 6 "p=0.5152", size(medium)) ///
text(2.5 6 "_______________", size(medium))
