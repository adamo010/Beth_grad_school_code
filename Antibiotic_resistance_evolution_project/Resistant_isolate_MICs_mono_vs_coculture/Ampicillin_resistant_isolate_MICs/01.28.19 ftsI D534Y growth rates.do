clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

generate D534Y = 0 if ab=="Amp" & type=="res_isol" & evol_condn=="Scoop"
replace D534Y = 1 if ab=="Amp" & pop_id=="rMM158" & type=="res_isol" & evol_condn=="Scoop"

generate D534Ynum = 0.5 if D534Y==0
replace D534Ynum = 2.5 if D534Y==1

*******Coop GRs by mutation
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & (D534Ynum==0.5 | D534Ynum==2.5)), by(D534Y)

stripplot meancoop_gr if ab=="Amp" & type=="res_isol", over(D534Ynum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(D534Ynum) jitter(5 5 5 5) ///
title("Co-culture growth rates of" "{it:S. enterica} {it:D534Y/ompR} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type {it:ftsI}" "' 2.5 `" "{it:S. enterica}" "D534Y-mutant {it:ftsI}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(0.1)0.5, labsize(medlarge)) yscale(range(0 0.5)) 

**************Coop GRs by population
generate repdummy = 1 if rep==1
replace repdummy = 4 if rep==2
replace repdummy = 7 if rep==3
replace repdummy = 10 if rep==4
replace repdummy = 13 if rep==5
replace repdummy = 16 if rep==6 

stripplot meancoop_gr if ab=="Amp"& type=="res_isol" & evol_condn=="Scoop", over(repdummy) stack center vertical separate(rep) ///
title("Ampicillin, co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gold dkgreen olive_teal sandb mint eltgreen) ///
msymbol(diamond triangle triangle diamond triangle triangle) ///
msize(vlarge vlarge vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(3) order(1 "{it:ftsI} wt (rep1 isolates)" 2 "{it:yoaE} (rep2 population)" /// 
3 "{it:ompF} (rep3 population)" 4 "{it:ftsI} D535Y (rep4 isolates)" ///
5 "{it:yoaE} (rep5 population)" 6 "(rep6 population)") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#8, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.5, labsize(medlarge)) yscale(range(0 0.5)) 

*******Mono GRs by mutation
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & (D534Ynum==0.5 | D534Ynum==2.5)), by(D534Y)

stripplot meanmono_gr if ab=="Amp" & type=="res_isol", over(D534Ynum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(D534Ynum) jitter(5 5 5 5) ///
title("Monoculture growth rates of" "{it:S. enterica} {it:D534Y/ompR} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type {it:ftsI}" "' 2.5 `" "{it:S. enterica}" "D534Y-mutant {it:ftsI}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) 

**************Mono GRs by population
stripplot meanmono_gr if ab=="Amp"& type=="res_isol" & evol_condn=="Scoop", over(repdummy) stack center vertical separate(rep) ///
title("Ampicillin, monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(gold dkgreen olive_teal sandb mint eltgreen) ///
msymbol(diamond triangle triangle diamond triangle triangle) ///
msize(vlarge vlarge vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(3) order(1 "{it:ftsI} wt (rep1 isolates)" 2 "{it:yoaE} (rep2 population)" /// 
3 "{it:ompF} (rep3 population)" 4 "{it:ftsI} D535Y (rep4 isolates)" ///
5 "{it:yoaE} (rep5 population)" 6 "(rep6 population)") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#8, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) 


