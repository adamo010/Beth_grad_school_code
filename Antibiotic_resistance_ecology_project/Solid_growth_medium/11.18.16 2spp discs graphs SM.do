*EM
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="S"
replace spp_num =2 if spp=="M"
replace spp_num =3 if spp=="SM"
generate type =1 if spp=="S"
replace type =2 if spp=="M"
replace type =3 if spp=="SM"
***Graph
twoway (bar meanarea type if spp_num==1, color (cranberry)) ///
(bar meanarea type if spp_num==2, color(green)) ///
(bar meanarea type if spp_num==3, color(dark navy)) ///
(rcap hiarea loarea type, color(black)), ///
legend(order(1 "Sal" 2 "Mex" 3 "SM")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(1 " " 2 " " 3 " ", noticks) ///
title("SM verses monocultures") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
