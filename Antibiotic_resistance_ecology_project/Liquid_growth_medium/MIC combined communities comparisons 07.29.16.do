*This makes a box-and-whisker plot of MIC data with communities combined
*Associated dataset: MIC combined community comparisons 07.29.16.dta
*Can do both Amp and Tet in the same dataset

*Amp
graph box mic if ab=="amp", over(spp_num) asyvars ///
legend(order(1 "E. coli" 2 "S. enterica" 3 "M. extorquens" 4 "Cooperative community" 5 "Competitive community")) ///
legend(nocolfirst) ///
box(1, color(midblue)) box(2, color(cranberry)) box(3, color(green)) box(4, color(gs6)) box(5, color(purple)) ///
ytitle("MIC (ng/uL)") ///
title("Ampicillin MIC", color(black)) ///
graphregion(fcolor(white))

*Tet
graph box mic if ab=="tet", over(spp_num) asyvars ///
legend(order(1 "E. coli" 2 "S. enterica" 3 "M. extorquens" 4 "Cooperative community" 5 "Competitive community")) ///
legend(nocolfirst) ///
box(1, color(midblue)) box(2, color(cranberry)) box(3, color(green)) box(4, color(gs6)) box(5, color(purple)) ///
ytitle("MIC (ng/uL)") ///
title("Tetracycline MIC", color(black)) ///
graphregion(fcolor(white))
