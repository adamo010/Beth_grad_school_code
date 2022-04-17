*Amp Stats
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)

by ab, sort : tabstat diameter, statistics(median) by(spp) columns(statistics)

*Amp core
stripplot diameter if ab=="amp", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
xlabel(1 "{it:E. coli}" 2 `" "{it:S. enterica}" "(weakest)" "' 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "', labsize(medsmall)) ///
yscale(range(0 60)) ytick(#13) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ysize(4) xsize(6) ///
scale(1.2) ///
text(50 1 "A") text(53 2 "A") text(26 3 "B") text(40 4 "C") text(25 5 "B")

*Tet Stats
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="coop" | spp=="comp")), by(spp)

*Tet core
stripplot diameter if ab=="tet", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 `" "{it:M. extorquens}" "(weakest)" "' 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "', labsize(medsmall)) ///
yscale(range(0 50)) ytick(#12) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ysize(4) xsize(6) ///
scale(1.2) ///
text(43 1 "A") text(15 2 "B") text(47 3 "A") text(43 4 "A") text(13 5 "B")






