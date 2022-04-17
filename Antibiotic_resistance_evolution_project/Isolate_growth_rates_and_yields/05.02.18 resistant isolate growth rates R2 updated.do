*variable names are: ab(Rif/Amp), ab_num(1/2), spp(E/S), spp_num(1/2), comm_type (mono/coop/anc), comm_type_num(1/2/3),  ///
*spptype(Emono/Ecoop/Smono/Scoop), spptype_num(1/2/3/4), *rep(1-6ish), mic(some#), isolate_id,  ///
*mono_gr(#), mono_yield(#), coop_gr(#), coop_yield(#)

*Note that Eanc/Sanc do not have coculture GRs, and Coopanc does not have monoculture GR: because stata coding is weird

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*stats
ranksum mono_gr if(ab=="Rif" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum mono_gr if(ab=="Rif" & (spptype_num==3 | spptype_num==4)), by(spptype)
ranksum mono_gr if(ab=="Amp" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum mono_gr if(ab=="Amp" & (spptype_num==3 | spptype_num==4)), by(spptype)

*Rif mono GRs
stripplot mono_gr if ab=="Rif", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
title("Rifampicin, resistant isolate monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
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
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2)) ///
text(0.8 1.5 "p=0.0062") text(1.1 3.5 "p=0.0005") 

*Amp mono GRs
stripplot mono_gr if ab=="Amp", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
title("Ampicillin, resistant isolate monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rate", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
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
ylabel(0(0.2)1.4, labsize(medium)) yscale(range(0 1.4)) ///
text(0.8 1.5 "p=0.0003") text(1.0 3.5 "p=0.0001") 

*stats
ranksum coop_gr if(ab=="Rif" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum coop_gr if(ab=="Rif" & (spptype_num==3 | spptype_num==4)), by(spptype)
ranksum coop_gr if(ab=="Amp" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum coop_gr if(ab=="Amp" & (spptype_num==3 | spptype_num==4)), by(spptype)

*Rif mono GRs
stripplot coop_gr if ab=="Rif", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
title("Rifampicin, resistant isolate co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue purple cranberry green)  ///
msymbol(circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge ) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
legend(colfirst rows(2) order(2 "Co-culture-evolved {it:E. coli}" 3 "Co-culture-evolved {it:E. coli}" ///
4 "Co-culture-evolved {it:S. enterica}" 5 "Co-culture-evolved {it:S. enterica}") size(medsmall)) ///
xlabel(1.5 "{it:E. coli}" 3.5 "{it: S. enterica}", labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
xtitle("") ///
ylabel(0(0.1)0.8, labsize(medium)) yscale(range(0 0.8)) ///
text(0.6 1.5 "p=0.4384") text(0.65 3.5 "p=0.0515") 

*Amp mono GRs
stripplot coop_gr if ab=="Amp", over(spptype_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spptype_num) jitter(5 5 5 5) ///
title("Ampicillin, resistant isolate co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("Co-culture growth rate", size(medsmall)) xtitle("Species", size(medium) margin(vsmall)) ///
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
ylabel(0(0.1)0.9, labsize(medium)) yscale(range(0 0.9)) ///
text(0.75 1.5 "p=0.9685") text(0.87 3.5 "p=0.0013") 

