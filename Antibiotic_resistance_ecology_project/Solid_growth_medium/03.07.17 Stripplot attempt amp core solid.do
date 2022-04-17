*New option: stripplot: this code is for medians only
stripplot area, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) ///
ytitle("Area of clearing (mm^2)", size(medium)) xtitle("Species", size(medium)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

*Stripplot: scatterplot(ish) with box (no whiskers)
stripplot area, over(spp_num) stack center box vertical separate(spp_num) ///
ytitle("Area of clearing (mm^2)", size(medium)) xtitle("Species", size(medium)) ///
legend(off) ///
height(0.5) ///
box(barwidth(0.4)) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)
