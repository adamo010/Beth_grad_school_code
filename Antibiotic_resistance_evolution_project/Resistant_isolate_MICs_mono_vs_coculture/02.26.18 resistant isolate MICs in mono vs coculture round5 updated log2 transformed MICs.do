*variable names are: ab(Amp/Rif), ab_num(1/2), spp(E/S), spp_num(1/2) ///
*comm_type(Mono/Coop), comm_type_num(1/2), spptype(Emono/Ecoop/Smono/Scoop) ///
*spptype_num(1/2/3/4), rep(1-6)

*also, try this: since making log2-based yaxes is apparently impossible, just log-transform MIC data
generate log2mic = ln(mic)/ln(2) 
*don't ask me, this looks weird but whatever, it matches excel

*stats
ranksum log2mic if(ab=="Rif" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum log2mic if(ab=="Rif" & (spptype_num==3 | spptype_num==4)), by(spptype)
ranksum log2mic if(ab=="Amp" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum log2mic if(ab=="Amp" & (spptype_num==3 | spptype_num==4)), by(spptype)
*well, stats are identical to non-transformed data, which is reassuring I guess? Good thing, I have no idea how to interpret p-values for 
*log2-transformed data.

*Rif graph
stripplot log2mic if ab=="Rif", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
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
text(8 1.5 "p=0.0036") text(8 3.5 "p=0.1762") 

*Amp graph
stripplot log2mic if ab=="Amp", over(spptype_num) stack center vertical refline(lwidth(0.4) ///
lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
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
text(8 1.5 "p=0.0021") text(9 3.5 "p=0.2144") 



