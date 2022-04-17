*Preamble to alter data as necessary
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="3xS"
replace spp_num =4 if spp=="M"
replace spp_num =5 if spp=="coop"
replace spp_num =6 if spp=="comp"
generate type =1 if spp=="E"
replace type =2 if spp=="S"
replace type =3 if spp=="3xS"
replace type =4 if spp=="M"
replace type =5 if spp=="coop"
replace type =6 if spp=="comp"
*Amp graphs
twoway (bar meanarea type if spp_num==1, color (midblue)) ///
(bar meanarea type if spp_num==2, color(cranberry)) ///
(bar meanarea type if spp_num==3, color(cranberry*0.2)) ///
(bar meanarea type if spp_num==4, color(green)) ///
(bar meanarea type if spp_num==5, color (gs6)) ///
(bar meanarea type if spp_num==6, color(purple)) ///
(rcap hiarea loarea type, color(black)), ///
legend(colfirst rows(3) order(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "3x {it:S. enterica}" 4 "{it:M. extorquens}" 5 "Cooperative community" 6 "Competitive community")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(1 " " 2 " " 3 " " 4 " " 5 " " 6 " ", noticks) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white))
