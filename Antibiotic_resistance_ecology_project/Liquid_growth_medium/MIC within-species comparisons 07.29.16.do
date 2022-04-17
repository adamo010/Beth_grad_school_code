*This makes a box-and-whisker plot of MIC data, where community types are compared within species groupings (i.e. 'by spp')
*Associated dataset: Updated disc diffusion data 07.18.16.dta
*Can do both Amp and Tet in the same dataset
*Run this first- it's the only way to get good colours
generate typespp =1 if spp=="E" & type=="mono"
replace typespp =2 if spp=="E" & type=="coop"
replace typespp =3 if spp=="E" & type=="comp"
replace typespp =4 if spp=="S" & type=="mono"
replace typespp =5 if spp=="S" & type=="coop"
replace typespp =6 if spp=="S" & type=="comp"
replace typespp =7 if spp=="M" & type=="mono"
replace typespp =8 if spp=="M" & type=="coop"
replace typespp =9 if spp=="M" & type=="comp"

*These graphs are crap- how the fuck do you get rid of white space between spp here I don't fucking know and i've already spent two days on this so fuck it all.

*Amp graph
graph box mic if ab=="amp", over(typespp) over(spp, sort(spp_num) gap(0.2)) asyvars ///
legend(colfirst rows(3) order(1 "E. monoculture" 2 "E. cooperative" 3 "E. competitive" 4 "S. monoculture" 5 "S. cooperative" 6 "S. competitive" 7 "M. monoculture" 8 "M. cooperative" 9 "M. competitive") ) ///
box(1, color(midblue*.8)) box(2, color(midblue*.5)) box(3, color(midblue*.2)) ///
box(4, color(cranberry*.8)) box(5, color(cranberry*.5)) box(6, color(cranberry*.2)) ///
box(7, color(green*.8)) box(8, color(green*.5)) box(9, color(green*.2)) ///
ytitle("MIC (ng/uL)") ///
title("Ampicillin MIC, by species", color(black)) ///
graphregion(fcolor(white) margin(vsmall))

*Tet graph
graph box mic if ab=="tet", over(typespp) over(spp, sort(spp_num) gap(0.2)) asyvars ///
legend(colfirst rows(3) order(1 "E. monoculture" 2 "E. cooperative" 3 "E. competitive" 4 "S. monoculture" 5 "S. cooperative" 6 "S. competitive" 7 "M. monoculture" 8 "M. cooperative" 9 "M. competitive") ) ///
box(1, color(midblue*.8)) box(2, color(midblue*.5)) box(3, color(midblue*.2)) ///
box(4, color(cranberry*.8)) box(5, color(cranberry*.5)) box(6, color(cranberry*.2)) ///
box(7, color(green*.8)) box(8, color(green*.5)) box(9, color(green*.2)) ///
ytitle("MIC (ng/uL)") ///
title("Tetracycline MIC, by species", color(black)) ///
graphregion(fcolor(white) margin(vsmall))




