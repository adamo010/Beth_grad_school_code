****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: changed to goldish
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*Based on 05.25.18 isolate MICs by culture condition
*includes Abfree and ancestral data

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Resistant isolate MICs in mono vs coculture\10.23.18 round8 isolate MICs Rif P20 Amp P10.dta"

*Making new variables
generate log2mic = ln(mic)/ln(2) 

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

******Rif statistics: *anc vs. mono-res, abfree vs. mono-res, anc vs. coop-res, abfree vs coop-res, mono-res vs coop-res
*Ecoli
ranksum log2mic if(ab=="Rif" & (dumb_shit==1 | dumb_shit==3)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==1 | dumb_shit==5)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==4 | dumb_shit==5)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==3 | dumb_shit==5)), by(dumb_shit)
*Sal
ranksum log2mic if(ab=="Rif" & (dumb_shit==7 | dumb_shit==9)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==8 | dumb_shit==9)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==7 | dumb_shit==11)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==10 | dumb_shit==11)), by(dumb_shit)
ranksum log2mic if(ab=="Rif" & (dumb_shit==9 | dumb_shit==11)), by(dumb_shit)

*Rif Ecoli mics
stripplot log2mic if ab=="Rif" & dumb_shit<=5, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:E. coli} MICs", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
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
4 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 5 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)10, labsize(medsmall)) yscale(range(-3 10)) ///
text(9 2 "p<0.00001", size(small)) text(8 2.5 "p<0.00001", size(small)) text(9.5 3 "p=0.0001", size(small)) ///
text(7 4.5 "p<0.00001", size(small)) text(8 4 "p=0.0181", size(small))

*Rif Sal mics
stripplot log2mic if ab=="Rif" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Rifampicin, {it:S. enterica} MICs", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Rifampicin], {&mu}g/mL", size(medsmall)) ///
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
10 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-1(1)11, labsize(medsmall)) yscale(range(-1 11)) ///
text(9.5 8 "p<0.00001", size(small)) text(8.9 8.5 "p=<0.00001", size(small)) text(10.5 9 "p=0.0001", size(small)) ///
text(8 10.5 "p=0.0001", size(small)) text(9.5 10 "p=0.0172", size(small))


******Amp statistics: *anc vs. mono-res, abfree vs. mono-res, anc vs. coop-res, abfree vs coop-res, mono-res vs coop-res
*Ecoli
ranksum log2mic if(ab=="Amp" & (dumb_shit==1 | dumb_shit==3)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==2 | dumb_shit==3)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==1 | dumb_shit==5)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==4 | dumb_shit==5)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==3 | dumb_shit==5)), by(dumb_shit)
*Sal
ranksum log2mic if(ab=="Amp" & (dumb_shit==7 | dumb_shit==9)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==8 | dumb_shit==9)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==7 | dumb_shit==11)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==10 | dumb_shit==11)), by(dumb_shit)
ranksum log2mic if(ab=="Amp" & (dumb_shit==9 | dumb_shit==11)), by(dumb_shit)

*Ancestor is high relative to abfree, so redo ancestor and look at abfree only stats
*Amp Ecoli mics
stripplot log2mic if ab=="Amp" & dumb_shit<=5, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:E. coli} MICs", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
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
4 `" "Coop-evolved" "Ab-free" "{it:E. coli}" "' 5 `" "Coop-evolved" "resistant" "{it:E. coli}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-3(1)4, labsize(medsmall)) yscale(range(-3 4)) ///
text(2.7 2.5 "p=0.0005", size(small)) ///
text(2 4.5 "p=0.0032", size(small)) text(2.7 4 "p=0.0825", size(small))

*Rif Sal mics
stripplot log2mic if ab=="Amp" & dumb_shit>=7, over(dumb_shit) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dumb_shit) jitter(5 5 5 5 5) ///
title("Ampicillin, {it:S. enterica} MICs", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}[Ampicillin], {&mu}g/mL", size(medsmall)) ///
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
10 `" "Coop-evolved" "Ab-free" "{it:S. enterica}" "' 11 `" "Coop-evolved" "resistant" "{it:S. enterica}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(-5(1)4, labsize(medsmall)) yscale(range(-5 4)) ///
text(2.8 8.5 "p<0.00001", size(small)) ///
text(1.8 10.5 "p=0.0012", size(small)) text(2.8 10 "p=0.0825", size(small))
