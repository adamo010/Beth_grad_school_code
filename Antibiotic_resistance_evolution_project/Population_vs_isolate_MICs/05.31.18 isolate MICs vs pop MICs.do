****I am not finished yet!!! Start again when you do not have 475096 other things to do!!!!

****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mic
***Took out all Abfree stuff

*Colour schema for reps 1-6, respectively:
*Emono pop: gs4
*Emono res: blue bluishgray cyan eltblue midblue teal
*Smono abfree: gold*0.25
*Smono res: gold
*Coop abfree: lime*0.35 dkgreen*0.5 olive_teal*0.5 midgreen*0.5 mint*0.5 eltgreen*0.5
*Coop res: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Pop: gs2 gs8 gs4 gs10 gs6 gs12

generate log2mic = ln(mic)/ln(2)

generate repdummy = 1 if rep==1
replace repdummy = 4 if rep==2
replace repdummy = 7 if rep==3
replace repdummy = 10 if rep==4
replace repdummy = 13 if rep==5
replace repdummy = 16 if rep==6 

generate typerep = 1 if type=="pop" & rep==1
replace typerep = 2 if type=="pop" & rep==2
replace typerep = 3 if type=="pop" & rep==3
replace typerep = 4 if type=="pop" & rep==4
replace typerep = 5 if type=="pop" & rep==5
replace typerep = 6 if type=="pop" & rep==6
replace typerep = 7 if type=="res_isol" & rep==1
replace typerep = 8 if type=="res_isol" & rep==2
replace typerep = 9 if type=="res_isol" & rep==3
replace typerep = 10 if type=="res_isol" & rep==4
replace typerep = 11 if type=="res_isol" & rep==5
replace typerep = 12 if type=="res_isol" & rep==6

generate typerep2 = 1 if type=="pop" & rep==1
replace typerep2 = 2 if type=="pop" & rep==2
replace typerep2 = 3 if type=="pop" & rep==3
replace typerep2 = 4 if type=="pop" & rep==4
replace typerep2 = 5 if type=="pop" & rep==5
replace typerep2 = 6 if type=="pop" & rep==6
replace typerep2 = 7 if type=="res_isol" & rep==1 & spp=="E"
replace typerep2 = 8 if type=="res_isol" & rep==2 & spp=="E"
replace typerep2 = 9 if type=="res_isol" & rep==3 & spp=="E"
replace typerep2 = 10 if type=="res_isol" & rep==4 & spp=="E"
replace typerep2 = 11 if type=="res_isol" & rep==5 & spp=="E"
replace typerep2 = 12 if type=="res_isol" & rep==6 & spp=="E"
replace typerep2 = 13 if type=="res_isol" & rep==1 & spp=="S"
replace typerep2 = 14 if type=="res_isol" & rep==2 & spp=="S"
replace typerep2 = 15 if type=="res_isol" & rep==3 & spp=="S"
replace typerep2 = 16 if type=="res_isol" & rep==4 & spp=="S"
replace typerep2 = 17 if type=="res_isol" & rep==5 & spp=="S"
replace typerep2 = 18 if type=="res_isol" & rep==6 & spp=="S"



*Rif Emono
stripplot log2mic if ab=="Rif" & evol_condn=="Emono", over(repdummy) stack center vertical separate(typerep)  ///
title("Rifampicin, monoculture {it:E. coli}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gs2 gs8 gs4 gs10 gs6 gs12 blue bluishgray cyan eltblue midblue teal) ///
msymbol(circle circle circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population MIC" 4 "Reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "Isolate MIC" 10 "Reps 1-6)" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Rif Smono
stripplot log2mic if ab=="Rif" & evol_condn=="Smono", over(repdummy) stack center vertical separate(typerep)  ///
title("Rifampicin, monoculture {it:S. enterica}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gs2 gs8 gs4 gs10 gs6 gs12 blue bluishgray cyan eltblue midblue teal) ///
msymbol(circle circle circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population MIC" 4 "Reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "Isolate MIC" 10 "Reps 1-6)" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Rif Coop
stripplot log2mic if ab=="Rif" & (evol_condn=="Coop" | evol_condn=="Ecoop" | evol_condn=="Scoop"), over(repdummy) stack center vertical separate(typerep2) ///
title("Rifampicin, monoculture {it:S. enterica}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gs2 gs8 gs4 gs10 gs6 gs12 blue bluishgray cyan eltblue midblue teal) ///
msymbol(circle circle circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population MIC" 4 "Reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "Isolate MIC" 10 "Reps 1-6)" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

