*3 vs 2 spp
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="ES"
replace spp_num =2 if spp=="SM"
replace spp_num =3 if spp=="EM"
replace spp_num =4 if spp=="coop"
generate type =1 if spp=="ES"
replace type =2 if spp=="SM"
replace type =3 if spp=="EM"
replace type =4 if spp=="coop"
*All spp
twoway (bar meanarea type if spp_num==1, color (orange)) ///
(bar meanarea type if spp_num==2, color(dark navy)) ///
(bar meanarea type if spp_num==3, color(stone)) ///
(bar meanarea type if spp_num==4, color (gs6)) ///
(rcap hiarea loarea type, color(black)), ///
legend(order(1 "ES" 2 "SM" 3 "EM" 4 "Coop")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(1 " " 2 " " 3 " " 4 " ", noticks) ///
title("Two vs. three species") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
