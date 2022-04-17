****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield
*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*Goal: toss Abfree, only compare resistant GRs to ancestor

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate growth rates\09.26.18 anc vs resistant isolate GRs no abfree.dta"

*Mono_grs
generate dummy1 = 1 if type=="anc" & evol_condn=="Eanc"
replace dummy1 = 2 if type=="res_isol" & evol_condn=="Emono"
replace dummy1 = 3 if type=="res_isol" & evol_condn=="Ecoop"
replace dummy1 = 4 if type=="anc" & evol_condn=="Sanc"
replace dummy1 = 5 if type=="res_isol" & evol_condn=="Smono"
replace dummy1 = 6 if type=="res_isol" & evol_condn=="Scoop"

*Coop_grs
generate dummy2 = 1 if type=="anc" & evol_condn=="Coopanc"
replace dummy2 = 2 if type=="res_isol" & evol_condn=="Emono"
replace dummy2 = 3 if type=="res_isol" & evol_condn=="Ecoop"
generate dummy3 = 4 if type=="anc" & evol_condn=="Coopanc"
replace dummy3 = 5 if type=="res_isol" & evol_condn=="Smono"
replace dummy3 = 6 if type=="res_isol" & evol_condn=="Scoop"

***********Monoculture growth rates**************

*All Rif Stats
*Emono
ranksum mono_gr if(ab=="Rif" & (dummy1==1 | dummy1==2)), by(dummy1)
*Ecoop
ranksum mono_gr if(ab=="Rif" & (dummy1==1 | dummy1==3)), by(dummy1)
*Smono
ranksum mono_gr if(ab=="Rif" & (dummy1==4 | dummy1==5)), by(dummy1)
*Scoop
ranksum mono_gr if(ab=="Rif" & (dummy1==4 | dummy1==6)), by(dummy1)

*Rif Ecoli graph
stripplot mono_gr if ab=="Rif" & dummy1<=3, over(dummy1)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5)  ///
title("Rifampicin, {it:E. coli}" "monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(medlarge medlarge medlarge) ///
mlcolor(black black black) ///
mlwidth(vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.9, labsize(medsmall)) yscale(range(0 0.9)) ///
aspectratio(1.2) ///
text(0.75 1.5 "p=0.0878", size(small)) text(0.85 2 "p=0.1955", size(small)) 

*Rif Sal graph
stripplot mono_gr if ab=="Rif" & dummy1>=4, over(dummy1)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy1) jitter(5 5 5)  ///
title("Rifampicin, {it:S. enterica}" "monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(medlarge medlarge medlarge) ///
mlcolor(black black black) ///
mlwidth(vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(4 `" "Ancestral" "{it:S. enterica}" "' 5 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
6 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.2)1.2, labsize(medsmall)) yscale(range(0 1.2)) ///
aspectratio(1.2) ///
text(0.98 4.5 "p<0.00001", size(small)) text(1.1 5 "p=0.0026", size(small)) 

***********Co-culture growth rates**************

*All Rif Stats
*Emono
ranksum coop_gr if(ab=="Rif" & (dummy2==1 | dummy2==2)), by(dummy2)
*Ecoop
ranksum coop_gr if(ab=="Rif" & (dummy2==1 | dummy2==3)), by(dummy2)
*Smono
ranksum coop_gr if(ab=="Rif" & (dummy3==4 | dummy3==5)), by(dummy3)
*Scoop
ranksum coop_gr if(ab=="Rif" & (dummy3==4 | dummy3==6)), by(dummy3)

*Rif Ecoli graph
stripplot coop_gr if ab=="Rif", over(dummy2)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy2) jitter(5 5 5)  ///
title("Rifampicin, {it:E. coli}" "co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(medlarge medlarge medlarge) ///
mlcolor(black black black) ///
mlwidth(vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medsmall)) yscale(range(0 0.7)) ///
aspectratio(1.2) ///
text(0.59 1.5 "p=0.7903", size(small)) text(0.65 2 "p=0.9093", size(small)) 

*Rif Sal graph
stripplot coop_gr if ab=="Rif", over(dummy3)  ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy3) jitter(5 5 5)  ///
title("Rifampicin, {it:S. enterica}" "co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medium)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(medlarge medlarge medlarge) ///
mlcolor(black black black) ///
mlwidth(vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(4 `" "Ancestral" "{it:S. enterica}" "' 5 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
6 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medsmall)) yscale(range(0 0.7)) ///
aspectratio(1.2) ///
text(0.55 4.5 "p=0.1385", size(small)) text(0.68 5 "p=0.0070", size(small)) 

