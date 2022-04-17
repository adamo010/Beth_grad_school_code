clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

generate acrB = 0 if ab=="Amp" & type=="res_isol"
replace acrB = 1 if ab=="Amp" & pop_id=="rMM090" & type=="res_isol"
replace acrB = 1 if ab=="Amp" & pop_id=="rMM119" & type=="res_isol"

generate acrBnum = 0.5 if ab=="Amp" & acrB==0 & evol_condn=="Smono" & type=="res_isol"
replace acrBnum = 2.5 if ab=="Amp" & acrB==1 & evol_condn=="Smono" & type=="res_isol"

*******coop grs
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & (acrBnum==0.5 | acrBnum==2.5)), by(acrB)

stripplot meancoop_gr if ab=="Amp" & type=="res_isol", over(acrBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(acrBnum) jitter(5 5 5 5) ///
title("Co-culture growth rates of" "{it:S. enterica} {it:acrB/ompR} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type {it:acrB/ompR}" "' 2.5 `" "{it:S. enterica}" "mutant {it:acrB/ompR}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
text(0.58 1.5 "p=0.0641", size(medium)) ///
text(0.57 1.5 "_______________", size(medium)) 

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & (acrBnum==0.5 | acrBnum==2.5)), by(acrB)

stripplot meanmono_gr if ab=="Amp" & type=="res_isol", over(acrBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(acrBnum) jitter(5 5 5 5) ///
title("Monoculture growth rates of" "{it:S. enterica} {it:acrB/ompR} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type {it:acrB/ompR}" "' 2.5 `" "{it:S. enterica}" "mutant {it:acrB/ompR}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) ///
text(0.98 1.5 "p=0.0641", size(medium)) ///
text(0.97 1.5 "_______________", size(medium)) 
