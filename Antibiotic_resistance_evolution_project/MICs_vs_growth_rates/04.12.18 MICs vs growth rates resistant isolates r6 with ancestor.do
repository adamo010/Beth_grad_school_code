*Unclear what ancestral data is going to tell us about anything except add more confusion, but boss wants it, so here we go.

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\MICs vs growth rates\04.12.18 MICs vs growth rates resistant isolates r6 with ancestor.dta" 

*variable names are: ab(Rif/Amp), ab_num(1/2), spp(E/S), spp_num(1/2), comm_type (mono/coop/anc), comm_type_num(1/2/3),  ///
*spptype(Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc), spptype_num(1/2/3/4/5/6/7), *rep(1-6ish), mic(some#), isolate_id,  ///
*mono_gr(#), mono_yield(#), coop_gr(#), coop_yield(#)

*Note that Eanc/Sanc do not have coculture GRs, and Coopanc does not have monoculture GR: because stata coding is weird

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

generate log2mic = ln(mic)/ln(2) 

*************************
*Monoculture growth rates
*************************

*Rif Ecoli monoculture vs coculture with reps
graph twoway (lfit mono_gr log2mic if spptype=="Emono" & ab=="Rif", color(midblue)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(midgreen)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Eanc" & ab=="Rif", color(black)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Rifampicin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.8, labsize(medium)) yscale(range(0 0.8))

*Rif Sal monoculture vs coculture with reps
graph twoway (lfit mono_gr log2mic if spptype=="Smono" & ab=="Rif", color(cranberry)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Scoop" & ab=="Rif", color(green)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Sanc" & ab=="Rif", color(black)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Rifampicin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1, labsize(medium)) yscale(range(0 1))

*Amp Ecoli monoculture vs coculture with
graph twoway (lfit mono_gr log2mic if spptype=="Emono" & ab=="Amp", color(midblue)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(midgreen)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Eanc" & ab=="Amp", color(black)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Eanc" & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Ampicillin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1.4, labsize(medium)) yscale(range(0 1.4))

*Amp Sal monoculture vs coculture ignore reps
graph twoway (lfit mono_gr log2mic if spptype=="Smono" & ab=="Amp", color(cranberry)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Scoop" & ab=="Amp", color(green)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if spptype=="Sanc" & ab=="Amp", color(black)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if spptype=="Sanc" & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Ampicillin, resistant isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2))

***********************
*Coculture growth rates
***********************

*Rif Ecoli monoculture vs coculture ignore reps
graph twoway (lfit coop_gr log2mic if spptype=="Emono" & ab=="Rif", color(midblue)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Rif" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(midgreen)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Rif" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Coopanc" & ab=="Rif", color(black)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Rifampicin, resistant isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.6, labsize(medium)) yscale(range(0 0.6))


*Rif Sal monoculture vs coculture ignore reps
graph twoway (lfit coop_gr log2mic if spptype=="Smono" & ab=="Rif", color(cranberry)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Rif" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Scoop" & ab=="Rif", color(green)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Rif" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Coopanc" & ab=="Rif", color(black)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Rifampicin, resistant isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.6, labsize(medium)) yscale(range(0 0.6))

*Amp Ecoli monoculture vs coculture ignore reps
graph twoway (lfit coop_gr log2mic if spptype=="Emono" & ab=="Amp", color(midblue)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Emono" & ab=="Amp" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(midgreen)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Ecoop" & ab=="Amp" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Coopanc" & ab=="Amp", color(black)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Ampicillin, resistant isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7))


*Amp Sal monoculture vs coculture ignore reps
graph twoway (lfit coop_gr log2mic if spptype=="Smono" & ab=="Amp", color(cranberry)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Smono" & ab=="Amp" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Scoop" & ab=="Amp", color(green)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp", color(lime*0.7) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==2, color(dkgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==3, color(olive_teal) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==4, color(midgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==5, color(mint) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Scoop" & ab=="Amp" & rep==6, color(eltgreen) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if spptype=="Coopanc" & ab=="Amp", color(black)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if spptype=="Coopanc" & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Ampicillin, resistant isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log2[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Mono.-evolved" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Coop.-evolved" 9 "Rep1" 10 "Rep2" 11 "Rep3" 12 "Rep4" 13 "Rep5" 14 "Rep6" ///
15 "Ancestral" 16 "" 17 "" 18 "" 19 "" 20 "" 21 "") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7))
