*Supplementary figure 4B

clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Amp disc diffusions 2spp Sal density\11.08.17 retrieved Sal density Amp disc diffusions.dta", clear

by ab, sort : tabstat diameter, statistics(median) by(spp) columns(statistics)

*Amp Sal density graph
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3 3) ///
title("Ampicillin, {it:S. enterica} density", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold black cranberry green purple)  ///
msymbol(circle circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black) ///
mlwidth(thin thin thin thin thin thin) ///
xlabel(1 "{it:E. coli}" 2 `" "{it:S.enterica}" "(1x)" "(weakest)" "' 3 `" "{it:S.enterica}" "(3x)" "' 4 "{it:M. extorquens}" 5 `" "Cooperative" "community" "' 6 `" "Competitive" "community" "', labsize(medsmall)) ///
ylabel(0(10)60, angle(horizontal)) ///
yscale(range(0 60)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15) ///
ysize(4) xsize(6.5) ///
text(50 1 "A") text(52 2 "A") text(45 3 "A") text(25 4 "B") text(40 5 "C") text(24 6 "B")

*Stats
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="3xS")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="3xS")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)
