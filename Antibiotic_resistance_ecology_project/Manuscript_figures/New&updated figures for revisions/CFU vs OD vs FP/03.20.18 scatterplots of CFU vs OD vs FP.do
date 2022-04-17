*Variables: spp (E/S/M), spp_num (1/2/3), od600 (#), fp (#), av_cfu (#)

*lfitci shows a 95% confidence interval for the predicted values: change to lfit if it looks bad
*will likely have to toggle shit a bit for axis ranges etc: yscale, ymtick, ylabel, etc. 
*may also want to divide  cfu values by 10^7 for easier graphing

generate cfu_div = (av_cfu)/(10^7)
*not essential, but whatever you choose, remember to write the y-axes accordingly

msize(large large large) mlcolor(black black black) mlwidth(vthin vthin vthin)) ///

*Panel A: OD vs. av_cfu
twoway(scatter cfu_div od600 if spp=="E", color(midblue) msize(large) msymbol(circle) mlcolor(black) mlwidth(vthin)) ///
(scatter cfu_div od600 if spp=="S", color(gold) msize(large) msymbol(cirlce) mlcolor(black) mlwidth(vthin)) ///
(scatter cfu_div od600 if spp=="M", color(cranberry) msize(large) msymbol(circle) mlcolor(black) mlwidth(vthin)) ///
(lfit cfu_div od600 if spp=="E", color(midblue)) ///
(lfit cfu_div od600 if spp=="S", color(gold)) ///
(lfit cfu_div od600 if spp=="M", color(cranberry)), ///
title("Colony-forming units (CFU) vs. optical density (OD600)", size(medlarge) color(black)) ///
legend(colfirst rows(1) order(1 "{it: E. coli}" 2 "{it: S. enterica}" 3 "{it: M. extorquens}")) ///
ytitle("Colony-forming units (CFU) x 10^7", size(medium)) xtitle("Optical density at 600nm (OD600)", size(medium)) ///
yscale(range(12)) ymtick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medsmall)) ///
xscale(range(0.16)) xmtick(#9) ///
xlabel(0.08(0.01)0.16, labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("Note: OD=0.08 is the limit of detection")

*Panel B: E. coli/CFP
twoway (scatter cfu_div fp if spp=="E", color (midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit cfu_div fp if spp=="E", color(midblue)), ///
title("Colony-forming units (CFU) vs. cyan fluorescent protein(CFP)", size(medlarge) color(black)) ///
legend(off) ///
ytitle("Colony-forming units, x10^7", size(medium)) xtitle("CFP fluorescence intensity", size(medium)) ///
yscale(range(9)) ymtick(#10) ///
ylabel(0(1)9, angle(horizontal) labsize(medsmall)) ///
xscale(range(190 440)) xmtick(none) ///
xlabel(190(50)440, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("Note: CFP=195 is the limit of detection")

*Panel C: S. enterica/YFP
twoway (scatter cfu_div fp if spp=="S", color (gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit cfu_div fp if spp=="S", color(gold)), ///
legend(off) ///
title("Colony-forming units (CFU) vs. yellow fluorescent protein(YFP)", size(medlarge) color(black)) ///
ytitle("Colony-forming units, x10^7", size(medium)) xtitle("YFP fluorescence intensity", size(medium)) ///
yscale(range(12)) ymtick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medsmall)) ///
xscale(range(650)) xmtick(#14) ///
xlabel(100(50)650, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("Note: YFP=100 is the limit of detection")

*Panel D: M. extorquens/RFP
twoway (scatter cfu_div fp if spp=="M", color (cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit cfu_div fp if spp=="M", color(cranberry)), ///
title("Colony-forming units (CFU) vs. red fluorescent protein(RFP)", size(medlarge) color(black)) ///
legend(off) ///
ytitle("Colony-forming units, x10^7", size(medium)) xtitle("RFP fluorescence intensity", size(medium)) ///
yscale(range(12)) ymtick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medsmall)) ///
xscale(range(160)) xmtick(#9) ///
xlabel(0(20)160, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("Note: RFP=25 is the limit of detection")







