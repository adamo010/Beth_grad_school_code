twoway (scatter area spp_num if spp_num==1, color (cranberry)) ///
(scatter area spp_num if spp_num==2, color(orange)) ///
(scatter area spp_num if spp_num==3, color(navy8)) ///
(scatter area spp_num if spp_num==4, color (olive_teal)) ///
(scatter area spp_num if spp_num==5, color(gs6)), ///
legend(off) ///
ytitle("Area of clearing (mm^2)", size(medium)) xtitle("Species", size(medium)) ///
xlabel(1 "{it:S. enterica}" 2 `" "{it:E. coli-}" "{it:S. enterica}" "' 3 `" "{it:E. coli-}" "{it:M. extorquens}" "' 4 `" "{it:S. enterica-}" "{it:M.extorquens}" "' 5 `" "Cooperative" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(large))
