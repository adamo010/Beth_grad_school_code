****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield
*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
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

***********Monoculture growth rates**************

*Rif E mono stats
ranksum mono_gr if(ab=="Rif" & spp=="E" & (dumb_shit==1 | dumb_shit==3)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="E" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="E" & (dumb_shit==1 | dumb_shit==5)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="E" & (dumb_shit==4 | dumb_shit==5)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="E" & (dumb_shit==3 | dumb_shit==5)), by(dumb_shit)

*Rif mono Ecoli growth rates
stripplot mono_gr if ab=="Rif" & dumb_shit<=5, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' 3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 5 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)1.0, labsize(medsmall)) yscale(range(0 1.0)) ///
aspectratio(0.9) ///
text(0.8 2 "p=0.0878", size(small)) text(0.73 2.5 "p=0.9785", size(small)) ///
text(0.98 3 "p=0.1955", size(small)) text(0.92 4 "p=0.0160", size(small)) text(0.85 4.5 "p=0.0007", size(small))

*Rif S mono stats
ranksum mono_gr if(ab=="Rif" & spp=="S" & (dumb_shit==7 | dumb_shit==9)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="S" & (dumb_shit==8 | dumb_shit==9)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="S" & (dumb_shit==7 | dumb_shit==11)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="S" & (dumb_shit==9 | dumb_shit==10)), by(dumb_shit)
ranksum mono_gr if(ab=="Rif" & spp=="S" & (dumb_shit==9 | dumb_shit==11)), by(dumb_shit)

*Rif mono Sal growth rates
stripplot mono_gr if ab=="Rif" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.25 gold green*0.5 green)  ///
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
ylabel(0(0.2)1.2, labsize(medsmall)) yscale(range(0 1.2)) ///
aspectratio(0.8, placement(left)) ///
text(1.1 8 "p<0.00001", size(small)) text(1.02 8.5 "p=0.0002", size(small)) ///
text(1.19 9 "p=0.0026", size(small)) text(1.12 10 "p=0.0003", size(small)) text(1.03 10.5 "p<0.00001", size(small))

*Amp Emono stats
ranksum mono_gr if(ab=="Amp" & spp=="E" & (dumb_shit==1 | dumb_shit==3)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="E" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="E" & (dumb_shit==1 | dumb_shit==5)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="E" & (dumb_shit==4 | dumb_shit==5)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="E" & (dumb_shit==3 | dumb_shit==5)), by(dumb_shit)

*Amp mono Ecoli growth rates
stripplot mono_gr if ab=="Amp" & dumb_shit<=5, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:E. coli} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' 3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 5 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)1.0, labsize(medsmall)) yscale(range(0 1.0)) ///
aspectratio(0.9) ///
text(0.89 2 "p=0.200", size(small)) text(0.83 2.5 "p=0.0005", size(small)) ///
text(0.95 3 "p=0.2128", size(small)) text(0.85 4 "p=0.0062", size(small)) text(0.79 4.5 "p=0.6102", size(small))

*Amp Smono stats
ranksum mono_gr if(ab=="Amp" & spp=="S" & (dumb_shit==7 | dumb_shit==9)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="S" & (dumb_shit==8 | dumb_shit==9)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="S" & (dumb_shit==7 | dumb_shit==11)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="S" & (dumb_shit==9 | dumb_shit==10)), by(dumb_shit)
ranksum mono_gr if(ab=="Amp" & spp=="S" & (dumb_shit==9 | dumb_shit==11)), by(dumb_shit)

*Amp mono Sal growth rates
stripplot mono_gr if ab=="Amp" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.25 gold green*0.5 green)  ///
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
ylabel(0(0.2)1.4, labsize(medsmall)) yscale(range(0 1.4)) ///
aspectratio(0.8, placement(left)) ///
text(1.3 8 "p=0.3881", size(small)) text(1.18 8.5 "p=0.0199", size(small)) ///
text(1.38 9 "p=0.0183", size(small)) text(1.13 10 "p=0.0030", size(small)) text(1.03 10.5 "p=0.0040", size(small))


************Coculture growth rates**************
***********************************************
*need new variables because my life is a trash bin

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

generate ampE_bs = 1 if ab=="Amp" & type=="anc" & evol_condn=="Coopanc"
replace ampE_bs = 2 if type=="abfree_isol" & evol_condn=="Emono" 
replace ampE_bs = 3 if type=="res_isol" & evol_condn=="Emono"
replace ampE_bs = 4 if type=="abfree_isol" & evol_condn=="Ecoop"
replace ampE_bs = 5 if type=="res_isol" & evol_condn=="Ecoop"

generate ampS_bs = 7 if ab=="Amp" & type=="anc" & evol_condn=="Coopanc"
replace ampS_bs = 8 if type=="abfree_isol" & evol_condn=="Smono"
replace ampS_bs = 9 if type=="res_isol" & evol_condn=="Smono"
replace ampS_bs = 10 if type=="abfree_isol" & evol_condn=="Scoop"
replace ampS_bs = 11 if type=="res_isol" & evol_condn=="Scoop"

