***Figures 2A and 2B

*Amp combined community:
stripplot mic1 if ab=="amp", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter (3 3 3 3 3) ///
title("Ampicillin", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
xlabel(1 "{it:E. coli}" 2 `" "{it:S. enterica}" "(weakest)" "' 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "', labsize(medsmall)) ///
yscale(range(120)) ytick(#12) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ysize(4) xsize(6) ///
scale(1.1) ///
text(17 1 "A") text(17 2 "A") text(110 3 "B") text(17 4 "A") text(110 5 "B")


by ab, sort : tabstat mic1, statistics(median) by(spp) columns(statistics)


*Amp stats
ranksum mic1 if(spp=="E" | spp=="S" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="E" | spp=="M" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="E" | spp=="Co" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="E" | spp=="Cm" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="S" | spp=="M" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="S" | spp=="Co" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="S" | spp=="Cm" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="M" | spp=="Co" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="M" | spp=="Cm" & ab=="amp"), by(spp)
ranksum mic1 if(spp=="Co" | spp=="Cm" & ab=="amp"), by(spp)


*Tet combined community:
stripplot mic1 if ab=="tet", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline", size(large) color(black) margin(zero)) ///
ytitle("MIC ({&mu}g/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
xlabel(1 `" "{it:E. coli}" "(weakest)" "' 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "', labsize(medsmall)) ///
yscale(range(110)) ytick(#12) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.1) ///
ysize(4) xsize(6) ///
text(16 1 "A") text(110 2 "B") text(20 3 "C") text(20 4 "C") text(110 5 "B")


*Tet stats
ranksum mic1 if(spp=="E" | spp=="S" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="E" | spp=="M" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="E" | spp=="Co" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="E" | spp=="Cm" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="S" | spp=="M" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="S" | spp=="Co" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="S" | spp=="Cm" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="M" | spp=="Co" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="M" | spp=="Cm" & ab=="tet"), by(spp)
ranksum mic1 if(spp=="Co" | spp=="Cm" & ab=="tet"), by(spp)
