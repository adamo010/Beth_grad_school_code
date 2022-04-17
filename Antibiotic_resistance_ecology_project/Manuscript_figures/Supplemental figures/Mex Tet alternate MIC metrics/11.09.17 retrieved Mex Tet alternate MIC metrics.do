clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Mex Tet alternate MIC metrics\11.09.17 retrieved Mex Tet alternate MIC metrics.dta"


*Mex Tet MIC1: standard MIC (3x lag time only)
stripplot mic1 if spp=="M", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}," "standard MIC", size(medlarge) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(12)) ytick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(10.7 1 "A") text(10.7 2 "B") text(0.8 3 "C")


*Mex Tet MIC1 stats
ranksum mic1 if(spp=="M" & (type=="mono" | type=="coop")), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="comp")), by(type)
ranksum mic1 if(spp=="M" & (type=="coop" | type=="comp")), by(type)

*Mex Tet MIC2: 3x lag time OR 72h cutoff
stripplot mic2 if spp=="M", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}," "MIC with 72h cutoff", size(medlarge) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ytick(#13) ///
ylabel(0(1)6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.6) ///
text(5.4 1 "A") text(5.4 2 "A") text(0.5 3 "B")

*Mex Tet MIC2 stats
ranksum mic2 if(spp=="M" & (type=="mono" | type=="coop")), by(type)
ranksum mic2 if(spp=="M" & (type=="mono" | type=="comp")), by(type)
ranksum mic2 if(spp=="M" & (type=="coop" | type=="comp")), by(type)