*Rif E coop stats
ranksum coop_gr if(rifE_bs==1 | rifE_bs==3), by(rifE_bs)
ranksum coop_gr if(rifE_bs==2 | rifE_bs==3), by(rifE_bs)
ranksum coop_gr if(rifE_bs==1 | rifE_bs==5), by(rifE_bs)
ranksum coop_gr if(rifE_bs==4 | rifE_bs==5), by(rifE_bs)
ranksum coop_gr if(rifE_bs==3 | rifE_bs==5), by(rifE_bs)

*Rif coop Ecoli growth rates
stripplot coop_gr if ab=="Rif" & rifE_bs<=5, over(rifE_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rifE_bs) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medsmall)) ///
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
xlabel(1 `" "Ancestral ES" "coculture" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' 3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 5 `" "Coop-evolved" "resistant" "{it:E. coli}" "' , labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medsmall)) yscale(range(0 0.8)) ///
aspectratio(0.9) ///
text(0.72 2 "p=0.06656", size(small)) text(0.65 2.5 "p<0.00001", size(small)) ///
text(0.78 3 "p=0.0401", size(small)) text(0.68 4 "p=0.1256", size(small)) text(0.63 4.5 "p=0.0008", size(small))

*Rif S coop stats
ranksum coop_gr if(rifS_bs==7 | rifS_bs==9), by(rifS_bs)
ranksum coop_gr if(rifS_bs==8 | rifS_bs==9), by(rifS_bs)
ranksum coop_gr if(rifS_bs==7 | rifS_bs==11), by(rifS_bs)
ranksum coop_gr if(rifS_bs==10 | rifS_bs==11), by(rifS_bs)
ranksum coop_gr if(rifS_bs==9 | rifS_bs==11), by(rifS_bs)

*Rif coop Sal growth rates
stripplot coop_gr if ab=="Rif" & (rifS_bs>=7), over(rifS_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rifS_bs) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culutre growth rate", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.25 gold green*0.5 green)  ///
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
ylabel(0(0.1)0.9, labsize(medsmall)) yscale(range(0 0.9)) ///
aspectratio(0.8, placement(left)) ///
text(0.78 8 "p=0.0041", size(small)) text(0.7 8.5 "p=0.0003", size(small)) ///
text(0.88 9 "p=0.0025", size(small)) text(0.83 10 "p=0.2154", size(small)) text(0.76 10.5 "p=0.5039", size(small))

*Amp Ecoop stats
ranksum coop_gr if(ampE_bs==1 | ampE_bs==3), by(ampE_bs)
ranksum coop_gr if(ampE_bs==2 | ampE_bs==3), by(ampE_bs)
ranksum coop_gr if(ampE_bs==1 | ampE_bs==5), by(ampE_bs)
ranksum coop_gr if(ampE_bs==4 | ampE_bs==5), by(ampE_bs)
ranksum coop_gr if(ampE_bs==3 | ampE_bs==5), by(ampE_bs)

*Amp coop Ecoli growth rates
stripplot coop_gr if ab=="Amp" & ampE_bs<=5, over(ampE_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ampE_bs) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:E. coli} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue*0.5 midblue purple*0.5 purple gs4)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral ES" "coculture" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' 3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 5 `" "Coop-evolved" "resistant" "{it:E. coli}" "' , labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medsmall)) yscale(range(0 0.8)) ///
aspectratio(0.9) ///
text(0.73 2 "p<0.00001", size(small)) text(0.66 2.5 "p<0.00001", size(small)) ///
text(0.79 3 "p<0.00001", size(small)) text(0.70 4 "p=0.1256", size(small)) text(0.66 4.5 "p=0.0008", size(small))


*Amp Scoop stats
ranksum coop_gr if(ampS_bs==7 | ampS_bs==9), by(ampS_bs)
ranksum coop_gr if(ampS_bs==8 | ampS_bs==9), by(ampS_bs)
ranksum coop_gr if(ampS_bs==7 | ampS_bs==11), by(ampS_bs)
ranksum coop_gr if(ampS_bs==10 | ampS_bs==11), by(ampS_bs)
ranksum coop_gr if(ampS_bs==9 | ampS_bs==11), by(ampS_bs)

*Amp coop Sal growth rates
stripplot coop_gr if ab=="Amp" & ampS_bs>=7, over(ampS_bs) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ampS_bs) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.25 gold green*0.5 green)  ///
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
ylabel(0(0.1)0.9, labsize(medsmall)) yscale(range(0 0.9)) ///
aspectratio(0.8, placement(left)) ///
text(0.72 8 "p<0.00001", size(small)) text(0.67 8.5 "p=0.0003", size(small)) ///
text(0.88 9 "p=0.0038", size(small)) text(0.80 10 "p=0.2154", size(small))  text(0.72 10.5 "p=0.5039", size(small))


