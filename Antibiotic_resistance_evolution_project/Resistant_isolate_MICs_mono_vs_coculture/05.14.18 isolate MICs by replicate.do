*1st set of graphs: AbR vs. AbS vs. Anc
*2nd set of graphs: pop vs. AbR

****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*I don't know what I want this to be yet, but it isn't that.

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

generate dumbass = 1 if type=="pop" & evol_condn=="Emono"
replace dumbass = 2 if type=="res_isol" & evol_condn=="Emono"
replace dumbass = 3 if type=="pop" & evol_condn=="Smono"
replace dumbass = 4 if type=="res_isol" & evol_condn=="Smono"
replace dumbass = 5 if type=="pop" & evol_condn=="Coop"
replace dumbass = 6 if type=="res_isol" & evol_condn=="Ecoop"
replace dumbass = 7 if type=="res_isol" & evol_condn=="Scoop"

generate log2mic = ln(mic)/ln(2) 

*Ecoli Rif monoculture 
stripplot log2mic if ab=="Rif" & dumbass<=2 & rep<=6, over(rep) ///
stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} MICs by replicate", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 midblue*0.5 midblue purple*0.5 purple)  ///
msymbol(square triangle circle triangle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(3) order(2 "Ancestral {it:E. coli}" 3 "Mono-evolved Ab-free {it:E. coli}" ///
4 "Mono-evolved resistant {it:E. coli}" 5 "Coop-evolved Ab-free {it:E. coli}" ///
6 "Coop-evolved resistant {it:E. coli}") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)8, labsize(medsmall)) yscale(range(-3 8)) 

*Sal Rif monoculture graph
stripplot log2mic if ab=="Rif" & dumb_shit>=7 & rep<=6, over(rep) ///
stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} MICs by replicate", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
xtitle("Species-evolution condition", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gs4 cranberry*0.5 cranberry green*0.5 green)  ///
msymbol(square triangle circle triangle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(3) order(2 "Ancestral {it:S. enterica}" 3 "Mono-evolved Ab-free {it:S. enterica}" ///
4 "Mono-evolved resistant {it:S. enterica}" 5 "Coop-evolved Ab-free {it:S. enterica}" ///
6 "Coop-evolved resistant {it:S. enterica}") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
xlabel(1 "Rep1" 2 "Rep2" 3 "Rep3" 4 "Rep4" 5 "Rep5" 6 "Rep6", labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-1(1)9, labsize(medsmall)) yscale(range(-1 9))


