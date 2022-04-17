clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\01.27.19 P10 Amp pop and isolate data.dta"

generate log2mic = ln(mic)/ln(2) 

generate repdummy = 1 if rep==1
replace repdummy = 4 if rep==2
replace repdummy = 7 if rep==3
replace repdummy = 10 if rep==4
replace repdummy = 13 if rep==5
replace repdummy = 16 if rep==6 

*For mono
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

*For coop
generate evol_binary = "mono" if (evol_condn=="Emono" | evol_condn=="Smono")
replace evol_binary = "coop" if (evol_condn=="Coop" | evol_condn=="Ecoop" | evol_condn=="Scoop")
generate evol_binary_num = 1 if evol_binary=="mono"
replace evol_binary_num = 2 if evol_binary=="coop"

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
stripplot log2mic if ab=="Rif" & evol_condn=="Emono", over(repdummy) stack center vertical separate(typerep) ///
title("Rifampicin, monoculture {it:E. coli}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "Rep 1" 4 "Rep 2" 7 "Rep 3" 10 "Rep 4" 13 "Rep 5" 16 "Rep 6", labsize(medsmall)) ///
mcolor(blue bluishgray cyan eltblue midblue teal blue bluishgray cyan eltblue midblue teal) ///
msymbol(triangle triangle triangle triangle triangle triangle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "BA010, {it:mdoH/ prc/ rpoB}" 2 "BA017, {it:rpoB}" 3 "BA030, {it:mdoG/ rpoB}" ///
4 "BA036, {it:glpA/ mdoG/ prc}" 5 "BA049, {it:mdoG/ rpoB}" 6 "BA056, {it:fre/ mdoH}" 7 "" 8 "" 9 "" 10 "" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) ///
note("*Triangles represent measured population MICs," "circles represent MICs of isolates from these populations", size(small))

*Rif Smono
stripplot log2mic if ab=="Rif" & evol_condn=="Smono", over(repdummy) stack center vertical separate(typerep)  ///
title("Rifampicin, monoculture {it:S. enterica}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gold yellow dkorange sandb orange_red orange gold yellow dkorange sandb orange_red orange) ///
msymbol(triangle triangle triangle triangle triangle triangle diamond diamond diamond diamond diamond diamond diamond) ///
msize(large large large large large large medlarge medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population MICs" 4 "Reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "Isolate MICs" 10 "Reps 1-6" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*Rif Coop
stripplot log2mic if ab=="Rif" & evol_binary=="coop", over(repdummy) stack center vertical separate(typerep2) ///
title("Rifampicin, co-culture, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(lime*0.7 dkgreen olive_teal midgreen mint eltgreen blue bluishgray cyan eltblue midblue teal ///
gold yellow dkorange sandb orange_red orange) ///
msymbol(triangle triangle triangle triangle triangle triangle circle circle circle circle circle circle ///
diamond diamond diamond diamond diamond diamond diamond) ///
msize(large large large large large large large large large large large large medlarge medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population" 4 "MICs: reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "{it: E. coli} isolate" 10 "MICs: reps 1-6" 11 "" 12 "" ///
13 "" 14 "" 15 "{it: S. enterica} isolate" 16 "MICs: reps 1-6" 17 "" 18 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

******************************************
*Amp Emono
stripplot log2mic if ab=="Amp" & evol_condn=="Emono", over(repdummy) stack center vertical separate(typerep) ///
title("Ampicillin, monoculture {it:E. coli}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(blue bluishgray cyan eltblue midblue teal blue bluishgray cyan eltblue midblue teal) ///
msymbol(triangle triangle triangle triangle triangle triangle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population MICs" 4 "Reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "Isolate MICs" 10 "Reps 1-6" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(-2(1)7, labsize(medium)) yscale(range(-2 7)) 

*Amp Smono
stripplot log2mic if ab=="Amp" & evol_condn=="Smono", over(repdummy) stack center vertical separate(typerep)  ///
title("Ampicillin, monoculture {it:S. enterica}, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gold yellow dkorange sandb orange_red orange gold yellow dkorange sandb orange_red orange) ///
msymbol(triangle triangle triangle triangle triangle triangle diamond diamond diamond diamond diamond diamond diamond) ///
msize(large large large large large large medlarge medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population MICs" 4 "Reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "Isolate MICs" 10 "Reps 1-6" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(-2(1)7, labsize(medium)) yscale(range(-2 7)) 

*Amp Coop
stripplot log2mic if ab=="Amp" & evol_binary=="coop", over(repdummy) stack center vertical separate(typerep2) ///
title("Ampicillin, co-culture, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(lime*0.7 dkgreen olive_teal midgreen mint eltgreen blue bluishgray cyan eltblue midblue teal ///
gold yellow dkorange sandb orange_red orange) ///
msymbol(triangle triangle triangle triangle triangle triangle circle circle circle circle circle circle ///
diamond diamond diamond diamond diamond diamond diamond) ///
msize(large large large large large large large large large large large large medlarge medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "" 2 "" 3 "Measured population" 4 "MICs: reps 1-6" 5 "" 6 "" 7 "" 8 "" 9 "{it: E. coli} isolate" 10 "MICs: reps 1-6" 11 "" 12 "" ///
13 "" 14 "" 15 "{it: S. enterica} isolate" 16 "MICs: reps 1-6" 17 "" 18 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#8, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)5, labsize(medium)) yscale(range(-3 5)) 


