****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono abfree: blue*0.5 bluishgray*0.5 cyan*0.5 eltblue*0.5 midblue*0.5 teal*0.5
*Emono res: blue bluishgray cyan eltblue midblue teal
*Smono abfree: cranberry*0.5 pink*0.25 maroon*0.5 red*0.5 magenta*0.5 erose*0.5 
*Smono res: cranberry pink*0.5 maroon red magenta erose 
*Coop abfree: lime*0.35 dkgreen*0.5 olive_teal*0.5 midgreen*0.5 mint*0.5 eltgreen*0.5
*Coop res: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

generate dumb_shit = 1 if type=="anc" & evol_condn=="Eanc"
replace dumb_shit = 2 if type=="abfree_isol" & evol_condn=="Emono"
replace dumb_shit = 3 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 4 if type=="abfree_isol" & evol_condn=="Ecoop"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 6 if type=="anc" & evol_condn=="Coopanc"
replace dumb_shit = 7 if type=="anc" & evol_condn=="Sanc"
replace dumb_shit = 8 if type=="abfree_isol" & evol_condn=="Smono"
replace dumb_shit = 9 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 10 if type=="abfree_isol" & evol_condn=="Scoop"
replace dumb_shit = 11 if type=="res_isol" & evol_condn=="Scoop"

generate log2mic = ln(mic)/ln(2) 

*************************
*Rifampicin growth rates
*************************

