*So this is going to be a clusterfuck

generate log2mic = ln(mic)/ln(2) 

*variable names are: ab(Amp/Rif), ab_num(1/2), evoltype (Emono/Smono/Coop), evoltype_num(1/2/3) ///
*rep(1-6), miclevel(pop/Eisol/Sisol), miclevel_num(1/2/3), mic(some num), isolatename

generate replev = rep*miclevel_num

generate repdummy = rep
replace repdummy = 16 if rep==6
replace repdummy = 13 if rep==5
replace repdummy = 10 if rep==4
replace repdummy = 7 if rep==3
replace repdummy = 4 if rep==2

*Rif Emono
stripplot log2mic if ab=="Rif" & evoltype=="Emono", over(repdummy) stack center vertical separate(miclevel)  ///
title("Rifampicin, Monoculture {it:E. coli}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midblue midgreen) msymbol(circle circle) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(1 "Isolates MIC" 2 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Rif Smono
stripplot log2mic if ab=="Rif" & evoltype=="Smono", over(repdummy) stack center vertical separate(miclevel) ///
title("Rifampicin, Monoculture {it:S. enterica}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(cranberry midgreen) msymbol(circle circle) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(1 "Isolates MIC" 2 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 


*Rif Coop
stripplot log2mic if ab=="Rif" & evoltype=="Coop", over(repdummy) stack center vertical separate(miclevel) ///
title("Rifampicin, co-culture, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midblue cranberry midgreen) msymbol(circle circle circle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin vthin) ///
legend(nocolfirst rows(1) order(1 "{it: E.coli} Isolates MIC" 2 "{it: S. enterica} isolates MIC" 3 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Emono
stripplot log2mic if ab=="Amp" & evoltype=="Emono", over(repdummy) stack center vertical separate(miclevel)  ///
title("Ampicillin, Monoculture {it:E. coli}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midblue midgreen) msymbol(circle circle) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(1 "Isolates MIC" 2 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Smono
stripplot log2mic if ab=="Amp" & evoltype=="Smono", over(repdummy) stack center vertical separate(miclevel) ///
title("Ampicillin, Monoculture {it:S. enterica}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(cranberry midgreen) msymbol(circle circle) msize(large large) ///
mlcolor(black black) mlwidth(vthin vthin) ///
legend(nocolfirst rows(1) order(1 "Isolates MIC" 2 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 


*Amp Coop
stripplot log2mic if ab=="Amp" & evoltype=="Coop", over(repdummy) stack center vertical separate(miclevel) ///
title("Ampicillin, co-culture, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(midblue cranberry midgreen) msymbol(circle circle circle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin vthin) ///
legend(nocolfirst rows(1) order(1 "{it: E.coli} Isolates MIC" 2 "{it: S. enterica} isolates MIC" 3 "P20 population MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 
