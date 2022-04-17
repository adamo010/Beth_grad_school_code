****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield
*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*****Edited for visuals on 11.29.18

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"

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

***********************************E. coli Rif***********************************************

*E Rif mono-evolved mono GRs
stripplot mono_gr if ab=="Rif" & dumb_shit==3, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, monoculture growth rates" "of monoculture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(midblue) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA010" "rep1" "' 4 `" "BA018" "rep2" "' 7 `" "BA030" "rep3" "' 10 `" "BA036" "rep4" "' ///
 13 `" "BA049" "rep5" "' 16 `" "BA056" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8))

*E Rif mono-evolved coop GRs
stripplot coop_gr if ab=="Rif" & dumb_shit==3, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, co-culture growth rates" "of monoculture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(midblue) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA010" "rep1" "' 4 `" "BA018" "rep2" "' 7 `" "BA030" "rep3" "' 10 `" "BA036" "rep4" "' ///
 13 `" "BA049" "rep5" "' 16 `" "BA056" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

*E Rif coop-evolved mono GRs
stripplot mono_gr if ab=="Rif" & dumb_shit==5, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, monoculture growth rates" "of co-culture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(purple) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA125" "rep1" "' 4 `" "BA139" "rep2" "' 7 `" "BA145" "rep3" "' 10 `" "BA155" "rep4" "' ///
 13 `" "BA165" "rep5" "' 16 `" "BA176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

*E Rif coop-evolved coop GRs
stripplot coop_gr if ab=="Rif" & dumb_shit==5, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, co-culture growth rates" "of co-culture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(purple) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA125" "rep1" "' 4 `" "BA139" "rep2" "' 7 `" "BA145" "rep3" "' 10 `" "BA155" "rep4" "' ///
 13 `" "BA165" "rep5" "' 16 `" "BA176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

putpdf image Erif1.png Erif2.png Erif3.png Erif4.png

***********************************Sal Rif***********************************************
*S Rif mono-evolved mono GRs
stripplot mono_gr if ab=="Rif" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, monoculture growth rates" "of monoculture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medium) margin(vsmall)) ///
mcolor(gold) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA067" "rep1" "' 4 `" "BA079" "rep2" "' 7 `" "BA083" "rep3" "' 10 `" "BA098" "rep4" "' ///
 13 `" "BA108" "rep5" "' 16 `" "BA115" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.9, labsize(medlarge)) yscale(range(0 0.9)) 

*S Rif mono-evolved coop GRs
stripplot coop_gr if ab=="Rif" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, co-culture growth rates" "of monoculture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medium) margin(vsmall)) ///
mcolor(gold) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA067" "rep1" "' 4 `" "BA079" "rep2" "' 7 `" "BA083" "rep3" "' 10 `" "BA098" "rep4" "' ///
 13 `" "BA108" "rep5" "' 16 `" "BA115" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) 

*S Rif coop-evolved mono GRs
stripplot mono_gr if ab=="Rif" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, monoculture growth rates" "of co-culture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(green) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA125" "rep1" "' 4 `" "BA139" "rep2" "' 7 `" "BA145" "rep3" "' 10 `" "BA155" "rep4" "' ///
 13 `" "BA165" "rep5" "' 16 `" "BA176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) 

*S Rif coop-evolved coop GRs
stripplot coop_gr if ab=="Rif" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Rifampicin, co-culture growth rates" "of co-culture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(green) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "BA125" "rep1" "' 4 `" "BA139" "rep2" "' 7 `" "BA145" "rep3" "' 10 `" "BA155" "rep4" "' ///
 13 `" "BA165" "rep5" "' 16 `" "BA176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

***********************************E. coli Amp***********************************************

*E Amp mono-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==3, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, monoculture growth rates" "of monoculture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(midblue) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM010" "rep1" "' 4 `" "rMM020" "rep2" "' 7 `" "rMM028" "rep3" "' 10 `" "rMM039" "rep4" "' ///
 13 `" "rMM049" "rep5" "' 16 `" "rMM060" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

*E Amp mono-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==3, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, co-culture growth rates" "of monoculture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(midblue) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM010" "rep1" "' 4 `" "rMM020" "rep2" "' 7 `" "rMM028" "rep3" "' 10 `" "rMM039" "rep4" "' ///
 13 `" "rMM049" "rep5" "' 16 `" "rMM060" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

*E Amp coop-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==5, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, monoculture growth rates" "of co-culture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(purple) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM127" "rep1" "' 4 `" "rMM137" "rep2" "' 7 `" "rMM146" "rep3" "' 10 `" "rMM158" "rep4" "' ///
 13 `" "rMM167" "rep5" "' 16 `" "rMM176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) 

*E Amp coop-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==5, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, co-culture growth rates" "of co-culture-evolved {it:E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(purple) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM127" "rep1" "' 4 `" "rMM137" "rep2" "' 7 `" "rMM146" "rep3" "' 10 `" "rMM158" "rep4" "' ///
 13 `" "rMM167" "rep5" "' 16 `" "rMM176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

***********************************S. enterica Amp***********************************************

*S Amp mono-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, monoculture growth rates" "of monoculture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(gold) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM067" "rep1" "' 4 `" "rMM078" "rep2" "' 7 `" "rMM090" "rep3" "' 10 `" "rMM098" "rep4" "' ///
 13 `" "rMM108" "rep5" "' 16 `" "rMM119" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) 

*S Amp mono-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==9, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, co-culture growth rates" "of monoculture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(gold) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM067" "rep1" "' 4 `" "rMM078" "rep2" "' 7 `" "rMM090" "rep3" "' 10 `" "rMM098" "rep4" "' ///
 13 `" "rMM108" "rep5" "' 16 `" "rMM119" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) 

*S Amp coop-evolved mono GRs
stripplot mono_gr if ab=="Amp" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, monoculture growth rates" "of co-culture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(green) ///
msymbol(circle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM127" "rep1" "' 4 `" "rMM137" "rep2" "' 7 `" "rMM146" "rep3" "' 10 `" "rMM158" "rep4" "' ///
 13 `" "rMM167" "rep5" "' 16 `" "rMM176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) 

*S Amp coop-evolved coop GRs
stripplot coop_gr if ab=="Amp" & dumb_shit==11, over(repdummy) /// 
 stack center vertical refline(lwidth(0.4) lcolor(black)) separate(dumb_shit) ///
title("Ampicillin, co-culture growth rates" "of co-culture-evolved {it:S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Population name", size(medlarge) margin(vsmall)) ///
mcolor(green) ///
msymbol(triangle) ///
msize(vlarge) ///
mlcolor(black) /// 
mlwidth(vthin) ///
legend(off) ///
xlabel(1 `" "rMM127" "rep1" "' 4 `" "rMM137" "rep2" "' 7 `" "rMM146" "rep3" "' 10 `" "rMM158" "rep4" "' ///
 13 `" "rMM167" "rep5" "' 16 `" "rMM176" "rep6" "', labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) 


