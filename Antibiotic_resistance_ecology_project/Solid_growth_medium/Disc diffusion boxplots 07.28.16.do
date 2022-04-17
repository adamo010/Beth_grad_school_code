*This makes a box-and-whisker plot of disc diffusion data
*Associated dataset: Updated disc diffusion data 07.18.16.dta
*Can do both Amp and Tet in the same dataset

graph box area if ab=="amp", over(spp_num) asyvars ///
legend(order(1 "E. coli" 2 "S. enterica" 3 "M. extorquens" 4 "Cooperative community" 5 "Competitive community")) ///
legend(nocolfirst) ///
ytitle("Average area of clearing (mm^2)") ///
title("Ampicillin", color(black)) ///
box(1, color(midblue)) box(2, color(cranberry)) box(3, color(green)) box(4, color(gs6)) box(5, color(purple)) ///
graphregion(fcolor(white)) ///

*Paste in a seperate window to run
graph box area if ab=="tet", over(spp_num) asyvars ///
legend(order(1 "E. coli" 2 "S. enterica" 3 "M. extorquens" 4 "Cooperative community" 5 "Competitive community")) ///
legend(nocolfirst) ///
ytitle("Average area of clearing (mm^2)") ///
title("Tetracycline", color(black)) ///
box(1, color(midblue)) box(2, color(cranberry)) box(3, color(green)) box(4, color(gs6)) box(5, color(purple)) ///
graphregion(fcolor(white)) ///

