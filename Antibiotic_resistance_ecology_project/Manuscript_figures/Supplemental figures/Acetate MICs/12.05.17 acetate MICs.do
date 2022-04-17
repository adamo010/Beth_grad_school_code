clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Acetate MICs\12.06.17 acetate MICs if this doesnt work fuck it all.dta", clear

*Start off: stripplots: same as previous figs in paper

*Amp:
stripplot mic if ab=="amp", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter (3 3 3 3 3) ///
title("Ampicillin, MIC", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
xlabel(1 `" "{it:E. coli}," "Lactose" "' 2 `" "{it: S. enterica}," "Acetate" "' 3 `" "{it:M. extorquens}," "Acetate" "' 4 `" "Cooperative" "community" "' 5 `" "Competitive" "community," "Acetate" "', labsize(small)) ///
yscale(range(0 110)) ytick(#11) ///
ylabel(#11, angle(horizontal) labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2) ///
ysize(4) xsize(6) ///
text(15 1 "A") text(12 2 "B") text(58 3 "CD") text(16 4 "ABC") text(108 5 "D")

*Tet:
stripplot mic if ab=="tet", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter (3 3 3 3 3) ///
title("Tetracycline, MIC", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
xlabel(1 `" "{it:E. coli}," "Lactose" "' 2 `" "{it: S. enterica}," "Acetate" "' 3 `" "{it:M. extorquens}," "Acetate" "' 4 `" "Cooperative" "community" "' 5 `" "Competitive" "community," "Acetate" "', labsize(small)) ///
yscale(range(0 30)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2) ///
ysize(4) xsize(6) ///
text(8 1 "A") text(23 2 "BC") text(5 3 "AB") text(14 4 "AC") text(24 5 "B")

*STATS******
*Amp core stats:
ranksum mic if(spp=="E" | spp=="S" & ab=="amp"), by(spp)
ranksum mic if(spp=="E" | spp=="M" & ab=="amp"), by(spp)
ranksum mic if(spp=="E" | spp=="Co" & ab=="amp"), by(spp)
ranksum mic if(spp=="E" | spp=="Cm" & ab=="amp"), by(spp)
ranksum mic if(spp=="S" | spp=="M" & ab=="amp"), by(spp)
ranksum mic if(spp=="S" | spp=="Co" & ab=="amp"), by(spp)
ranksum mic if(spp=="S" | spp=="Cm" & ab=="amp"), by(spp)
ranksum mic if(spp=="M" | spp=="Co" & ab=="amp"), by(spp)
ranksum mic if(spp=="M" | spp=="Cm" & ab=="amp"), by(spp)
ranksum mic if(spp=="Co" | spp=="Cm" & ab=="amp"), by(spp)

*Tet
ranksum mic if(spp=="E" | spp=="S" & ab=="tet"), by(spp)
ranksum mic if(spp=="E" | spp=="M" & ab=="tet"), by(spp)
ranksum mic if(spp=="E" | spp=="Co" & ab=="tet"), by(spp)
ranksum mic if(spp=="E" | spp=="Cm" & ab=="tet"), by(spp)
ranksum mic if(spp=="S" | spp=="M" & ab=="tet"), by(spp)
ranksum mic if(spp=="S" | spp=="Co" & ab=="tet"), by(spp)
ranksum mic if(spp=="S" | spp=="Cm" & ab=="tet"), by(spp)
ranksum mic if(spp=="M" | spp=="Co" & ab=="tet"), by(spp)
ranksum mic if(spp=="M" | spp=="Cm" & ab=="tet"), by(spp)
ranksum mic if(spp=="Co" | spp=="Cm" & ab=="tet"), by(spp)


