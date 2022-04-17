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

*E Rif
stripplot log2mic if ab=="Rif" & dumb_shit<=5 & dumb_shit>1, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Rifampicin, monoculture {it:E. coli}, log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(midblue*0.5 midblue purple*0.5 purple) ///
msymbol(triangle circle triangle circle) ///
msize(large large large large) ///
mlcolor(black black black black) /// 
mlwidth(vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Ab-free, Emono-evolved" 3 "Resistant, Emono-evolved" ///
4 "Ab-free, Ecoop-evolved" 5 "Resistant, Ecoop-evolved") size(medsmall)) ///
xlabel(1 "Rep1" 4 "Rep2" 7 "Rep3" 10 "Rep4" 13 "Rep5" 16 "Rep6", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)8, labsize(medium)) yscale(range(-3 8)) 

*S Rif
stripplot log2mic if ab=="Rif" & dumb_shit>=8, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Rifampicin, monoculture {it:S. enterica}, log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(gold*0.5 gold green*0.5 green) ///
msymbol(triangle circle triangle circle) ///
msize(large large large large) ///
mlcolor(black black black black) /// 
mlwidth(vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Ab-free, Smono-evolved" 3 "Resistant, Smono-evolved" ///
4 "Ab-free, Scoop-evolved" 5 "Resistant, Scoop-evolved") size(medsmall)) ///
xlabel(1 "Rep1" 4 "Rep2" 7 "Rep3" 10 "Rep4" 13 "Rep5" 16 "Rep6", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-1(1)9, labsize(medium)) yscale(range(-1 9)) 

*E Amp
stripplot log2mic if ab=="Amp" & dumb_shit<=5 & dumb_shit>1, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Ampicillin, monoculture {it:E. coli}, log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicilin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(midblue*0.5 midblue purple*0.5 purple) ///
msymbol(triangle circle triangle circle) ///
msize(large large large large) ///
mlcolor(black black black black) /// 
mlwidth(vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Ab-free, Emono-evolved" 3 "Resistant, Emono-evolved" ///
4 "Ab-free, Ecoop-evolved" 5 "Resistant, Ecoop-evolved") size(medsmall)) ///
xlabel(1 "Rep1" 4 "Rep2" 7 "Rep3" 10 "Rep4" 13 "Rep5" 16 "Rep6", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)3, labsize(medium)) yscale(range(-3 3)) 

*S Anp
stripplot log2mic if ab=="Amp" & dumb_shit>=8, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) ///
title("Ampicillin, monoculture {it:S. enterica}, log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(gold*0.5 gold green*0.5 green) ///
msymbol(triangle circle triangle circle) ///
msize(large large large large) ///
mlcolor(black black black black) /// 
mlwidth(vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Ab-free, Smono-evolved" 3 "Resistant, Smono-evolved" ///
4 "Ab-free, Scoop-evolved" 5 "Resistant, Scoop-evolved") size(medsmall)) ///
xlabel(1 "Rep1" 4 "Rep2" 7 "Rep3" 10 "Rep4" 13 "Rep5" 16 "Rep6", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)3, labsize(medium)) yscale(range(-3 3)) 






