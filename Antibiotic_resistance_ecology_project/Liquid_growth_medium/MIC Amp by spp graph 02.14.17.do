*first, need to add a new variable that allows each spp/culture type combination to be a different value therefore colour
generate spptype =1 if spp=="E" & type=="mono"
replace spptype =2 if spp=="E" & type=="coop"
replace spptype =3 if spp=="E" & type=="comp"
replace spptype =4 if spp=="S" & type=="mono"
replace spptype =5 if spp=="S" & type=="coop"
replace spptype =6 if spp=="S" & type=="comp"
replace spptype =7 if spp=="M" & type=="mono"
replace spptype =8 if spp=="M" & type=="coop"
replace spptype =9 if spp=="M" & type=="comp"
*Now, can graph things appropriately
graph box mic, over(spptype) asyvars ///
box(1, color (midblue*0.8)) ///
box(2, color (midblue*0.5)) ///
box(3, color (midblue*0.2)) ///
box(4, color (cranberry*0.8)) ///
box(5, color (cranberry*0.5)) ///
box(6, color (cranberry*0.2)) ///
box(7, color (green*0.8)) ///
box(8, color (green*0.5)) ///
box(9, color (green*0.2)) ///
legend(colfirst rows(3) order(1 "E. monoculture" 2 "E. cooperative" 3 "E. competitive" 4 "S. monoculture" 5 "S. cooperative" 6 "S. competitive" 7 "M. monoculture" 8 "M. cooperative" 9 "M. competitive") ) ///
ytitle("Median MIC (ug/mL)") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
*have to change the colour of the outlier dot on E comp


