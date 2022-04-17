clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Amp disc diffusions 2spp Sal density\11.08.17 retrieved 2spp Amp disc diffusions.dta", clear

by ab, sort : tabstat diameter, statistics(median) by(spp) columns(statistics)

*Amp 2spp
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin, 2-species cocultures", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold orange navy8 chocolate green)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
xlabel(1 "{it:S. enterica}" 2 `" "{it:E. coli-}" "{it:S. enterica}" "(weakest)" "' 3 `" "{it:E. coli-}" "{it:M. extorquens}" "' 4 `" "{it:S. enterica-}" "{it:M. extorquens}" "' 5 `" "Cooperative" "community" "', labsize(medsmall)) ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15) ///
ysize(4) xsize(6) ///
text(53 1 "A") text(57 2 "B") text(15 3 "C") text(30 4 "D") text(39 5 "E")

*Stats
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="ES")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="EM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="SM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="ES" | spp=="EM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="ES" | spp=="SM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="ES" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="EM" | spp=="SM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="EM" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="SM" | spp=="coop")), by(spp)
