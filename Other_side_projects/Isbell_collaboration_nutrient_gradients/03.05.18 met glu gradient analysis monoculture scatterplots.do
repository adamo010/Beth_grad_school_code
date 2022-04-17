*Met Glu gradient analysis for Isbell project
*This is just combo gradients only: had to add extra dummy variables for conc_met and conc_glu b/c stata CAN'T READ 0.1, apparently

*variables: gradient (met/glu/combo), grad_num(1/2/3), rep(1-8), conc_met(0/0.1/0.25/0.5/0.75/1/1.5/2), conc_glu(same as met) ///
*conc_met2(0/1/2.5/5/07.5/10/15/20), conc_glu(same as met) od, cfp, yfp
*Combo gradient doesn't have reps


*Met gradient, OD
graph twoway (scatter od conc_met2 if rep==1 & gradient=="met", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if rep==2 & gradient=="met", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if rep==3 & gradient=="met", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if rep==4 & gradient=="met", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if rep==5 & gradient=="met", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_met2 if rep==6 & gradient=="met", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it: E. coli} OD600, Methionine Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("OD600", size(medium)) xtitle("[Methionine] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(colfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-0.05(0.05)0.25, labsize(medium)) yscale(range(-0.05 0.25))

*Met gradient, CFP
graph twoway (scatter cfp conc_met2 if rep==1 & gradient=="met", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if rep==2 & gradient=="met", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if rep==3 & gradient=="met", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if rep==4 & gradient=="met", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if rep==5 & gradient=="met", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter cfp conc_met2 if rep==6 & gradient=="met", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it: E. coli} CFP, Methionine Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("CFP", size(medium)) xtitle("[Methionine] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(colfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-50(250)2250, labsize(medium)) yscale(range(-50 2250)) 

*Glu gradient, OD
graph twoway (scatter od conc_glu2 if rep==1 & gradient=="glu", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if rep==2 & gradient=="glu", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if rep==3 & gradient=="glu", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if rep==4 & gradient=="glu", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if rep==5 & gradient=="glu", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter od conc_glu2 if rep==6 & gradient=="glu", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it: S. enterica} OD600, Glucose Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("OD600", size(medium)) xtitle("[Glucose] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(colfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-0.05(0.05)0.4, labsize(medium)) yscale(range(-0.05 0.4)) 

*Glu gradient, YFP
graph twoway (scatter yfp conc_glu2 if rep==1 & gradient=="glu", connect(l) color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp conc_glu2 if rep==2 & gradient=="glu", connect(l) color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp conc_glu2 if rep==3 & gradient=="glu", connect(l) color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp conc_glu2 if rep==4 & gradient=="glu", connect(l) color(orange) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp conc_glu2 if rep==5 & gradient=="glu", connect(l) color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(scatter yfp conc_glu2 if rep==6 & gradient=="glu", connect(l) color(cranberry) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it: S. enterica} YFP, Glucose Gradient", size(medlarge) color(black) margin(zero)) ///
ytitle("YFP", size(medium)) xtitle("[Glucose] (x)", size(medium) margin(vsmall)) ///
xlabel(0 "0" 1 "0.1" 2.5 "0.25" 5 "0.5" 7.5 "0.75" 10 "1" 15 "1.5" 20 "2", labsize(medsmall)) ///
legend(colfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(-100(500)4000, labsize(medium)) yscale(range(-100 4000)) 



