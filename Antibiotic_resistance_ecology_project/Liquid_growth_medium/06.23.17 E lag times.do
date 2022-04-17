*Ec lag times in tet
*Statistics
ranksum lagtime if(spp=="mono" | spp=="coop"), by(spp)
ranksum lagtime if(spp=="mono" | spp=="comp"), by(spp)
ranksum lagtime if(spp=="coop" | spp=="comp"), by(spp)

ttest lagtime if(spp=="mono" | spp=="coop"), by(spp)
ttest lagtime if(spp=="mono" | spp=="comp"), by(spp)
ttest lagtime if(spp=="coop" | spp=="comp"), by(spp)

*graph this shit (did you know shit is an anagram of this?)
stripplot lagtime, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3) ///
title("{it:E. coli}: time to" "detectable growth", size(medlarge) color(black) margin(zero)) ///
ytitle("Time (hours)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(50)) ytick(#12) ///
ylabel(0(5)50, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)
