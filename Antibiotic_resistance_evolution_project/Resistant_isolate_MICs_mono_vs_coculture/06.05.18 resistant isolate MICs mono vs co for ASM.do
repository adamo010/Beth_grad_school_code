****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
**********Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

generate dumb_shit = 1 if type=="anc" & evol_condn=="Eanc"
replace dumb_shit = 3 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 7 if type=="anc" & evol_condn=="Sanc"
replace dumb_shit = 9 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 11 if type=="res_isol" & evol_condn=="Scoop"

generate log2mic = ln(mic)/ln(2) 

*Rif Ecoli mics
stripplot log2mic if ab=="Rif" & dumb_shit<=5, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(large)) ///
xtitle("Species-evolution condition", size(mvlarge) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue purple)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black ) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 `" "Ancestral" "{it:E. coli}" "' 3 `" "Mono-evolved" "resistant" "{it:E. coli}" "' ///
5 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xtitle("") aspectratio(1 ,placement(left)) ///
ylabel(-3(1)8, labsize(medlarge)) yscale(range(-3 8)) ///
text(7.9 4 "p=0.0181", size(medlarge))

*Rif Sal mics
stripplot log2mic if ab=="Rif" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5) ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(large)) ///
xtitle("Species-evolution condition", size(vlarge) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 gold green)  ///
msymbol(circle circle circle) ///
msize(large large large) ///
mlcolor(black black black ) ///
mlwidth(thin thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(7 `" "Ancestral" "{it:S. enterica}" "' 9 `" "Mono-evolved" "resistant" "{it:S. enterica}" "' ///
11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medlarge)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") aspectratio(1 ,placement(left)) ///
ylabel(-1(1)9, labsize(medlarge)) yscale(range(-1 9)) ///
text(8.8 10 "p=0.0172", size(medlarge))