*Rif Ecoli monoculture vs coculture with reps: monoculture growth rates
graph twoway (lfit mono_gr log2mic if dumb_shit==1 & ab=="Rif", color(black)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==2 & ab=="Rif", color(midblue*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==1, color(blue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==2, color(bluishgray*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==3, color(cyan*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==4, color(eltblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==5, color(midblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==6, color(teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==3 & ab=="Rif", color(midblue)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==4 & ab=="Rif", color(midgreen*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Rif", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==3, color(olive_teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==5 & ab=="Rif", color(midgreen)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==3, color(olive_teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Rifampicin, isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0))

*Rif Ecoli monoculture vs coculture with reps: coculture growth rates
graph twoway (lfit coop_gr log2mic if dumb_shit==6 & ab=="Rif", color(black)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==2 & ab=="Rif", color(midblue*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==1, color(blue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==2, color(bluishgray*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==3, color(cyan*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==4, color(eltblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==5, color(midblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Rif" & rep==6, color(teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==3 & ab=="Rif", color(midblue)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Rif" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==4 & ab=="Rif", color(midgreen*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Rif", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==3, color(olive_teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Rif" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==5 & ab=="Rif", color(midgreen)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Rif", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==3, color(olive_teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Rif" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Rifampicin, isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0))

*Rif Sal monoculture vs coculture with reps: monoculture growth rates
graph twoway (lfit mono_gr log2mic if dumb_shit==7 & ab=="Rif", color(black)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==8 & ab=="Rif", color(magenta*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==1, color(cranberry*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==2, color(pink*0.25) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==3, color(maroon*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==4, color(red*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==5, color(magenta*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==6, color(erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==9 & ab=="Rif", color(magenta)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==10 & ab=="Rif", color(midgreen*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Rif", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==3, color(olive_erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==11 & ab=="Rif", color(midgreen)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==3, color(olive_erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Rifampicin, isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0))

*Rif Sal monoculture vs coculture with reps: co-culture growth rates
graph twoway (lfit coop_gr log2mic if dumb_shit==6 & ab=="Rif", color(black)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Rif" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==8 & ab=="Rif", color(magenta*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==1, color(cranberry*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==2, color(pink*0.25) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==3, color(maroon*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==4, color(red*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==5, color(magenta*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Rif" & rep==6, color(erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==9 & ab=="Rif", color(magenta)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Rif" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==10 & ab=="Rif", color(midgreen*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Rif", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==3, color(olive_erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Rif" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==11 & ab=="Rif", color(midgreen)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Rif", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==3, color(olive_erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Rif" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Rifampicin, isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0))

*************************
*Ampicillin growth rates
*************************

*Amp Ecoli monoculture vs coculture with reps: monoculture growth rates
graph twoway (lfit mono_gr log2mic if dumb_shit==1 & ab=="Amp", color(black)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==1 & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==2 & ab=="Amp", color(midblue*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==1, color(blue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==2, color(bluishgray*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==3, color(cyan*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==4, color(eltblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==5, color(midblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==6, color(teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==3 & ab=="Amp", color(midblue)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==4 & ab=="Amp", color(midgreen*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Amp", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==3, color(olive_teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==5 & ab=="Amp", color(midgreen)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Amp", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==3, color(olive_teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Ampicillin, isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1.4, labsize(medium)) yscale(range(0 1.4))

*Amp Ecoli monoculture vs coculture with reps: coculture growth rates
graph twoway (lfit coop_gr log2mic if dumb_shit==6 & ab=="Amp", color(black)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==2 & ab=="Amp", color(midblue*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==1, color(blue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==2, color(bluishgray*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==3, color(cyan*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==4, color(eltblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==5, color(midblue*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==2 & ab=="Amp" & rep==6, color(teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==3 & ab=="Amp", color(midblue)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==1, color(blue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==2, color(bluishgray) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==3, color(cyan) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==4, color(eltblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==5, color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==3 & ab=="Amp" & rep==6, color(teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==4 & ab=="Amp", color(midgreen*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Amp", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==3, color(olive_teal*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==4 & ab=="Amp" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==5 & ab=="Amp", color(midgreen)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Amp", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==3, color(olive_teal) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==5 & ab=="Amp" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Ampicillin, isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0))

*Amp Sal monoculture vs coculture with reps: monoculture growth rates
graph twoway (lfit mono_gr log2mic if dumb_shit==7 & ab=="Amp", color(black)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==7 & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==8 & ab=="Amp", color(magenta*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==1, color(cranberry*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==2, color(pink*0.25) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==3, color(maroon*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==4, color(red*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==5, color(magenta*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==6, color(erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==9 & ab=="Amp", color(magenta)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==10 & ab=="Amp", color(midgreen*0.5)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Amp", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==3, color(olive_erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr log2mic if dumb_shit==11 & ab=="Amp", color(midgreen)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Amp", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==3, color(olive_erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter mono_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Ampicillin, isolate log2MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2))

*Amp Sal monoculture vs coculture with reps: co-culture growth rates
graph twoway (lfit coop_gr log2mic if dumb_shit==6 & ab=="Amp", color(black)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==1, color(gs2) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==2, color(gs8) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==3, color(gs4) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==4, color(gs10) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==5, color(gs6) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==6 & ab=="Amp" & rep==6, color(gs12) msymbol(square) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==8 & ab=="Amp", color(magenta*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==1, color(cranberry*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==2, color(pink*0.25) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==3, color(maroon*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==4, color(red*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==5, color(magenta*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==8 & ab=="Amp" & rep==6, color(erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==9 & ab=="Amp", color(magenta)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==1, color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==2, color(pink*0.5) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==3, color(maroon) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==4, color(red) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==5, color(magenta) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==9 & ab=="Amp" & rep==6, color(erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==10 & ab=="Amp", color(midgreen*0.5)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Amp", color(lime*0.35) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==2, color(dkgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==3, color(olive_erose*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==4, color(midgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==5, color(mint*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==10 & ab=="Amp" & rep==6, color(eltgreen*0.5) msymbol(triangle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr log2mic if dumb_shit==11 & ab=="Amp", color(midgreen)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Amp", color(lime*0.7) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==2, color(dkgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==3, color(olive_erose) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==4, color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==5, color(mint) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter coop_gr log2mic if dumb_shit==11 & ab=="Amp" & rep==6, color(eltgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Ampicillin, isolate log2MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("log{subscript:2}[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(5) order(1 "Ancestral" 2 "" 3 "" 4 "" 5 "" 6 "" 7 "" ///
8 "Mono.-evolved, Ab-free" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" ///
15 "Mono.-evolved, Resistant" 16 "Rep1" 17 "Rep2" 18 "Rep3" 19 "Rep4" 20 "Rep5" 21 "Rep6" ///
22 "Coop.-evolved, Ab-free" 23 "" 24 "" 25 "" 26 "" 27 "" 28 "" ///
29 "Coop.-evolved, Resistant" 30 "" 31 "" 32 "" 33 "" 34 "" 35 "") size(small) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0))
