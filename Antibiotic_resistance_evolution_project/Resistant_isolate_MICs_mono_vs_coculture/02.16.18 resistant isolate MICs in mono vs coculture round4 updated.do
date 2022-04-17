*No data, but here goes nothing
*variable names are: ab(Amp/Rif), ab_num(1/2), spp(E/S), spp_num(1/2) ///
*comm_type(Mono/Coop), comm_type_num(1/2), spptype(Emono/Ecoop/Smono/Scoop) ///
*spptype_num(1/2/3/4), rep(1-6)
*Seriously, will have to update these once we get more data

*stats
ranksum mic if(ab=="Rif" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum mic if(ab=="Rif" & (spptype_num==3 | spptype_num==4)), by(spptype)
ranksum mic if(ab=="Amp" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum mic if(ab=="Amp" & (spptype_num==3 | spptype_num==4)), by(spptype)

*Rif graph
stripplot mic if ab=="Rif", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
title("Rifampicin, resistant isolate MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
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
ylabel(0(25)150, labsize(medium)) yscale(range(0 150)) ///
text(145 1.5 "p=0.0207") text(145 3.5 "p=0.0158") 

*Amp graph
stripplot mic if ab=="Amp", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
title("Ampicillin, resistant isolate MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
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
ylabel(0(50)300, labsize(medium)) yscale(range(0 300)) ///
text(155 1.5 "p=0.0113") text(290 3.5 "p=0.2509") 



