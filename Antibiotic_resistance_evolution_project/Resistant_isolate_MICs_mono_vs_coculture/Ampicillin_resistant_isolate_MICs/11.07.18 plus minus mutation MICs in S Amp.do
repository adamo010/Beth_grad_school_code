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
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate growth rates\11.13.18 Amp P20 GRs and MICs by mutation.dta"

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

**********For ampicillin only: generating +/- mutation graphs***********

***********OmpF in Sal monoculture
generate ompF = 0 if ab=="Amp" & evol_condn=="Smono"
replace ompF = 1 if pop_id=="rMM067"
replace ompF = 1 if pop_id=="rMM078"
replace ompF = 1 if pop_id=="rMM108"

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(ompF) ///
 stack center vertical separate(ompF) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:ompF} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:ompF} mutation absent" 1 "{it:ompF} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) 

***********STM0580 in Sal monoculture
generate stm0580 = 0 if ab=="Amp" & evol_condn=="Smono"
replace stm0580 = 1 if pop_id=="rMM078"
replace stm0580 = 1 if pop_id=="rMM090"

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(stm0580) ///
 stack center vertical separate(stm0580) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:STM0580} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:STM0580} mutation absent" 1 "{it:STM0580} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) 

***yoaE in Sal monoculture and co-culture-evolved
generate yoaE = 0 if ab=="Amp" & spp=="S"
replace yoaE = 1 if pop_id=="rMM090"
replace yoaE = 1 if pop_id=="rMM108"
replace yoaE = 1 if pop_id=="rMM137"
replace yoaE = 1 if pop_id=="rMM167"
replace yoaE = 1 if pop_id=="rMM176"

stripplot log2mic if ab=="Amp" & dumb_shit==9, over(yoaE) ///
 stack center vertical separate(yoaE) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:yoaE} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:yoaE} mutation absent" 1 "{it:yoaE} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) 

stripplot log2mic if ab=="Amp" & dumb_shit==11, over(yoaE) ///
 stack center vertical separate(yoaE) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, coculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:yoaE} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(green green)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:yoaE} mutation absent" 1 "{it:yoaE} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)3, labsize(medsmall)) yscale(range(-2 3)) 

**********ompR in Smono
generate ompR = 0 if ab=="Amp" & evol_condn=="Smono"
replace ompR = 1 if pop_id=="rMM090"
replace ompR = 1 if pop_id=="rMM119"

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(ompR) ///
 stack center vertical separate(ompR) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:ompR} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:ompR} mutation absent" 1 "{it:ompR} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) 

******acrB in Smono
generate acrB = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrB = 1 if pop_id=="rMM090"
replace acrB = 1 if pop_id=="rMM119"

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(acrB) ///
 stack center vertical separate(acrB) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, monoculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:acrB} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:acrB} mutation absent" 1 "{it:acrB} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) 

***********ftsI in Scoop
**I changed this one a bit for lab meeting presentation
generate ftsI = 0 if ab=="Amp" & evol_condn=="Scoop"
replace ftsI = 1 if pop_id=="rMM127"
replace ftsI = 1 if pop_id=="rMM158"

stripplot log2mic if ab=="Amp" & dumb_shit==11, over(ftsI) ///
 stack center vertical separate(ftsI) ///
title("Ampicillin, {it:S. enterica} MICs," "coculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:ftsI} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(green green)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(1) ///
xlabel(0 `" "{it:ftsI} mutation" "absent" "' 1 `" "{it:ftsI} mutation" "present" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)3, labsize(medsmall)) yscale(range(-2 3)) ///
text(1.65 0.5 "p=0.0016", size(medsmall)) ///
text(1.61 0.5 "__________________________________", size(medsmall))


***********metL in Scoop
generate metL = 0 if ab=="Amp" & evol_condn=="Scoop"
replace metL = 1 if pop_id=="rMM127"
replace metL = 1 if pop_id=="rMM137"

stripplot log2mic if ab=="Amp" & dumb_shit==11, over(metL) ///
 stack center vertical separate(metL) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, coculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:metL} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(green green)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(0.8) ///
xlabel(0 "{it:metL} mutation absent" 1 "{it:metL} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)3, labsize(medsmall)) yscale(range(-2 3)) 

