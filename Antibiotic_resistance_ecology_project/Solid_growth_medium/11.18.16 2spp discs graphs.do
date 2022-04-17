*use data from excel directly, but do it by ab only
*Preamble to alter data as necessary
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
replace spp_num =4 if spp=="coop"
replace spp_num =5 if spp=="comp"
replace spp_num =6 if spp=="ES"
replace spp_num =7 if spp=="SM"
replace spp_num =8 if spp=="EM"
generate type =1 if spp=="E"
replace type =2 if spp=="S"
replace type =3 if spp=="M"
replace type =4 if spp=="coop"
replace type =5 if spp=="comp"
replace type =6 if spp=="ES"
replace type =7 if spp=="SM"
replace type =8 if spp=="EM"
*All spp
twoway (bar meanarea type if spp_num==1, color (midblue)) ///
(bar meanarea type if spp_num==2, color(cranberry)) ///
(bar meanarea type if spp_num==3, color(green)) ///
(bar meanarea type if spp_num==4, color (gs6)) ///
(bar meanarea type if spp_num==5, color(purple)) ///
(bar meanarea type if spp_num==6, color(orange)) ///
(bar meanarea type if spp_num==7, color(dark navy)) ///
(bar meanarea type if spp_num==8, color(stone)) ///
(rcap hiarea loarea type, color(black)), ///
legend(order(1 "Ec" 2 "Sal" 3 "Mex" 4 "Coop" 5 "Comp" 6 "ES" 7 "SM" 8 "EM")) ///
legend(rows(3)) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(1 " " 2 " " 3 " " 4 " " 5 " " 6 " " 7 " " 8 " ", noticks) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
