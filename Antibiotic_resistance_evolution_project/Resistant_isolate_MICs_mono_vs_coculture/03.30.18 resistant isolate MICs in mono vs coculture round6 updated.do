*Redone all the metadata coding to avoid stuff fucking up again
*variable names are: isolateid, ab(Rif/Amp)***, ab_num(1/2), commtype(Emono/Ecoop/Smono/Scoop), ///
*commtype_num(1/2/3/4), evol_condn (mono/coop), evol_condn_num(1/2), spp(E/S), spp_num(1/2), ///
*rep(1-6), isolate_num(1-3), mic(some#)
*data is whatever the latest MIC round is (5, on 2/28/18)- with revised metadata

*also, try this: since making log2-based yaxes is apparently impossible, just log-transform MIC data
generate log2mic = ln(mic)/ln(2) 
*don't ask me, this looks weird but whatever, it matches excel

*stats
ranksum log2mic if(ab=="Rif" & (commtype_num==1 | commtype_num==2)), by(commtype)
ranksum log2mic if(ab=="Rif" & (commtype_num==3 | commtype_num==4)), by(commtype)
ranksum log2mic if(ab=="Amp" & (commtype_num==1 | commtype_num==2)), by(commtype)
ranksum log2mic if(ab=="Amp" & (commtype_num==3 | commtype_num==4)), by(commtype)
*well, stats are identical to non-transformed data, which is reassuring I guess? Good thing, I have no idea how to interpret p-values for 
*log2-transformed data.

*Rif graph
stripplot log2mic if ab=="Rif", over(commtype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(commtype_num) jitter(5 5 5 5) ///
title("Rifampicin, resistant isolate MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue purple cranberry green)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge ) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}" ///
4 "Monoculture-evolved {it:S. enterica}" 5 "Co-culture-evolved {it:S. enterica}") size(medsmall)) ///
xlabel(1.5 "{it:E. coli}" 3.5 "{it: S. enterica}", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) ///
text(8 1.5 "p=0.0162") text(8.7 3.5 "p=0.0072") 

*Amp graph
stripplot log2mic if ab=="Amp", over(commtype_num) stack center vertical refline(lwidth(0.4) ///
lcolor(black)) reflevel(median) separate(commtype_num) jitter(5 5 5 5) ///
title("Ampicillin, resistant isolate MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue purple cranberry green)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge ) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Monoculture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}" ///
4 "Monoculture-evolved {it:S. enterica}" 5 "Co-culture-evolved {it:S. enterica}") size(medsmall)) ///
xlabel(1.5 "{it:E. coli}" 3.5 "{it: S. enterica}", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#11, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(1)10, labsize(medium)) yscale(range(0 10)) ///
text(8 1.5 "p=0.0002") text(9.5 3.5 "p=0.0363") 
