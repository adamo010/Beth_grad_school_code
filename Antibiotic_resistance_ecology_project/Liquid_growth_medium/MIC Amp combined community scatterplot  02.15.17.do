*Amp graphs
twoway (scatter mic spp_num if spp_num==1, color (midblue)) ///
(scatter mic spp_num if spp_num==2, color(cranberry)) ///
(scatter mic spp_num if spp_num==3, color(green)) ///
(scatter mic spp_num if spp_num==4, color (gs6)) ///
(scatter mic spp_num if spp_num==5, color(purple)), ///
legend(off) ///
ytitle("MIC (ug/mL)", size(medium)) xtitle("Species", size(medium)) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(large))

