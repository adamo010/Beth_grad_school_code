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

*Making graph-specific variables:
*should only have to note ab in the stripplot command (eg stripplot mono_gr if ab=="Rif" & monoE > 0, over(monoE)
generate monoE = 1 if evol_condn=="Eanc"
replace monoE = 2 if evol_condn=="Emono" & type=="abfree_isol"
replace monoE = 3 if evol_condn=="Emono" & type=="res_isol"
replace monoE = 4 if evol_condn=="Ecoop" & type=="abfree_isol"
replace monoE = 5 if evol_condn=="Ecoop" & type=="res_isol"

*Rif Ec monoculture GRs
ranksum mono_gr if(ab=="Rif" & (monoE==3 | monoE==5)), by(monoE)

stripplot mono_gr if ab=="Rif", over(monoE) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(monoE) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' ///
3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' 4 `" "Coop-evolved" "Ab-free" "{it: E. coli}" "' ///
5 `" "Coop-evolved" "resistant" "{it: E. coli}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) ///
aspectratio(0.7) ///
text(0.94 4 "_________________________", size(medium)) ///
text(0.95 4 "p=0.0104", size(medium))

*Rif Sal monoculture GRs
generate monoS = 1 if evol_condn=="Sanc"
replace monoS = 2 if evol_condn=="Smono" & type=="abfree_isol"
replace monoS = 3 if evol_condn=="Smono" & type=="res_isol"
replace monoS = 4 if evol_condn=="Scoop" & type=="abfree_isol"
replace monoS = 5 if evol_condn=="Scoop" & type=="res_isol"

ranksum mono_gr if(ab=="Rif" & (monoS==3 | monoS==5)), by(monoS)

stripplot mono_gr if ab=="Rif", over(monoS) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(monoS) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.5 gold green*0.5 green)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:S. enterica}" "' 2 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' ///
3 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' 4 `" "Coop-evolved" "Ab-free" "{it: S. enterica}" "' ///
5 `" "Coop-evolved" "resistant" "{it: S. enterica}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.2)1.2, labsize(medlarge)) yscale(range(0 1.2)) ///
aspectratio(0.7) ///
text(1.11 4 "_________________________", size(medium)) ///
text(1.12 4 "p=0.0003", size(medium))

*Rif Ec coculture GRs
generate coopE = 1 if evol_condn=="Coopanc"
replace coopE = 2 if evol_condn=="Emono" & type=="abfree_isol"
replace coopE = 3 if evol_condn=="Emono" & type=="res_isol"
replace coopE = 4 if evol_condn=="Ecoop" & type=="abfree_isol"
replace coopE = 5 if evol_condn=="Ecoop" & type=="res_isol"

ranksum coop_gr if(ab=="Rif" & (coopE==3 | coopE==5)), by(coopE)

stripplot coop_gr if ab=="Rif", over(coopE) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(coopE) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' ///
3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' 4 `" "Coop-evolved" "Ab-free" "{it: E. coli}" "' ///
5 `" "Coop-evolved" "resistant" "{it: E. coli}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(0.7) ///
text(0.65 4 "_________________________", size(medium)) ///
text(0.66 4 "p=0.6578", size(medium))

*Rif Sal coculture GRs
generate coopS = 1 if evol_condn=="Coopanc"
replace coopS = 2 if evol_condn=="Smono" & type=="abfree_isol"
replace coopS = 3 if evol_condn=="Smono" & type=="res_isol"
replace coopS = 4 if evol_condn=="Scoop" & type=="abfree_isol"
replace coopS = 5 if evol_condn=="Scoop" & type=="res_isol"

ranksum coop_gr if(ab=="Rif" & (coopS==3 | coopS==5)), by(coopS)

stripplot coop_gr if ab=="Rif", over(coopS) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(coopS) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.5 gold green*0.5 green)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:S. enterica}" "' 2 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' ///
3 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' 4 `" "Coop-evolved" "Ab-free" "{it: S. enterica}" "' ///
5 `" "Coop-evolved" "resistant" "{it: S. enterica}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) ///
aspectratio(0.7) ///
text(0.75 4 "_________________________", size(medium)) ///
text(0.76 4 "p=0.0314", size(medium))


**************************************************************************************
*******************************AMPICILLIN PASSAGE 10**********************************
**************************************************************************************

*Amp Ec monoculture GRs
ranksum mono_gr if(ab=="Amp" & (monoE==3 | monoE==5)), by(monoE)

stripplot mono_gr if ab=="Amp", over(monoE) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(monoE) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:E. coli} monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' ///
3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' 4 `" "Coop-evolved" "Ab-free" "{it: E. coli}" "' ///
5 `" "Coop-evolved" "resistant" "{it: E. coli}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) ///
aspectratio(0.7) ///
text(1.01 4 "_________________________", size(medium)) ///
text(1.02 4 "p=0.1131", size(medium))

*Amp Sal monoculture GRs
ranksum mono_gr if(ab=="Amp" & (monoS==3 | monoS==5)), by(monoS)

stripplot mono_gr if ab=="Amp", over(monoS) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(monoS) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} monculture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.5 gold green*0.5 green)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:S. enterica}" "' 2 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' ///
3 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' 4 `" "Coop-evolved" "Ab-free" "{it: S. enterica}" "' ///
5 `" "Coop-evolved" "resistant" "{it: S. enterica}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.2)1.2, labsize(medlarge)) yscale(range(0 1.2)) ///
aspectratio(0.7) ///
text(1.11 4 "_________________________", size(medium)) ///
text(1.12 4 "p=0.3757", size(medium))

*Rif Ec coculture GRs
ranksum coop_gr if(ab=="Amp" & (coopE==3 | coopE==5)), by(coopE)

stripplot coop_gr if ab=="Amp", over(coopE) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(coopE) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:E. coli} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 2 `" "Mono-evolved" "Ab-free" "{it:E. coli}" "' ///
3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' 4 `" "Coop-evolved" "Ab-free" "{it: E. coli}" "' ///
5 `" "Coop-evolved" "resistant" "{it: E. coli}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(0.7) ///
text(0.67 4 "_________________________", size(medium)) ///
text(0.68 4 "p=0.0247", size(medium))

*Rif Sal coculture GRs
ranksum coop_gr if(ab=="Amp" & (coopS==3 | coopS==5)), by(coopS)

stripplot coop_gr if ab=="Amp", over(coopS) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(coopS) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} co-culture growth rates", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("Species-evolution condition", size(large) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold*0.5 gold green*0.5 green)  ///
msymbol(circle circle circle circle circle) ///
msize(large large large large large) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:S. enterica}" "' 2 `" "Mono-evolved" "Ab-free" "{it:S. enterica}" "' ///
3 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' 4 `" "Coop-evolved" "Ab-free" "{it: S. enterica}" "' ///
5 `" "Coop-evolved" "resistant" "{it: S. enterica}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
aspectratio(0.7) ///
text(0.65 4 "_________________________", size(medium)) ///
text(0.66 4 "p=0.0040", size(medium))

