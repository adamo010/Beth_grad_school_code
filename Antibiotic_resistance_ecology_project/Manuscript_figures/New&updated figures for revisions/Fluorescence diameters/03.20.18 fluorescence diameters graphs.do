clear

*Variables: ab (amp/tet), ab_num (1/2), spp (E/S/M), spp_num (1/2/3), rep (1-10), type (mono/coop/comp), type_num (1/2/3),
*D1(#), D2(#), D3(#), av_diam(#)

***********tables of diameters
by ab type, sort : tabstat av_diam, statistics( mean sd median iqr ) by(spp) columns(statistics)
*This will make 6 tables, sorted by ab and type (Amp mono/co/cm, Tet mono/co/cm)- copy and paste into excel

****** Amp stats

ranksum av_diam if(spp=="E" & (type=="mono" | type=="coop") & ab=="amp"), by(type)
ranksum av_diam if(spp=="E" & (type=="mono" | type=="comp") & ab=="amp"), by(type)
ranksum av_diam if(spp=="E" & (type=="coop" | type=="comp") & ab=="amp"), by(type)
ranksum av_diam if(spp=="S" & (type=="mono" | type=="coop") & ab=="amp"), by(type)
ranksum av_diam if(spp=="S" & (type=="mono" | type=="comp") & ab=="amp"), by(type)
ranksum av_diam if(spp=="S" & (type=="coop" | type=="comp") & ab=="amp"), by(type)
ranksum av_diam if(spp=="M" & (type=="mono" | type=="coop") & ab=="amp"), by(type)
ranksum av_diam if(spp=="M" & (type=="mono" | type=="comp") & ab=="amp"), by(type)
ranksum av_diam if(spp=="M" & (type=="coop" | type=="comp") & ab=="amp"), by(type)

****** Amp graphs

*Ec Amp
stripplot av_diam if spp=="E" & ab=="amp", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ymtick(#7) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(51 1 "A") text(45 2 "B") text(51 3 "A")

*Sal Amp
stripplot av_diam if spp=="S" & ab=="amp", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.5 gold*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#7) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(54 1 "A") text(54 2 "B") text(53 3 "C")

*Mex Amp
stripplot av_diam if spp=="M" & ab=="amp", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#7) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(32 1 "A") text(50 2 "B") text(30 3 "A")

******* Tet stats

ranksum av_diam if(spp=="E" & (type=="mono" | type=="coop") & ab=="tet"), by(type)
ranksum av_diam if(spp=="E" & (type=="mono" | type=="comp") & ab=="tet"), by(type)
ranksum av_diam if(spp=="E" & (type=="coop" | type=="comp") & ab=="tet"), by(type)
ranksum av_diam if(spp=="S" & (type=="mono" | type=="coop") & ab=="tet"), by(type)
ranksum av_diam if(spp=="S" & (type=="mono" | type=="comp") & ab=="tet"), by(type)
ranksum av_diam if(spp=="S" & (type=="coop" | type=="comp") & ab=="tet"), by(type)
ranksum av_diam if(spp=="M" & (type=="mono" | type=="coop") & ab=="tet"), by(type)
ranksum av_diam if(spp=="M" & (type=="mono" | type=="comp") & ab=="tet"), by(type)
ranksum av_diam if(spp=="M" & (type=="coop" | type=="comp") & ab=="tet"), by(type)


****** Tet graphs

*Ec Tet
stripplot av_diam if spp=="E" & ab=="tet", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#7) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(46 1 "A") text(48 2 "AB") text(46 3 "B")

*Sal Tet
stripplot av_diam if spp=="S" & ab=="tet", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.5 gold*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#7) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(12 1 "A") text(36 2 "B") text(1 3 "C")

*Mex Tet
stripplot av_diam if spp=="M" & ab=="tet", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#7) ///
ylabel(0(10)60, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(50 1 "A") text(48 2 "B")




