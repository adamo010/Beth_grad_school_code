*Supplemental figure 1: liquid med.

clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Ecoli Tet MIC delayed inoculation\11.09.17 retrieved Ec lag times MIC delayed inoculation.dta", clear


*S1A: standard MIC of liquid medium
*Ec Tet
stripplot mic1 if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3 3 3) ///
title("{it: E. coli}: standard MIC", size(medlarge) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3 midblue*1.5 midblue*0.1) ///
mlcolor(black black black black black) mlwidth(medthin medthin medthin medthin medthin) ///
msymbol(circle circle circle circle circle) msize(medlarge medlarge medlarge medlarge medlarge) mlcolor (black black black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp." 4 `" "Mono." "(3x)" "' 5 `" "Mono." "at 20h" "', labsize(medium)) ///
yscale(range(12)) ytick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.1) ///
text(5.7 1 "A") text(10.7 2 "B") text(4.1 3 "AB") text(6 4 "AB") text(10.8 5 "C")

*Stats
ranksum mic1 if(type=="mono" | type=="coop"), by(type)
ranksum mic1 if(type=="mono" | type=="comp"), by(type)
ranksum mic1 if(type=="mono" | type=="3x"), by(type)
ranksum mic1 if(type=="mono" | type=="20h"), by(type)
ranksum mic1 if(type=="coop" | type=="comp"), by(type)
ranksum mic1 if(type=="coop" | type=="3x"), by(type)
ranksum mic1 if(type=="coop" | type=="20h"), by(type)
ranksum mic1 if(type=="comp" | type=="3x"), by(type)
ranksum mic1 if(type=="comp" | type=="20h"), by(type)
ranksum mic1 if(type=="3x" | type=="20h"), by(type)

*S1B
stripplot lagtime if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3 3 3) ///
title("{it:E. coli}: time to detectable growth", size(medlarge) color(black) margin(zero)) ///
ytitle("Time (hours)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3 midblue*1.5 midblue*0.1) ///
mlcolor(black black black black black) mlwidth(medthin medthin medthin medthin medthin) ///
msymbol(circle circle circle circle circle) msize(medlarge medlarge medlarge medlarge medlarge) mlcolor (black black black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp." 4 `" "Mono" "(3x)" "' 5 `" "Mono." "at 20h" "', labsize(medium)) ///
yscale(range(50)) ytick(#12) ///
ylabel(0(5)50, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.1) ///
text(23 1 "A") text(45 2 "B") text(40 3 "A") text(28 4 "A") text(47 5 "B")


*Stats
ranksum lagtime if(type=="mono" | type=="coop"), by(type)
ranksum lagtime if(type=="mono" | type=="comp"), by(type)
ranksum lagtime if(type=="mono" | type=="3x"), by(type)
ranksum lagtime if(type=="mono" | type=="20h"), by(type)
ranksum lagtime if(type=="coop" | type=="comp"), by(type)
ranksum lagtime if(type=="coop" | type=="3x"), by(type)
ranksum lagtime if(type=="coop" | type=="20h"), by(type)
ranksum lagtime if(type=="comp" | type=="3x"), by(type)
ranksum lagtime if(type=="comp" | type=="20h"), by(type)
ranksum lagtime if(type=="3x" | type=="20h"), by(type)




