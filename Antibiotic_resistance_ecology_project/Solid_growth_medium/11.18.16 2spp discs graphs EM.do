*EM
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="M"
replace spp_num =3 if spp=="EM"
generate type =1 if spp=="E"
replace type =2 if spp=="M"
replace type =3 if spp=="EM"
***Graph
twoway (bar meanarea type if spp_num==1, color (midblue)) ///
(bar meanarea type if spp_num==2, color(green)) ///
(bar meanarea type if spp_num==3, color(stone)) ///
(rcap hiarea loarea type, color(black)), ///
legend(order(1 "Ecoli" 2 "Mex" 3 "EM")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
title("EM verses monocultures") ///
xlabel(1 " " 2 " " 3 " ", noticks) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
