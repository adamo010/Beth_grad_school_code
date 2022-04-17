*I hate all of this and I don't fucking like doing this anymore

*OD600
generate hiod = av_od600 + sd_od600
generate lood = av_od600 - sd_od600

*OD600 graphs: Fermenters alone and Pa14 alone
twoway (scatter av_od600 amp if type_num==1, connect(l) lwidth(medthick) msize(medlarge) color(magenta) lcolor(magenta)) ///
(scatter av_od600 amp if type_num==2, connect(l) lwidth(medthick) msize(medlarge) color(blue) lcolor(blue)) ///
(rcap hiod lood amp, color(black) msize(large)), ///
legend(colfirst rows(2) order(1 "Fermenters alone on mucin" 2 "Pa14 alone on glucose") size(medium)) ///
xtitle("[Ampicillin] (ug/mL)", size(medlarge) margin(medium)) ///
ytitle("Normalized OD600", size(medlarge)) ///
xlabel(,labsize(medlarge)) ylabel(,labsize(medlarge)) ///
graphregion(fcolor(white)) ///
plotregion(margin(small))


*CFU
generate hicfu = av_cfu + sd_cfu
generate locfu = av_cfu - sd_cfu

*OD600 graphs: Fermenters alone and Pa14 alone: this one also has a dot for no-fermenter Pa14 on mucin, but I think a line is maybe better
twoway (scatter av_cfu amp if type_num==2, connect(l) lwidth(medthick) msize(medlarge) color(blue) lcolor(blue)) ///
(scatter av_cfu amp if type_num==3, connect(l) lwidth(medthick) msize(medlarge) color(emerald) lcolor(emerald)) ///
(scatter av_cfu amp if type_num==4, msize(medlarge) color(magenta)) ///
(rcap hicfu locfu amp, color(black) msize(large)), ///
legend(colfirst rows(2) order(1 "Pa14 alone on glucose" 2 "Pa14-fermenter co-culture on mucin" 3 "Pa14 alone on mucin") size(medium)) ///
xtitle("[Ampicillin] (ug/mL)", size(medlarge) margin(medium)) ///
ytitle("Normalized CFU", size(medlarge)) ///
xlabel(, labsize(medlarge)) ylabel(,labsize(medlarge)) ///
graphregion(fcolor(white)) ///
plotregion(margin(small))

*OD600 with graph
twoway (scatter av_cfu amp if type_num==2, connect(l) lwidth(medthick) msize(medlarge) color(blue) lcolor(blue)) ///
(scatter av_cfu amp if type_num==3, connect(l) lwidth(medthick) msize(medlarge) color(emerald) lcolor(emerald)) ///
(rcap hicfu locfu amp, color(black) msize(large)), ///
legend(colfirst rows(2) order(1 "Pa14 alone on glucose" 2 "Pa14-fermenter co-culture on mucin" 4 "Pa14 alone on mucin") size(medium)) ///
xtitle("[Ampicillin] (ug/mL)", size(medlarge) margin(medium)) ///
ytitle("Normalized CFU", size(medlarge)) ///
xlabel(, labsize(medlarge)) ylabel(,labsize(medlarge)) ///
yline(0.1624, lwidth(medthick) lcolor(magenta)) ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) 

*Or fuck the line entirely
twoway (scatter av_cfu amp if type_num==2, connect(l) lwidth(medthick) msize(medlarge) color(blue) lcolor(blue)) ///
(scatter av_cfu amp if type_num==3, connect(l) lwidth(medthick) msize(medlarge) color(emerald) lcolor(emerald)) ///
(rcap hicfu locfu amp, color(black) msize(large)), ///
legend(colfirst rows(2) order(1 "Pa14 alone on glucose" 2 "Pa14-fermenter co-culture on mucin") size(medium)) ///
xtitle("[Ampicillin] (ug/mL)", size(medlarge) margin(medium)) ///
ytitle("Normalized CFU", size(medlarge)) ///
xlabel(, labsize(medlarge)) ylabel(,labsize(medlarge)) ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) 


