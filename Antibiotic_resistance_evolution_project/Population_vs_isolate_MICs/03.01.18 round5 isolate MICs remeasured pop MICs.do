*Redone all the metadata coding to avoid stuff fucking up again
*variable names are: *isolateid, ab(Rif/Amp), ab_num(1/2), commtype(Emono/Ecoop/Smono/Scoop/Coop), ///
*commtype_num(1/2/3/4/5), evol_condn (mono/coop), evol_condn_num(1/2), spp(E/S/Pred_pop,Meas_pop), spp_num(1/2/3/4), ///
*rep(1-6), isolate_num(1-3), mic(some#), miclevel(Pred_pop/Meas_pop/Eisol/Sisol), miclevel_num (1/2/3/4)

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
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(navy ebg midblue) msymbol(circle circle circle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(nocolfirst rows(2) order(1 "Predicted MIC from P20 plate" 2 "Measured population MIC" 3 "Isolate MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Rif Smono
stripplot log2mic if ab=="Rif" & commtype=="Smono", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Rifampicin, Monoculture {it:S. enterica}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(erose magenta cranberry) msymbol(circle circle circle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(nocolfirst rows(2) order(1 "Predicted MIC from P20 plate" 2 "Measured population MIC" 3 "Isolate MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*Rif Coop
stripplot log2mic if ab=="Rif" & evol_condn=="coop", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Rifampicin, Co-culture, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(eltgreen mint midblue cranberry) msymbol(circle circle circle circle) msize(large large large large) ///
mlcolor(black black black black) mlwidth(vthin vthin vthin vthin) ///
legend(nocolfirst rows(2) order(1 "Predicted MIC from P20 plate" 2 "Measured population MIC" 3 "{it: E.coli} Isolates MIC" 4 "{it: S. enterica} isolates MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Emono
stripplot log2mic if ab=="Amp" & commtype=="Emono", over(repdummy) stack center vertical separate(miclevel_num)  ///
title("Ampicillin, Monoculture {it:E. coli}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(navy ebg midblue) msymbol(circle circle circle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(nocolfirst rows(2) order(1 "Predicted MIC from P20 plate" 2 "Measured population MIC" 3 "Isolate MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Smono
stripplot log2mic if ab=="Amp" & commtype=="Smono", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Ampicillin, Monoculture {it:S. enterica}, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(erose magenta cranberry) msymbol(circle circle circle) msize(large large large) ///
mlcolor(black black black) mlwidth(vthin vthin vthin) ///
legend(nocolfirst rows(2) order(1 "Predicted MIC from P20 plate" 2 "Measured population MIC" 3 "Isolate MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*Amp Coop
stripplot log2mic if ab=="Amp" & evol_condn=="coop", over(repdummy) stack center vertical separate(miclevel_num) ///
title("Ampicillin, Co-culture, isolates vs. population", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(eltgreen mint midblue cranberry) msymbol(circle circle circle circle) msize(large large large large) ///
mlcolor(black black black black) mlwidth(vthin vthin vthin vthin) ///
legend(nocolfirst rows(2) order(1 "Predicted MIC from P20 plate" 2 "Measured population MIC" 3 "{it: E.coli} Isolates MIC" 4 "{it: S. enterica} isolates MIC") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#11, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)10, labsize(medium)) yscale(range(0 10)) 
