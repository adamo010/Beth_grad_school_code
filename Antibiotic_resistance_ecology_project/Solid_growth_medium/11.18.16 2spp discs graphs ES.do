*ES
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="ES"
generate type =1 if spp=="E"
replace type =2 if spp=="S"
replace type =3 if spp=="ES"
***Graph
twoway (bar meanarea type if spp_num==1, color (midblue)) ///
(bar meanarea type if spp_num==2, color(cranberry)) ///
(bar meanarea type if spp_num==3, color(orange)) ///
(rcap hiarea loarea type, color(black)), ///
legend(order(1 "Ecoli" 2 "Sal" 3 "ES")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
title("ES verses monocultures") ///
xlabel(1 " " 2 " " 3 " ", noticks) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
