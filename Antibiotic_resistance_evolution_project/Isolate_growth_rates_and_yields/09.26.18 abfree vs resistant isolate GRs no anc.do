****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield
*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*Goal: toss ancestor out, only compare GRs (and MICs?) to abfree isolates

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate growth rates\09.26.18 abfree vs resistant isolate GRs no anc.dta"

generate dummy1 = 1 if type=="abfree_isol" & evol_condn=="Emono"
replace dummy1 = 2 if type=="res_isol" & evol_condn=="Emono"
replace dummy1 = 3 if type=="abfree_isol" & evol_condn=="Ecoop"
replace dummy1 = 4 if type=="res_isol" & evol_condn=="Ecoop"
replace dummy1 = 5 if type=="abfree_isol" & evol_condn=="Smono"
replace dummy1 = 6 if type=="res_isol" & evol_condn=="Smono"
replace dummy1 = 7 if type=="abfree_isol" & evol_condn=="Scoop"
replace dummy1 = 8 if type=="res_isol" & evol_condn=="Scoop"

***********Monoculture growth rates**************

*All Rif Stats
*Emono
ranksum mono_gr if(ab=="Rif" & (dummy1==1 | dummy1==2)), by(dummy1)
*Ecoop
ranksum mono_gr if(ab=="Rif" & (dummy1==3 | dummy1==4)), by(dummy1)
*Smono
ranksum mono_gr if(ab=="Rif" & (dummy1==5 | dummy1==6)), by(dummy1)
*Scoop
ranksum mono_gr if(ab=="Rif" & (dummy1==7 | dummy1==8)), by(dummy1)

*Rif Ecoli graph
stripplot mono_gr if ab=="Rif" & dummy1<=4, over(dummy)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5 5)  ///
title("Rifampicin, {it:E. coli} isolate growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 4 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)1.0, labsize(medsmall)) yscale(range(0 1.0)) ///
aspectratio(0.9) ///
text(0.71 1.5 "p=0.9785", size(small)) text(0.88 3.5 "p=0.0007", size(small)) 

*Rif Sal graph
stripplot mono_gr if ab=="Rif" & dummy1>=5, over(dummy)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5 5)  ///
title("Rifampicin, {it:S. enterica} isolate growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold*0.25 gold green*0.5 green)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(5 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' 6 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
7 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 8 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.2)1.2, labsize(medsmall)) yscale(range(0 1.2)) ///
aspectratio(0.9) ///
text(1.05 5.5 "p=0.0002", size(small)) text(1.02 7.5 "p=0.0101", size(small)) 

***********Coculture growth rates**************

*All Rif Stats
*Emono
ranksum coop_gr if(ab=="Rif" & (dummy1==1 | dummy1==2)), by(dummy1)
*Ecoop
ranksum coop_gr if(ab=="Rif" & (dummy1==3 | dummy1==4)), by(dummy1)
*Smono
ranksum coop_gr if(ab=="Rif" & (dummy1==5 | dummy1==6)), by(dummy1)
*Scoop
ranksum coop_gr if(ab=="Rif" & (dummy1==7 | dummy1==8)), by(dummy1)

*Rif Ecoli graph
stripplot coop_gr if ab=="Rif" & dummy1<=4, over(dummy)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5 5)  ///
title("Rifampicin, {it:E. coli} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 4 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medsmall)) yscale(range(0 0.7)) ///
aspectratio(0.9) ///
text(0.65 1.5 "p=0.0012", size(small)) text(0.64 3.5 "p=0.0010", size(small)) 

*Rif Sal graph
stripplot coop_gr if ab=="Rif" & dummy1>=5, over(dummy)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5 5)  ///
title("Rifampicin, {it:S. enterica} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold*0.25 gold green*0.5 green)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(5 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' 6 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
7 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 8 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medsmall)) yscale(range(0 0.8)) ///
aspectratio(0.9) ///
text(0.68 5.5 "p=0.1336", size(small)) text(0.75 7.5 "p=0.1811", size(small)) 
