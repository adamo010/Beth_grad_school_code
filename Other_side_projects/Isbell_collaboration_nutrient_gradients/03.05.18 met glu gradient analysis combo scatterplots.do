*Met Glu gradient analysis for Isbell project
*This is just combo gradients only: had to add extra dummy variables for conc_met and conc_glu b/c stata CAN'T READ 0.1, apparently

*variables: gradient (met/glu/combo), grad_num(1/2/3), rep(1-8), conc_met(0/0.1/0.25/0.5/0.75/1/1.5/2), conc_glu(same as met) ///
*conc_met2(0/1/2.5/5/07.5/10/15/20), conc_glu(same as met) od, cfp, yfp
*Combo gradient doesn't have reps

*Combo OD, by met
graph twoway (scatter od conc_met2 if conc_glu2==0 & gradient=="combo", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==1 & gradient=="combo", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==2.5 & gradient=="combo", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==5 & gradient=="combo", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==7.5 & gradient=="combo", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==10 & gradient=="combo", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==15 & gradient=="combo", connect(l) color(lavender) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if conc_glu2==20 & gradient=="combo", connect(l) color(black) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture OD600, Methionine Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("OD600", size(medium)) xtitle("[Methionine] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "0x Glu" 2 "0.1x Glu" 3 "0.25x Glu" 4 "0.5x Glu" 5 "0.75x Glu" 6 "1x Glu" 7 "1.5x Glu" 8 "2x Glu") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-0.05(0.05)0.55, labsize(medium)) yscale(range(-0.05 0.55))

*Combo OD, by glu
graph twoway (scatter od conc_glu2 if conc_met2==0 & gradient=="combo", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==1 & gradient=="combo", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==2.5 & gradient=="combo", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==5 & gradient=="combo", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==7.5 & gradient=="combo", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==10 & gradient=="combo", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==15 & gradient=="combo", connect(l) color(lavender) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if conc_met2==20 & gradient=="combo", connect(l) color(black) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture OD600, Glucose Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("OD600", size(medium)) xtitle("[Glucose] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "0x Met" 2 "0.1x Met" 3 "0.25x Met" 4 "0.5x Met" 5 "0.75x Met" 6 "1x Met" 7 "1.5x Met" 8 "2x Met") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-0.05(0.05)0.55, labsize(medium)) yscale(range(-0.05 0.55)) 

*Combo CFP, by met
graph twoway (scatter cfp conc_met2 if conc_glu2==0 & gradient=="combo", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==1 & gradient=="combo", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==2.5 & gradient=="combo", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==5 & gradient=="combo", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==7.5 & gradient=="combo", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==10 & gradient=="combo", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==15 & gradient=="combo", connect(l) color(lavender) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if conc_glu2==20 & gradient=="combo", connect(l) color(black) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture CFP, Methionine Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("CFP", size(medium)) xtitle("[Methionine] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "0x Glu" 2 "0.1x Glu" 3 "0.25x Glu" 4 "0.5x Glu" 5 "0.75x Glu" 6 "1x Glu" 7 "1.5x Glu" 8 "2x Glu") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(250)2250, labsize(medium)) yscale(range(0 2250)) 

*Combo CFP, by glu
graph twoway (scatter cfp conc_glu2 if conc_met2==0 & gradient=="combo", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==1 & gradient=="combo", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==2.5 & gradient=="combo", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==5 & gradient=="combo", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==7.5 & gradient=="combo", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==10 & gradient=="combo", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==15 & gradient=="combo", connect(l) color(lavender) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_glu2 if conc_met2==20 & gradient=="combo", connect(l) color(black) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture CFP, Glucose Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("CFP", size(medium)) xtitle("[Glucose] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "0x Met" 2 "0.1x Met" 3 "0.25x Met" 4 "0.5x Met" 5 "0.75x Met" 6 "1x Met" 7 "1.5x Met" 8 "2x Met") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(250)2250, labsize(medium)) yscale(range(0 2250)) 

*Combo YFP, by met
graph twoway (scatter yfp  conc_met2 if conc_glu2==0 & gradient=="combo", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==1 & gradient=="combo", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==2.5 & gradient=="combo", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==5 & gradient=="combo", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==7.5 & gradient=="combo", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==10 & gradient=="combo", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==15 & gradient=="combo", connect(l) color(lavender) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_met2 if conc_glu2==20 & gradient=="combo", connect(l) color(black) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture YFP , Methionine Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("YFP ", size(medium)) xtitle("[Methionine] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "0x Glu" 2 "0.1x Glu" 3 "0.25x Glu" 4 "0.5x Glu" 5 "0.75x Glu" 6 "1x Glu" 7 "1.5x Glu" 8 "2x Glu") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-100(500)5100, labsize(medium)) yscale(range(-100 5100)) 

*Combo YFP, by glu
graph twoway (scatter yfp  conc_glu2 if conc_met2==0 & gradient=="combo", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==1 & gradient=="combo", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==2.5 & gradient=="combo", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==5 & gradient=="combo", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==7.5 & gradient=="combo", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==10 & gradient=="combo", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==15 & gradient=="combo", connect(l) color(lavender) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp  conc_glu2 if conc_met2==20 & gradient=="combo", connect(l) color(black) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Co-culture YFP , Glucose Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("YFP ", size(medium)) xtitle("[Glucose] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "0x Met" 2 "0.1x Met" 3 "0.25x Met" 4 "0.5x Met" 5 "0.75x Met" 6 "1x Met" 7 "1.5x Met" 8 "2x Met") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-100(500)5100, labsize(medium)) yscale(range(-100 5100)) 

