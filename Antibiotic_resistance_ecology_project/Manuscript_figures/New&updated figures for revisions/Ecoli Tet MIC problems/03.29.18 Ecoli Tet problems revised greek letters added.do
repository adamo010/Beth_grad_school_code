*Supplemental figure on Ecoli MIC in Tet
*Another dumb experiment for this fucking paper that needs to die

*Variables: 

*Stats: MIC stats
ranksum mic1 if(type=="mono" | type=="coop"), by(type)
ranksum mic1 if(type=="mono" | type=="3x"), by(type)
ranksum mic1 if(type=="mono" | type=="20h"), by(type)
ranksum mic1 if(type=="mono" | type=="starv"), by(type)
ranksum mic1 if(type=="coop" | type=="3x"), by(type)
ranksum mic1 if(type=="coop" | type=="20h"), by(type)
ranksum mic1 if(type=="coop" | type=="starv"), by(type)
ranksum mic1 if(type=="3x" | type=="20h"), by(type)
ranksum mic1 if(type=="3x" | type=="starv"), by(type)
ranksum mic1 if(type=="20h" | type=="starv"), by(type)

*Stats: lag time stats
ranksum lagtime if(type=="mono" | type=="coop"), by(type)
ranksum lagtime if(type=="mono" | type=="3x"), by(type)
ranksum lagtime if(type=="mono" | type=="20h"), by(type)
ranksum lagtime if(type=="mono" | type=="starv"), by(type)
ranksum lagtime if(type=="coop" | type=="3x"), by(type)
ranksum lagtime if(type=="coop" | type=="20h"), by(type)
ranksum lagtime if(type=="coop" | type=="starv"), by(type)
ranksum lagtime if(type=="3x" | type=="20h"), by(type)
ranksum lagtime if(type=="3x" | type=="starv"), by(type)
ranksum lagtime if(type=="20h" | type=="starv"), by(type)

*Panel A: mic of Tet under 10000 different conditions
stripplot mic1 if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3 3 3) ///
title("{it: E. coli}, MIC", size(medlarge) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3 midblue*1.5 midblue*0.1) ///
mlcolor(black black black black black) mlwidth(medthin medthin medthin medthin medthin) ///
msymbol(circle circle circle circle circle) msize(medlarge medlarge medlarge medlarge medlarge) mlcolor (black black black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 `" "Mono." "(3x)" "' 4 `" "Mono." "at 20h" "' 5 `" "Mono." "starved" "', labsize(medium)) ///
yscale(range(12)) ytick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.1) ///
text(5.7 1 "A") text(10.7 2 "B") text(5.7 3 "AB") text(10.7 4 "C") text(10.7 5 "C")

*Panel B: lag time of Tet under 10000 different conditions
stripplot lagtime if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3 3 3) ///
title("{it:E. coli}: time to detectable growth", size(medlarge) color(black) margin(zero)) ///
ytitle("Time (hours)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3 midblue*1.5 midblue*0.1) ///
mlcolor(black black black black black) mlwidth(medthin medthin medthin medthin medthin) ///
msymbol(circle circle circle circle circle) msize(medlarge medlarge medlarge medlarge medlarge) mlcolor (black black black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 `" "Mono." "(3x)" "' 4 `" "Mono." "at 20h" "' 5 `" "Mono." "starved" "', labsize(medium)) ///
yscale(range(65)) ytick(#14) ///
ylabel(0(5)65, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.1) ///
text(23 1 "A") text(46 2 "BC") text(29 3 "AB") text(48 4 "C") text(63 5 "D")
