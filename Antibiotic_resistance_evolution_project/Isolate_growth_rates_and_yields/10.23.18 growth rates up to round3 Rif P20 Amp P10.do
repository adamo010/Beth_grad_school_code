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
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate growth rates\10.23.18 growth rates up to round3 Rif P20 Amp P10.dta" 

*Making a new variable:
generate dumb_shit = 1 if type=="anc" & evol_condn=="Eanc"
replace dumb_shit = 2 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 3 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 4 if type=="anc" & evol_condn=="Sanc"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 6 if type=="res_isol" & evol_condn=="Scoop"

***********Monoculture growth rates**************

*Rif E mono stats
ranksum mono_gr if(ab=="Rif" & spp=="E" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)

*Rif mono Ecoli growth rates
*15 underscores for this p-value
stripplot mono_gr if ab=="Rif" & dumb_shit<=3, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5) ///
title("Rifampicin, {it:E. coli}" "monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) ///
aspectratio(1) ///
text(0.74 2.5 "_______________", size(medium)) ///
text(0.75 2.5 "p=0.0104", size(medium))

*Rif S mono stats
ranksum mono_gr if(ab=="Rif" & spp=="S" & (dumb_shit==5 | dumb_shit==6)), by(dumb_shit)

*Rif mono Sal growth rates
stripplot mono_gr if ab=="Rif" & dumb_shit>=4, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5) ///
 title("Rifampicin, {it:S. enterica}" "monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(4 `" "Ancestral" "{it:S. enterica}" "' 5 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
6 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.2)1.2, labsize(medlarge)) yscale(range(0 1.2)) ///
aspectratio(1) ///
text(1.11 5.5 "_______________", size(medium)) ///
text(1.12 5.5 "p=0.0003", size(medium)) 

************Coculture growth rates**************

generate rifE_bs = 1 if ab=="Rif" & type=="anc" & evol_condn=="Coopanc"
replace rifE_bs = 2 if ab=="Rif" & type=="res_isol" & evol_condn=="Emono"
replace rifE_bs = 3 if ab=="Rif" & type=="res_isol" & evol_condn=="Ecoop"
generate rifS_bs = 4 if ab=="Rif" & type=="anc" & evol_condn=="Coopanc"
replace rifS_bs = 5 if ab=="Rif" & type=="res_isol" & evol_condn=="Smono"
replace rifS_bs = 6 if ab=="Rif" & type=="res_isol" & evol_condn=="Scoop"

*Rif E coop stats
ranksum coop_gr if(rifE_bs==2 | rifE_bs==3), by(rifE_bs)

*Rif coop Ecoli growth rates
stripplot coop_gr if ab=="Rif" & rifE_bs<=3, over(rifE_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rifE_bs) jitter(5 5 5) ///
title("Rifampicin, {it:E. coli}" "co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(1) ///
text(0.59 2.5 "_______________", size(medium)) ///
text(0.6 2.5 "p=0.6578", size(medium))

*Rif S coop stats
ranksum coop_gr if(rifS_bs==5 | rifS_bs==6), by(rifS_bs)

*Rif coop Sal growth rates
stripplot coop_gr if ab=="Rif", over(rifS_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rifS_bs) jitter(5 5 5) ///
title("Rifampicin, {it:S. enterica}" "co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(4 `" "Ancestral" "{it:S. enterica}" "' 5 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
6 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(1) ///
text(0.67 5.5 "_______________", size(medium)) ///
text(0.68 5.5 "p=0.0314", size(medium))

**************************************************************************************
*******************************AMPICILLIN PASSAGE 10**********************************
**************************************************************************************

***********Monoculture growth rates**************

*Amp E mono stats
ranksum mono_gr if(ab=="Amp" & spp=="E" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)

*Amp mono Ecoli growth rates
*15 underscores for this p-value
stripplot mono_gr if ab=="Amp" & dumb_shit<=3, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5) ///
title("Ampicillin, {it:E. coli}" "monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) ///
aspectratio(1) ///
text(1.01 2.5 "_______________", size(medium)) ///
text(1.02 2.5 "p=0.1131", size(medium))

*Amp S mono stats
ranksum mono_gr if(ab=="Amp" & spp=="S" & (dumb_shit==5 | dumb_shit==6)), by(dumb_shit)

*Amp mono Sal growth rates
stripplot mono_gr if ab=="Amp" & dumb_shit>=4, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5) ///
 title("Ampicillin, {it:S. enterica}" "monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(4 `" "Ancestral" "{it:S. enterica}" "' 5 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
6 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.2)1.2, labsize(medlarge)) yscale(range(0 1.2)) ///
aspectratio(1) ///
text(1.11 5.5 "_______________", size(medium)) ///
text(1.12 5.5 "p=0.3757", size(medium)) 

************Coculture growth rates**************

generate ampE_bs = 1 if ab=="Amp" & type=="anc" & evol_condn=="Coopanc"
replace ampE_bs = 2 if ab=="Amp" & type=="res_isol" & evol_condn=="Emono"
replace ampE_bs = 3 if ab=="Amp" & type=="res_isol" & evol_condn=="Ecoop"
generate ampS_bs = 4 if ab=="Amp" & type=="anc" & evol_condn=="Coopanc"
replace ampS_bs = 5 if ab=="Amp" & type=="res_isol" & evol_condn=="Smono"
replace ampS_bs = 6 if ab=="Amp" & type=="res_isol" & evol_condn=="Scoop"

*Amp E coop stats
ranksum coop_gr if(ampE_bs==2 | ampE_bs==3), by(ampE_bs)

*Amp coop Ecoli growth rates
stripplot coop_gr if ab=="Amp" & ampE_bs<=3, over(ampE_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ampE_bs) jitter(5 5 5) ///
title("Ampicillin, {it:E. coli}" "co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
3 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(1) ///
text(0.66 2.5 "_______________", size(medium)) ///
text(0.67 2.5 "p=0.0247", size(medium))

*Amp S coop stats
ranksum coop_gr if(ampS_bs==5 | ampS_bs==6), by(ampS_bs)

*Amp coop Sal growth rates
stripplot coop_gr if ab=="Amp" & (ampS_bs<=6), over(ampS_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ampS_bs) jitter(5 5 5) ///
title("Ampicillin, {it:S. enterica}" "co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(4 `" "Ancestral" "{it:S. enterica}" "' 5 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
6 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(1) ///
text(0.67 5.5 "_______________", size(medium)) ///
text(0.68 5.5 "p=0.0040", size(medium))


