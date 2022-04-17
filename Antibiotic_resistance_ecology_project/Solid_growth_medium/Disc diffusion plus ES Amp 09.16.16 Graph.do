*use data from excel directly, but do it by ab only
*Preamble to alter data as necessary
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="coop"
replace spp_num =4 if spp=="ES"
generate type =1 if spp=="E"
replace type =2 if spp=="S"
replace type =3 if spp=="coop"
replace type =4 if spp=="ES"
*Amp graphs
twoway (bar meanarea type if spp_num==1, color (midblue)) ///
(bar meanarea type if spp_num==2, color(cranberry)) ///
(bar meanarea type if spp_num==3, color (orange)) ///
(bar meanarea type if spp_num==4, color(gs6)) ///
(rcap hiarea loarea type, color(black)), ///
yscale(log) ///
legend(order(1 "E. coli" 2 "S. enterica" 3 "E. coli- S. enterica" 4 "Cooperative community")) ///
legend(colfirst) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
title("Ampicillin", color(black)) ///
graphregion(fcolor(white))
