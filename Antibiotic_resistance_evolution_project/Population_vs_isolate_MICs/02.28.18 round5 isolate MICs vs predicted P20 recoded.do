*Redone all the metadata coding to avoid stuff fucking up again
*variable names are: *isolateid, ab(Rif/Amp), ab_num(1/2), commtype(Emono/Ecoop/Smono/Scoop/Coop), ///
*commtype_num(1/2/3/4/5), evol_condn (mono/coop), evol_condn_num(1/2), spp(E/S), spp_num(1/2), ///
*rep(1-6), isolate_num(1-3), mic(some#), miclevel(Pop/Eisol/Sisol), miclevel_num (1/2/3)
*data is whatever the latest MIC round is (5, on 2/28/18)- with revised metadata

generate log2mic = ln(mic)/ln(2) 

generate replev = rep*miclevel_num

generate repdummy = 1 if rep==1
replace repdummy = 4 if rep==2
replace repdummy = 7 if rep==3
replace repdummy = 10 if rep==4
replace repdummy = 13 if rep==5
replace repdummy = 16 if rep==6

*Rif Emono
stripplot log2mic if ab=="Rif" & commtype=="Emono", over(repdummy) stack center vertical separate(miclevel_num)  ///
title("Rifampicin, Monoculture {it:E. coli}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midgreen midblue) msymbol(circle square) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(2 "Isolates MIC" 1 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Rif Smono
stripplot log2mic if ab=="Rif" & commtype=="Smono", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Rifampicin, Monoculture {it:S. enterica}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midgreen cranberry) msymbol(circle triangle) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(2 "Isolates MIC" 1 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*Rif Coop
stripplot log2mic if ab=="Rif" & evol_condn=="coop", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Rifampicin, co-culture, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midgreen midblue cranberry) msymbol(circle square triangle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin vthin) ///
legend(nocolfirst rows(1) order(1 "P20 population MIC" 2 "{it: E.coli} Isolates MIC" 3 "{it: S. enterica} isolates MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Emono
stripplot log2mic if ab=="Amp" & commtype=="Emono", over(repdummy) stack center vertical separate(miclevel_num)  ///
title("Ampicillin, Monoculture {it:E. coli}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midgreen midblue) msymbol(circle square) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(2 "Isolates MIC" 1 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Smono
stripplot log2mic if ab=="Amp" & commtype=="Smono", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Ampicillin, Monoculture {it:S. enterica}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midgreen cranberry) msymbol(circle triangle) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(2 "Isolates MIC" 1 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*Amp Coop
stripplot log2mic if ab=="Amp" & evol_condn=="coop", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Ampicillin, co-culture, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midgreen midblue cranberry) msymbol(circle square triangle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin vthin) ///
legend(nocolfirst rows(1) order(1 "P20 population MIC" 2 "{it: E.coli} Isolates MIC" 3 "{it: S. enterica} isolates MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#11, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)10, labsize(medium)) yscale(range(0 10)) 

