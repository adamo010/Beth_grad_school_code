clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Mex amp competitive release\11.09.17 retrieved Mex Amp competitive release.dta", clear

*OD600
twoway (connected od600 conc if rep==1, lwidth(thick) msymbol(ehuge)) ///
(connected od600 conc if rep==2, lwidth(thick) msymbol(ehuge)) /// 
(connected od600 conc if rep==3, lwidth(thick) msymbol(ehuge)), ///
legend (colfirst rows(1) order(1 "rep1" 2 "rep2" 3 "rep3") size(medium)) ///
title("Competitive community in Ampicillin, OD600", color(black) size(medlarge)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medium) margin(medium)) ytitle("Normalized OD600", size(medium)) ///
ylabel(0(0.1)0.5, grid gmin gmax labsize(medium) angle(horizontal)) ///
xlabel(0(0.5)5, labsize(medium)) ///
xscale(range(5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(1.2)

*CFP
twoway (connected cfp conc if rep==1, lwidth(thick) msymbol(ehuge)) ///
(connected cfp conc if rep==2, lwidth(thick) msymbol(ehuge)) /// 
(connected cfp conc if rep==3, lwidth(thick) msymbol(ehuge)), ///
legend (colfirst rows(1) order(1 "rep1" 2 "rep2" 3 "rep3") size(medium)) ///
title("Competitive community in Ampicillin, CFP", color(black) size(medlarge)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medium) margin(medium)) ytitle("Normalized CFP (f.u.)", size(medium)) ///
ylabel(0(2000)14000, grid gmin gmax labsize(medium) angle(horizontal)) ///
xlabel(0(0.5)5, labsize(medium)) ///
xscale(range(5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(1.2)

*YFP
twoway (connected yfp conc if rep==1, lwidth(thick) msymbol(ehuge)) ///
(connected yfp conc if rep==2, lwidth(thick) msymbol(ehuge)) /// 
(connected yfp conc if rep==3, lwidth(thick) msymbol(ehuge)), ///
legend (colfirst rows(1) order(1 "rep1" 2 "rep2" 3 "rep3") size(medium)) ///
title("Competitive community in Ampicillin, YFP", color(black) size(medlarge)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medium) margin(medium)) ytitle("Normalized YFP (f.u.)", size(medium)) ///
ylabel(0(2000)12000, grid gmin gmax labsize(medium) angle(horizontal)) ///
xlabel(0(0.5)5, labsize(medium)) ///
xscale(range(5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(1.2)


*RFP
twoway (connected rfp conc if rep==1, lwidth(thick) msymbol(ehuge)) ///
(connected rfp conc if rep==2, lwidth(thick) msymbol(ehuge)) /// 
(connected rfp conc if rep==3, lwidth(thick) msymbol(ehuge)), ///
legend (colfirst rows(1) order(1 "rep1" 2 "rep2" 3 "rep3") size(medium)) ///
title("Competitive community in Ampicillin, RFP", color(black) size(medlarge)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medium) margin(medium)) ytitle("Normalized RFP (f.u.)", size(medium)) ///
ylabel(0(200)1000, grid gmin gmax labsize(medium) angle(horizontal)) ///
xlabel(0(0.5)5, labsize(medium)) ///
xscale(range(5)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(small)) ///
scale(1.2)
