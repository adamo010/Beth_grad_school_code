*use data from excel directly, but do it by ab only
*Preamble to alter data as necessary
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="S"
replace spp_num =2 if spp=="2S"
replace spp_num =3 if spp=="3S"
replace spp_num =4 if spp=="coop"
replace spp_num =5 if spp=="comp"
generate type =1 if spp=="S"
replace type =2 if spp=="2S"
replace type =3 if spp=="3S"
replace type =4 if spp=="coop"
replace type =5 if spp=="comp"
*Amp graphs
twoway (bar meanarea type if spp_num==1, color (cranberry)) ///
(bar meanarea type if spp_num==2, color(cranberry*.5)) ///
(bar meanarea type if spp_num==3, color(cranberry*.3)) ///
(bar meanarea type if spp_num==4, color(gs6)) ///
(bar meanarea type if spp_num==5, color(purple)) ///
(rcap hiarea loarea type, color(black)), ///
legend(order(1 "S. enterica" 2 "2x S. enterica" 3 "3x S. enterica" 4 "Cooperative community" 5 "Competitive community")) ///
legend(colfirst) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(, nolabel noticks) ///
ylabel(, angle(horizontal)) ///
title("Ampicillin area of clearing", color(black)) ///
graphregion(fcolor(white))
