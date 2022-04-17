clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Main figures\Fig3 MICs by spp\11.09.17 retrieved by spp MICs Amp and Tet combined.dta", clear

****** Amp graphs

*Ec Amp
stripplot mic1 if spp=="E" & ab=="amp", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ymtick(#13) ///
ylabel(0(1)6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(5.4 1 "A") text(5.4 2 "B") text(2.5 3 "AB")

*Sal Amp
stripplot mic1 if spp=="S" & ab=="amp", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.5 gold*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ytick(#13) ///
ylabel(0(1)6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(5.4 1 "A") text(5.4 2 "A") text(2.5 3 "A")

*Mex Amp
stripplot mic1 if spp=="M" & ab=="amp", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(110)) ytick(#12) ///
ylabel(0(10)110, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(106 1 "A") text(13 2 "B") text(104 3 "A")

****** Amp stats

ranksum mic1 if(spp=="E" & (type=="mono" | type=="coop") & ab=="amp"), by(type)
ranksum mic1 if(spp=="E" & (type=="mono" | type=="comp") & ab=="amp"), by(type)
ranksum mic1 if(spp=="E" & (type=="coop" | type=="comp") & ab=="amp"), by(type)
ranksum mic1 if(spp=="S" & (type=="mono" | type=="coop") & ab=="amp"), by(type)
ranksum mic1 if(spp=="S" & (type=="mono" | type=="comp") & ab=="amp"), by(type)
ranksum mic1 if(spp=="S" & (type=="coop" | type=="comp") & ab=="amp"), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="coop") & ab=="amp"), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="comp") & ab=="amp"), by(type)
ranksum mic1 if(spp=="M" & (type=="coop" | type=="comp") & ab=="amp"), by(type)

****** Tet graphs

*Ec Tet
stripplot mic1 if spp=="E" & ab=="tet", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(12)) ytick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(5.8 1 "A") text(10.7 2 "B") text(4 3 "B")

*Sal Tet
stripplot mic1 if spp=="S" & ab=="tet", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.5 gold*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(110)) ytick(#12) ///
ylabel(0(10)110, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(106 1 "A") text(18 2 "B") text(106 3 "A")

*Mex Tet
stripplot mic1 if spp=="M" & ab=="tet", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(thin thin thin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(12)) ytick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8) ///
text(10.6 1 "A") text(10.6 2 "B") text(0.8 3 "C")


******* Tet stats
****** Amp stats

ranksum mic1 if(spp=="E" & (type=="mono" | type=="coop") & ab=="tet"), by(type)
ranksum mic1 if(spp=="E" & (type=="mono" | type=="comp") & ab=="tet"), by(type)
ranksum mic1 if(spp=="E" & (type=="coop" | type=="comp") & ab=="tet"), by(type)
ranksum mic1 if(spp=="S" & (type=="mono" | type=="coop") & ab=="tet"), by(type)
ranksum mic1 if(spp=="S" & (type=="mono" | type=="comp") & ab=="tet"), by(type)
ranksum mic1 if(spp=="S" & (type=="coop" | type=="comp") & ab=="tet"), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="coop") & ab=="tet"), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="comp") & ab=="tet"), by(type)
ranksum mic1 if(spp=="M" & (type=="coop" | type=="comp") & ab=="tet"), by(type)



