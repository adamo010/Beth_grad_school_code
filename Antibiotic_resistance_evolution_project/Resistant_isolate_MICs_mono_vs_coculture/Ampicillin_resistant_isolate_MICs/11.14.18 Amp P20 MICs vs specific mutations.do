****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), log2mic, mono_yield, coop_gr, coop_yield
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

**********For ampicillin only: generating +/- mutation graphs***********

***********OmpR in Sal monoculture
generate ompR = 0 if ab=="Amp" & evol_condn=="Smono"
replace ompR = 1 if pop_id=="MM089"
replace ompR = 1 if pop_id=="MM098"
replace ompR = 1 if pop_id=="MM115"

*S Amp mono-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==9, over(ompR) /// 
 stack center vertical separate(ompR) ///
title("Ampicillin, {it:S. enterica} P20 MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:ompR} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:ompR} mutation absent" 1 "{it:ompR} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medsmall)) yscale(range(0 9)) 

***********AcrB in Sal monoculture
generate acrB = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrB = 1 if pop_id=="MM079"
replace acrB = 1 if pop_id=="MM089"
replace acrB = 1 if pop_id=="MM098"
replace acrB = 1 if pop_id=="MM106"
replace acrB = 1 if pop_id=="MM115"

*S Amp mono-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==9, over(acrB) /// 
 stack center vertical separate(acrB) ///
title("Ampicillin, {it:S. enterica} P20 MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:acrB} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:acrB} mutation absent" 1 "{it:acrB} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medsmall)) yscale(range(0 9)) 

***********STM0580 in Sal monoculture
generate stm0580 = 0 if ab=="Amp" & evol_condn=="Smono"
replace stm0580 = 1 if pop_id=="MM079"
replace stm0580 = 1 if pop_id=="MM098"
replace stm0580 = 1 if pop_id=="MM106"

*S Amp mono-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==9, over(stm0580) /// 
 stack center vertical separate(stm0580) ///
title("Ampicillin, {it:S. enterica} P20 MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:stm0580} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:stm0580} mutation absent" 1 "{it:stm0580} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medsmall)) yscale(range(0 9)) 


***********acrR in Sal monoculture
generate acrR = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrR = 1 if pop_id=="MM089"
replace acrR = 1 if pop_id=="MM115"

*S Amp mono-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==9, over(acrR) /// 
 stack center vertical separate(acrR) ///
title("Ampicillin, {it:S. enterica} P20 MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:acrR} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:acrR} mutation absent" 1 "{it:acrR} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medsmall)) yscale(range(0 9)) 

***********AcrB in Sal coculture
generate acrB2 = 0 if ab=="Amp" & evol_condn=="Scoop"
replace acrB2 = 1 if pop_id=="MM135"
replace acrB2 = 1 if pop_id=="MM164"

*S Amp coop-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==11, over(acrB2) /// 
 stack center vertical separate(acrB2) ///
title("Ampicillin, {it:S. enterica} P20 MICs, coculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:acrB} mutation", size(medsmall) margin(vsmall)) ///
mcolor(green green) ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:acrB} mutation absent" 1 "{it:acrB} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)10, labsize(medsmall)) yscale(range(0 10)) 

***********ftsZ in Sal coculture
generate ftsZ = 0 if ab=="Amp" & evol_condn=="Scoop"
replace ftsZ = 1 if pop_id=="MM125"
replace ftsZ = 1 if pop_id=="MM135"

*S Amp coop-evolved mono GRs
stripplot log2mic if ab=="Amp" & dumb_shit==11, over(ftsZ) /// 
 stack center vertical separate(ftsZ) ///
title("Ampicillin, {it:S. enterica} P20 MICs, coculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:ftsZ} mutation", size(medsmall) margin(vsmall)) ///
mcolor(green green) ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:ftsZ} mutation absent" 1 "{it:ftsZ} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)10, labsize(medsmall)) yscale(range(0 10)) 


