*last one?!?!
*this is S/M/comp acetate only (no comparing to glucose/succinate)
clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\October 2017 Revisions\11.08.17 acecate disc diffusions new only.dta", clear

*or, for new Sac/Mac/Compac data with old E/coop data for better stats(?)
clear
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\October 2017 Revisions\11.08.17 acecate disc diffusions new acetate old E Coop.dta", clear

replace spp_num = 2 if spp=="Sac"
replace spp_num = 3 if spp=="Mac"
replace spp_num = 4 if spp=="Coop"
replace spp_num = 5 if spp=="Compac"

 
*Amp graph
stripplot diameter if ab=="amp", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin, diameter of clearing", size(medium) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medsmall)) xtitle("Species", size(medsmall) margin(vsmall)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
xlabel(1 `" "{it:E. coli}," "Lactose" "' 2 `" "{it: S. enterica}," "Acetate" "' 3 `" "{it:M. extorquens}," "Acetate" "' 4 `" "Cooperative" "community" "' 5 `" "Competitive" "community," "Acetate" "', labsize(small)) ///
yscale(range(0 50)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2) ///
text(49 1 "A") text(44 2 "A") text(19 3 "B") text(40 4 "C") text(22 5 "B")


*Tet graph
stripplot diameter if ab=="tet", over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline, diameter of clearing", size(medium) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medsmall)) xtitle("Species", size(medsmall) margin(vsmall)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin) ///
xlabel(1 `" "{it:E. coli}," "Lactose" "' 2 `" "{it: S. enterica}," "Acetate" "' 3 `" "{it:M. extorquens}," "Acetate" "' 4 `" "Cooperative" "community" "' 5 `" "Competitive" "community," "Acetate" "', labsize(small)) ///
yscale(range(0 60)) ytick(#11) ///
ylabel(#11, angle(horizontal) labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2)  ///
text(43 1 "A") text(17 2 "B") text(56 3 "C") text(44 4 "A") text(15 5 "B")

*STATS******
*Amp core stats:
ranksum diameter if(ab=="amp" & (spp=="Elac" | spp=="Sac")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Elac" | spp=="Mac")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Elac" | spp=="Coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Elac" | spp=="Compac")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Sac" | spp=="Mac")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Sac" | spp=="Coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Sac" | spp=="Compac")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Mac" | spp=="Coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Mac" | spp=="Compac")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="Coop" | spp=="Compac")), by(spp)

*Tet
ranksum diameter if(ab=="tet" & (spp=="Elac" | spp=="Sac")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Elac" | spp=="Mac")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Elac" | spp=="Coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Elac" | spp=="Compac")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Sac" | spp=="Mac")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Sac" | spp=="Coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Sac" | spp=="Compac")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Mac" | spp=="Coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Mac" | spp=="Compac")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="Coop" | spp=="Compac")), by(spp)
