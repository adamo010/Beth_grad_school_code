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

**********For ampicillin only: generating +/- mutation graphs***********

***********OmpR in Sal monoculture
generate ompR = 0 if ab=="Amp" & evol_condn=="Smono"
replace ompR = 1 if pop_id=="MM089"
replace ompR = 1 if pop_id=="MM098"
replace ompR = 1 if pop_id=="MM115"

*S Amp mono-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==9, over(ompR) /// 
 stack center vertical separate(ompR) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) 

*S Amp mono-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==9, over(ompR) /// 
 stack center vertical separate(ompR) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medsmall)) ///
xtitle("Presence-absense of {it:ompR} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(triangle triangle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:ompR} mutation absent" 1 "{it:ompR} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8))

***********AcrB in Sal monoculture
generate acrB = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrB = 1 if pop_id=="MM079"
replace acrB = 1 if pop_id=="MM089"
replace acrB = 1 if pop_id=="MM098"
replace acrB = 1 if pop_id=="MM106"
replace acrB = 1 if pop_id=="MM115"

*S Amp mono-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==9, over(acrB) /// 
 stack center vertical separate(acrB) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) ///
text(0.97 0.5 "p=0.0054", size(medsmall)) ///
text(0.95 0.5 "__________________________________", size(medsmall))

ranksum mono_gr if ab=="Amp" & dumb_shit==9, by(ompR)

*S Amp mono-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==9, over(acrB) /// 
 stack center vertical separate(acrB) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Coculture growth rate", size(medsmall)) ///
xtitle("Presence-absense of {it:acrB} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(triangle triangle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:acrB} mutation absent" 1 "{it:acrB} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
text(0.67 0.5 "p=0.0077", size(medsmall)) ///
text(0.65 0.5 "__________________________________", size(medsmall))

ranksum coop_gr if ab=="Amp" & dumb_shit==9, by(acrB)

***********STM0580 in Sal monoculture
generate stm0580 = 0 if ab=="Amp" & evol_condn=="Smono"
replace stm0580 = 1 if pop_id=="MM079"
replace stm0580 = 1 if pop_id=="MM098"
replace stm0580 = 1 if pop_id=="MM106"

*S Amp mono-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==9, over(stm0580) /// 
 stack center vertical separate(stm0580) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1))

*S Amp mono-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==9, over(stm0580) /// 
 stack center vertical separate(stm0580) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Coculture growth rate", size(medsmall)) ///
xtitle("Presence-absense of {it:stm0580} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(triangle triangle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:stm0580} mutation absent" 1 "{it:stm0580} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7))


***********acrR in Sal monoculture
generate acrR = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrR = 1 if pop_id=="MM089"
replace acrR = 1 if pop_id=="MM115"

*S Amp mono-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==9, over(acrR) /// 
 stack center vertical separate(acrR) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1))

*S Amp mono-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==9, over(acrR) /// 
 stack center vertical separate(acrR) ///
title("Ampicillin, monoculture-evolved {it:S. enterica} P20," "Co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Coculture growth rate", size(medsmall)) ///
xtitle("Presence-absense of {it:acrR} mutation", size(medsmall) margin(vsmall)) ///
mcolor(gold gold) ///
msymbol(triangle triangle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:acrR} mutation absent" 1 "{it:acrR} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7))


***********AcrB in Sal coculture
generate acrB2 = 0 if ab=="Amp" & evol_condn=="Scoop"
replace acrB2 = 1 if pop_id=="MM135"
replace acrB2 = 1 if pop_id=="MM164"

*S Amp coop-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==11, over(acrB2) /// 
 stack center vertical separate(acrB2) ///
title("Ampicillin, coculture-evolved {it:S. enterica} P20," "monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.2)1.2, labsize(medlarge)) yscale(range(0 1.2))

*S Amp coop-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==11, over(acrB2) /// 
 stack center vertical separate(acrB2) ///
title("Ampicillin, coculture-evolved {it:S. enterica} P20," "co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medsmall)) ///
xtitle("Presence-absense of {it:acrB} mutation", size(medsmall) margin(vsmall)) ///
mcolor(green green) ///
msymbol(triangle triangle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:acrB} mutation absent" 1 "{it:acrB} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8))


***********ftsZ in Sal coculture
generate ftsZ = 0 if ab=="Amp" & evol_condn=="Scoop"
replace ftsZ = 1 if pop_id=="MM125"
replace ftsZ = 1 if pop_id=="MM135"

*S Amp coop-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==11, over(ftsZ) /// 
 stack center vertical separate(ftsZ) ///
title("Ampicillin, coculture-evolved {it:S. enterica} P20," "monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.2)1.2, labsize(medlarge)) yscale(range(0 1.2))

*S Amp coop-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==11, over(ftsZ) /// 
 stack center vertical separate(ftsZ) ///
title("Ampicillin, coculture-evolved {it:S. enterica} P20," "co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medsmall)) ///
xtitle("Presence-absense of {it:ftsZ} mutation", size(medsmall) margin(vsmall)) ///
mcolor(green green) ///
msymbol(triangle triangle) ///
msize(large large) ///
mlcolor(black black) /// 
mlwidth(vthin vthin) ///
legend(off) ///
xlabel(0 "{it:ftsZ} mutation absent" 1 "{it:ftsZ} mutation present", labsize(medsmall)) ///
xscale(range(-0.5 1.5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) ///
note({it:ftsZ}-positive mutants are also mutator strains)


