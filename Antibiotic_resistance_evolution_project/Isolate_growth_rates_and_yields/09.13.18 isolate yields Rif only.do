clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate yields\09.13.18 isolate yields Rif only.dta"

*Stolen from 05.18.18 growth rates with stats

****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield
*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*Goal: Per spp/ab combination (eg. Rif E): Anc/Emonoev Abfree/Emonoev Res/Ecoopev Abfree/Ecoopev Res

*Making a new variable:
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

***********Monoculture yields**************

*Rif E mono stats
ranksum mono_yield if(ab=="Rif" & spp=="E" & (dumb_shit==1 | dumb_shit==3)), by(dumb_shit)
ranksum mono_yield if(ab=="Rif" & spp=="E" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)
ranksum mono_yield if(ab=="Rif" & spp=="E" & (dumb_shit==1 | dumb_shit==5)), by(dumb_shit)
ranksum mono_yield if(ab=="Rif" & spp=="E" & (dumb_shit==3 | dumb_shit==5)), by(dumb_shit)

*Rif mono Ecoli growth rates
stripplot mono_yield if ab=="Rif" & dumb_shit<=5, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} monoculture growth yields", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture yield", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free {it:E. coli}" "' 3 `" "Mono-evolved" "resistant {it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free {it:E. coli}" "' 5 `" "Coop-evolved" "resistant {it:E. coli}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.05)0.3, labsize(medsmall)) yscale(range(0 0.3)) ///
aspectratio(0.8) ///
text(0.25 4 "p=0.4882", size(small))

*Rif S mono stats
ranksum mono_yield if(ab=="Rif" & spp=="S" & (dumb_shit==7 | dumb_shit==9)), by(dumb_shit)
ranksum mono_yield if(ab=="Rif" & spp=="S" & (dumb_shit==8 | dumb_shit==9)), by(dumb_shit)
ranksum mono_yield if(ab=="Rif" & spp=="S" & (dumb_shit==7 | dumb_shit==11)), by(dumb_shit)
ranksum mono_yield if(ab=="Rif" & spp=="S" & (dumb_shit==9 | dumb_shit==11)), by(dumb_shit)

*Rif mono Sal growth rates
stripplot mono_yield if ab=="Rif" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} monoculture growth yields", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture yield", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 cranberry*0.5 cranberry green*0.5 green)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(7 `" "Ancestral" "{it:S. enterica}" "' 8 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' 9 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
10 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.05)0.5, labsize(medsmall)) yscale(range(0 0.5)) ///
aspectratio(0.8) ///
text(0.43 10 "p=0.1248", size(small))

***********Coculture yields**************

generate rifE_bs = 1 if ab=="Rif" & type=="anc" & evol_condn=="Coopanc"
replace rifE_bs = 2 if type=="abfree_isol" & evol_condn=="Emono" 
replace rifE_bs = 3 if type=="res_isol" & evol_condn=="Emono"
replace rifE_bs = 4 if type=="abfree_isol" & evol_condn=="Ecoop"
replace rifE_bs = 5 if type=="res_isol" & evol_condn=="Ecoop"

generate rifS_bs = 7 if ab=="Rif" & type=="anc" & evol_condn=="Coopanc"
replace rifS_bs = 8 if type=="abfree_isol" & evol_condn=="Smono"
replace rifS_bs = 9 if type=="res_isol" & evol_condn=="Smono"
replace rifS_bs = 10 if type=="abfree_isol" & evol_condn=="Scoop"
replace rifS_bs = 11 if type=="res_isol" & evol_condn=="Scoop"

*Ecoop yields stats
ranksum coop_yield if((rifE_bs==1 | rifE_bs==3)), by(rifE_bs)
ranksum coop_yield if((rifE_bs==2 | rifE_bs==3)), by(rifE_bs)
ranksum coop_yield if((rifE_bs==1 | rifE_bs==5)), by(rifE_bs)
ranksum coop_yield if((rifE_bs==3 | rifE_bs==5)), by(rifE_bs)

*Ecoop yields
stripplot coop_yield if ab=="Rif", over(rifE_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rifE_bs) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} co-culture growth yields", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture yield", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free {it:E. coli}" "' 3 `" "Mono-evolved" "resistant {it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free {it:E. coli}" "' 5 `" "Coop-evolved" "resistant {it:E. coli}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.05)0.4, labsize(medsmall)) yscale(range(0 0.4)) ///
aspectratio(0.8) ///
text(0.35 4 "p=0.2964", size(small))

*Scoop yields stats
ranksum coop_yield if((rifS_bs==7 | rifS_bs==9)), by(rifS_bs)
ranksum coop_yield if((rifS_bs==8 | rifS_bs==9)), by(rifS_bs)
ranksum coop_yield if((rifS_bs==7 | rifS_bs==11)), by(rifS_bs)
ranksum coop_yield if((rifS_bs==9 | rifS_bs==11)), by(rifS_bs)

*Scoop yields
stripplot coop_yield if ab=="Rif", over(rifS_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rifS_bs) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} co-culture growth yields", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture yield", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 cranberry*0.5 cranberry green*0.5 green)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(7 `" "Ancestral" "{it:S. enterica}" "' 8 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' 9 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
10 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.05)0.4, labsize(medsmall)) yscale(range(0 0.4)) ///
aspectratio(0.8) ///
text(0.33 10 "p=0.0040", size(small))

