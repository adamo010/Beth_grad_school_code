*This is (mostly) to compare the results from the old glucose/succinate disc diffusions to the ones done as controls for the acetate disc diffusions
use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\October 2017 Revisions\10.30.17 acetate disc diffusion redos compare to old data.dta", clear

*have 7 variables in the dataset: ab, ab_num, spp, spp_num, newold, newold_num, diameter

*To start: generate a new variable that combines spp_num and newold_num so they can be graphed seperately
generate spp_age = 1 if spp=="Elac" & newold=="old"
replace spp_age = 2 if spp=="Elac" & newold=="new"
replace spp_age = 4 if spp=="Sglu" & newold=="old"
replace spp_age = 5 if spp=="Sglu" & newold=="new"
replace spp_age = 7 if spp=="Sac" & newold=="new"
replace spp_age = 9 if spp=="Msuc" & newold=="old"
replace spp_age = 10 if spp=="Msuc" & newold=="new"
replace spp_age = 12 if spp=="Mac" & newold=="new"
replace spp_age = 14 if spp=="Coop" & newold=="old"
replace spp_age = 15 if spp=="Coop" & newold=="new"
replace spp_age = 17 if spp=="Compall" & newold=="old"
replace spp_age = 18 if spp=="Compall" & newold=="new"
replace spp_age = 20 if spp=="Compac" & newold=="new"

*Amp graph:
stripplot diameter if ab=="amp", over(spp_age) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_age) jitter(5 5 5 5 5 5 5 5 5 5 5 5 5) ///
title("Ampicillin, diameter of clearing", size(medium) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medsmall)) xtitle("Species", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
legend(off) ///
mcolor(midblue midblue gold gold khaki cranberry cranberry sienna green green purple purple lavender) ///
mlcolor(black black black black black black black black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
msymbol(circle triangle circle triangle triangle circle triangle triangle circle triangle circle triangle triangle) ///
msize(medium medium medium medium medium medium medium medium medium medium medium medium medium) ///
xlabel(1.5 "E_lcts" 4.5 "Sal_glu" 7 "Sal_ac" 9.5 "Mex_suc" 12 "Mex_ac" 14.5 "Coop" 17.5 "Comp_all" 20 "Comp_ac", alternate labsize(small)) ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2)
graph save 10.30.17_amp_acetate_zones.gph, replace

*Tet graph:
stripplot diameter if ab=="tet", over(spp_age) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_age) jitter(5 5 5 5 5 5 5 5 5 5 5 5 5) ///
title("Tetracycline diameter of clearing", size(medium) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medsmall)) xtitle("Species", size(medsmall) margin(vsmall)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
legend(off) ///
mcolor(midblue midblue gold gold khaki cranberry cranberry sienna green green purple purple lavender) ///
mlcolor(black black black black black black black black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
msymbol(circle triangle circle triangle triangle circle triangle triangle circle triangle circle triangle triangle) ///
msize(medium medium medium medium medium medium medium medium medium medium medium medium medium) ///
xlabel(1.5 "E_lcts" 4.5 "Sal_glu" 7 "Sal_ac" 9.5 "Mex_suc" 12 "Mex_ac" 14.5 "Coop" 17.5 "Comp_all" 20 "Comp_ac", alternate labsize(small)) ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2)
graph save 10.30.17_tet_acetate_zones.gph, replace

