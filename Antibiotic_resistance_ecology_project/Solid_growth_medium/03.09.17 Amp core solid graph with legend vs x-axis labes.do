*Amp core: diameter
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) ///
ytitle("Diameter of cleared area (mm)", size(medium)) xtitle("Species", size(medium)) ///
legend(holes(1) colfirst rows(5) order(2 "{it:E. coli}" 3 "{it:S. enterica}" 4 "{it:M. extorquens}" 5 "Cooperative" "community" 6 "Competitive" "community")) ///
legend(position(3)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
ylabel(, angle(horizontal)) ///
xlabel(none) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2)

