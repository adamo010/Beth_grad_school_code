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

generate log2mic = ln(mic)/ln(2) 

*All Rif Stats
*Emono
ranksum log2mic if(ab=="Rif" & (dummy1==1 | dummy1==2)), by(dummy1)
*Ecoop
ranksum log2mic if(ab=="Rif" & (dummy1==3 | dummy1==4)), by(dummy1)
*Smono
ranksum log2mic if(ab=="Rif" & (dummy1==5 | dummy1==6)), by(dummy1)
*Scoop
ranksum log2mic if(ab=="Rif" & (dummy1==7 | dummy1==8)), by(dummy1)

*Rif Ecoli graph
stripplot log2mic if ab=="Rif" & dummy1<=4, over(dummy1)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5 5) ///
title("Rifampicin, {it:E. coli} isolate MICs", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medlarge)) ///
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
xtitle("") aspectratio(0.9) ///
ylabel(-3(1)8, labsize(medlarge)) yscale(range(-3 8))
*********stats not done yet
///
text(0.71 1.5 "p=0.9785", size(small)) text(0.88 3.5 "p=0.0007", size(small)) 

*Rif Sal graph
stripplot log2mic if ab=="Rif" & dummy1>=5, over(dummy1)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5 5)  ///
title("Rifampicin, {it:S. enterica} isolate MICs", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medlarge)) ///
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
xtitle("") aspectratio(0.9) ///
ylabel(-3(1)9, labsize(medlarge)) yscale(range(-3 9))
*********stats not done yet
///
text(1.05 5.5 "p=0.0002", size(small)) text(1.02 7.5 "p=0.0101", size(small)) 
