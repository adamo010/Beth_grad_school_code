*Tet graphs
twoway (scatter area spp_num if spp_num==1, color (midblue)) ///
(scatter area spp_num if spp_num==2, color(cranberry)) ///
(scatter area spp_num if spp_num==3, color(green)) ///
(scatter area spp_num if spp_num==4, color (gs6)) ///
(scatter area spp_num if spp_num==5, color(purple)), ///
legend(off) ///
ytitle("Area of clearing (mm^2)", size(medium)) xtitle("Species", size(medium)) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(large))

