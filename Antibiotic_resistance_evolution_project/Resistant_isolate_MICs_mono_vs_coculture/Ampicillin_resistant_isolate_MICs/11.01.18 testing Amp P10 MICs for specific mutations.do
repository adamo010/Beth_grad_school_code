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

*****Testing presence/absense of specific mutations
generate acrB = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrB = 1 if ab=="Amp" & evol_condn=="Smono" & rep==4
replace acrB = 1 if ab=="Amp" & evol_condn=="Smono" & rep==5

generate stm0480 = 0 if ab=="Amp" & evol_condn=="Smono"
replace stm0480 = 1 if ab=="Amp" & evol_condn=="Smono" & rep==2
replace stm0480 = 1 if ab=="Amp" & evol_condn=="Smono" & rep==4

generate ftsI = 0 if ab=="Amp" & evol_condn=="Scoop"
replace ftsI = 1 if ab=="Amp" & evol_condn=="Scoop" & rep==1
replace ftsI = 1 if ab=="Amp" & evol_condn=="Scoop" & rep==4

*AcrB
ranksum log2mic, by(acrB)

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(acrB) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(acrB) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs", size(medlarge) color(black) margin(zero))  ///
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
plotregion(margin(zero)) ///
xlabel(0 "{it:acrB} mutation absent" 1 "{it:acrB} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) ///
text(2.5 0.5 "p=0.8693", size(small)) 

*Stm0480
ranksum log2mic, by(stm0480)

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(stm0480) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(stm0480) jitter(5 5 5 5 5) ///
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
plotregion(margin(zero)) ///
xlabel(0 "{it:STM0580} mutation absent" 1 "{it:STM0580} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-2(1)3, labsize(medsmall)) yscale(range(-2 3)) ///
text(2.5 0.5 "p=0.7735", size(small)) 

*ftsI
ranksum log2mic, by(ftsI)

stripplot log2mic if ab=="Amp" & dumb_shit>=7 & type=="res_isol", over(ftsI) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ftsI) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs, coculture-evolved", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
xtitle("Presence-absense of {it:ftsI} mutation", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(purple purple)  ///
msymbol(circle triangle) ///
msize(medlarge medlarge) ///
mlcolor(black black) ///
mlwidth(vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(0 "{it:ftsI} mutation absent" 1 "{it:ftsI} mutation present", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)2, labsize(medsmall)) yscale(range(-3 2)) ///
text(1.5 0.5 "p=0.0032", size(small)) 
