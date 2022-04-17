****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*Based on 05.25.18 isolate MICs by culture condition
*includes Abfree and ancestral data

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Resistant isolate MICs in mono vs coculture\10.23.18 round8 isolate MICs Rif P20 Amp P10.dta"

*Making new variables
generate log2mic = ln(mic)/ln(2) 

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

generate repdummy = 1 if rep==1
replace repdummy = 4 if rep==2
replace repdummy = 7 if rep==3
replace repdummy = 10 if rep==4
replace repdummy = 13 if rep==5
replace repdummy = 16 if rep==6 

*For mono
generate typerep = 1 if type=="abfree_isol" & rep==1
replace typerep = 2 if type=="abfree_isol" & rep==2
replace typerep = 3 if type=="abfree_isol" & rep==3
replace typerep = 4 if type=="abfree_isol" & rep==4
replace typerep = 5 if type=="abfree_isol" & rep==5
replace typerep = 6 if type=="abfree_isol" & rep==6
replace typerep = 7 if type=="res_isol" & rep==1
replace typerep = 8 if type=="res_isol" & rep==2
replace typerep = 9 if type=="res_isol" & rep==3
replace typerep = 10 if type=="res_isol" & rep==4
replace typerep = 11 if type=="res_isol" & rep==5
replace typerep = 12 if type=="res_isol" & rep==6

**************Rifampicin**********************

*E mono-evolved Rif
stripplot log2mic if ab=="Rif" & dumb_shit==3, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Rifampicin, monoculture-evolved {it:E. coli}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(midblue) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA010" "rep1" "' 4 `" "BA018" "rep2" "' 7 `" "BA030" "rep3" "' 10 `" "BA036" "rep4" "' ///
 13 `" "BA049" "rep5" "' 16 `" "BA056" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)8, labsize(medium)) yscale(range(-3 8)) 

*E coop-evolved Rif
stripplot log2mic if ab=="Rif" & dumb_shit==5, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Rifampicin, coculture-evolved {it:E. coli}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(purple) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA125" "rep1" "' 4 `" "BA139" "rep2" "' 7 `" "BA145" "rep3" "' 10 `" "BA155" "rep4" "' ///
 13 `" "BA165" "rep5" "' 16 `" "BA176" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)8, labsize(medium)) yscale(range(-3 8)) 

*S mono-evolved Rif
stripplot log2mic if ab=="Rif" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Rifampicin, monoculture-evolved {it:S. enterica}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(gold) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA067" "rep1" "' 4 `" "BA079" "rep2" "' 7 `" "BA083" "rep3" "' 10 `" "BA098" "rep4" "' ///
 13 `" "BA108" "rep5" "' 16 `" "BA115" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9))

*S coop-evolved Rif
stripplot log2mic if ab=="Rif" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Rifampicin, coculture-evolved {it:S. enterica}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(green) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA125" "rep1" "' 4 `" "BA139" "rep2" "' 7 `" "BA145" "rep3" "' 10 `" "BA155" "rep4" "' ///
 13 `" "BA165" "rep5" "' 16 `" "BA176" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)8, labsize(medium)) yscale(range(-3 8)) 


**************Ampicillin**********************

*E mono-evolved Amp
stripplot log2mic if ab=="Amp" & dumb_shit==3, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Ampicillin, monoculture-evolved {it:E. coli}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(midblue) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM010" "rep1" "' 4 `" "rMM020" "rep2" "' 7 `" "rMM028" "rep3" "' 10 `" "rMM039" "rep4" "' ///
 13 `" "rMM049" "rep5" "' 16 `" "rMM060" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)3, labsize(medium)) yscale(range(-3 3)) 

*E coop-evolved Amp
stripplot log2mic if ab=="Amp" & dumb_shit==5, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Ampicillin, coculture-evolved {it:E. coli}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(purple) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM127" "rep1" "' 4 `" "rMM137" "rep2" "' 7 `" "rMM146" "rep3" "' 10 `" "rMM158" "rep4" "' ///
 13 `" "rMM167" "rep5" "' 16 `" "rMM176" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)3, labsize(medium)) yscale(range(-3 3)) 

*S mono-evolved Amp
stripplot log2mic if ab=="Amp" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Ampicillin, monoculture-evolved {it:S. enterica}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(gold) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM067" "rep1" "' 4 `" "rMM078" "rep2" "' 7 `" "rMM090" "rep3" "' 10 `" "rMM098" "rep4" "' ///
 13 `" "rMM108" "rep5" "' 16 `" "rMM119" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)3, labsize(medium)) yscale(range(-3 3)) 

*S coop-evolved Amp
stripplot log2mic if ab=="Amp" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Ampicillin, coculture-evolved {it:S. enterica}," "log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(green) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM127" "rep1" "' 4 `" "rMM137" "rep2" "' 7 `" "rMM146" "rep3" "' 10 `" "rMM158" "rep4" "' ///
 13 `" "rMM167" "rep5" "' 16 `" "rMM176" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)3, labsize(medium)) yscale(range(-3 3)) 
