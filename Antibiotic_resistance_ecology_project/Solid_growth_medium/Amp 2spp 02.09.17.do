*Preamble to alter data as necessary
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="S"
replace spp_num =2 if spp=="ES"
replace spp_num =3 if spp=="EM"
replace spp_num =4 if spp=="SM"
replace spp_num =5 if spp=="coop"
generate type =1 if spp=="S"
replace type =2 if spp=="ES"
replace type =3 if spp=="EM"
replace type =4 if spp=="SM"
replace type =5 if spp=="coop"
*Amp graphs
twoway (bar meanarea type if spp_num==1, color (cranberry)) ///
(bar meanarea type if spp_num==2, color(orange)) ///
(bar meanarea type if spp_num==3, color(navy8)) ///
(bar meanarea type if spp_num==4, color (olive teal)) ///
(bar meanarea type if spp_num==5, color(gray 6)) ///
(rcap hiarea loarea type, color(black)), ///
legend(colfirst rows(3) order(1 "{it:S. enterica}" 2 "{it:E. coli- S. enterica}" 3 "{it:E. coli- M. extorquens}" 4 "{it:S. enterica- M.extorquens}" 5 "Cooperative community")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(1 " " 2 " " 3 " " 4 " " 5 " ", noticks) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
