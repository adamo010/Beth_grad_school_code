*Graph
*Ec Tet
stripplot mic if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3 3) ///
title("{it: E. coli}, Tetracycline MIC", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3 midblue*1.7) ///
mlcolor(black black black black) mlwidth(medthin medthin medthin medthin) ///
msymbol(circle circle circle circle) msize(medlarge medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp." 4 `" "Mono." "Cells added" "at 20h" "', labsize(medium)) ///
yscale(range(0 1 2 3 4 5 6)) ytick(#7) ///
ylabel(#7, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.2)

****Stats
ranksum mic if((type=="mono" | type=="coop")), by(type)
ranksum mic if((type=="mono" | type=="comp")), by(type)
ranksum mic if((type=="mono" | type=="late")), by(type)
ranksum mic if((type=="coop" | type=="comp")), by(type)
ranksum mic if((type=="coop" | type=="late")), by(type)
ranksum mic if((type=="comp" | type=="late")), by(type)

