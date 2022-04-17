*Compare resistant isolate growth rates vs. ancestor and ab-free isolates
*Dataset: resistant isolates, ancestral, ab-free isolates (no populations)
*Divide graphs into Rif/Species/Evoltype/growth condn

****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12


*Im so fucking frustrated with comparing apples to oranges in this fucking dataset. I said it was going to be fucking complicated and no one
*fucking listened to me and now I ahve to redo every fucking analysis 10000000times because of it. Fuck this

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
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free {it:E. coli}" "' 3 `" "Mono-evolved" "resistant {it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free {it:E. coli}" "' 5 `" "Coop-evolved" "resistant {it:E. coli}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.9, labsize(medsmall)) yscale(range(0 0.9)) ///
aspectratio(0.9)

*Rif mono Sal growth rates
stripplot mono_gr if ab=="Rif" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.2)1.2, labsize(medsmall)) yscale(range(0 1.2)) ///
aspectratio(0.8, placement(left)) 


*Rif coop Ecoli growth rates
stripplot coop_gr if ab=="Rif" & dumb_shit<=6 & dumb_shit>=2, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
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
xlabel(2 `" "Mono-evolved" "Ab-free {it:E. coli}" "' 3 `" "Mono-evolved" "resistant {it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free {it:E. coli}" "' 5 `" "Coop-evolved" "resistant {it:E. coli}" "' 6 `" "Ancestral ES" "coculture" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.9, labsize(medsmall)) yscale(range(0 0.9)) ///
aspectratio(0.9)

*Rif mcoop Sal growth rates
stripplot coop_gr if ab=="Rif" & dumb_shit!=7 & dumb_shit>=6, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
xlabel(6 `" "Ancestral ES" "coculture" "' 8 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' 9 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
10 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medsmall)) yscale(range(0 0.8)) ///
aspectratio(0.7, placement(left)) 

****Ampicillin

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
ylabel(0(0.2)1.4, labsize(medsmall)) yscale(range(0 1.4)) ///
aspectratio(0.9)

*Amp mono Sal growth rates
stripplot mono_gr if ab=="Amp" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
ylabel(0(0.2)1.2, labsize(medsmall)) yscale(range(0 1.2)) ///
aspectratio(0.8, placement(left)) 


*Amp coop Ecoli growth rates
stripplot coop_gr if ab=="Amp" & dumb_shit<=6 & dumb_shit>=2, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
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
xlabel(2 `" "Mono-evolved" "Ab-free {it:E. coli}" "' 3 `" "Mono-evolved" "resistant {it:E. coli}" "' ///
4 `" "Coop-evolved" "Ab-free {it:E. coli}" "' 5 `" "Coop-evolved" "resistant {it:E. coli}" "' 6 `" "Ancestral ES" "coculture" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.9, labsize(medsmall)) yscale(range(0 0.9)) ///
aspectratio(0.9)

*Amp mcoop Sal growth rates
stripplot coop_gr if ab=="Amp" & dumb_shit!=7 & dumb_shit>=6, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} monoculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medsmall)) ///
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
xlabel(6 `" "Ancestral ES" "coculture" "' 8 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' 9 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
10 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(small)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medsmall)) yscale(range(0 0.8)) ///
aspectratio(0.7, placement(left)) 

