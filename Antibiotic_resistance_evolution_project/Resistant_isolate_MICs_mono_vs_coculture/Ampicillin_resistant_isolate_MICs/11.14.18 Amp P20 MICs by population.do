****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield
*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate growth rates\11.13.18 Amp P20 GRs and MICs by mutation.dta"

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

generate log2mic = ln(mic)/ln(2) 

***********************************S. enterica Amp***********************************************

*S Amp mono-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, monoculture {it:S. enterica}, log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(gold) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "MM067" "rep1" "' 4 `" "MM079" "rep2" "' 7 `" "MM089" "rep3" "' 10 `" "MM098" "rep4" "' ///
 13 `" "MM106" "rep5" "' 16 `" "MM115" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*S Amp coop-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, monoculture {it:S. enterica}, log2MIC by population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Population name", size(medsmall) margin(vsmall)) ///
mcolor(green) ///
msymbol(circle) ///
msize(large) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "MM125" "rep1" "' 4 `" "MM135" "rep2" "' 7 `" "MM145" "rep3" "' 10 `" "MM154" "rep4" "' ///
 13 `" "MM164" "rep5" "' 16 `" "MM174" "rep6" "', labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)10, labsize(medium)) yscale(range(0 10)) 



