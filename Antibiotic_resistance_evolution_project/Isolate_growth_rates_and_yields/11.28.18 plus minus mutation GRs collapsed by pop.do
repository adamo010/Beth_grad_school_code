*******Amp Sal growth rates, collapsed by average popn
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

********ftsI************
generate ftsI = 0 if ab=="Amp" & evol_condn=="Scoop"
replace ftsI = 1 if pop_id=="rMM127"
replace ftsI = 1 if pop_id=="rMM158"
generate ftsInum = 0.5 if ab=="Amp" & ftsI==0 & evol_condn=="Scoop"
replace ftsInum = 2.5 if ab=="Amp" & ftsI==1 & evol_condn=="Scoop"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & (ftsInum==0.5 | ftsInum==2.5)), by(ftsInum)

stripplot meanmono_gr if ab=="Amp" & type=="res_isol", over(ftsInum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ftsInum) jitter(5 5) ///
title("Monoculture growth rates of {it:ftsI}" "{it:S. enterica} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(green green)  ///
msymbol(circle triangle) ///
msize(vlarge vlarge) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(1) ///
legend(off) ///
xlabel(0.5 `" "Co-culture-" "evolved" "wild-type {it:ftsI}" "' 2.5 `" "Co-culture-" "evolved" "mutant {it:ftsI}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) ///
text(1.05 1.5 "p=0.1649", size(medsmall)) ///
text(1.04 1.5 "____________________", size(medium)) 

ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & (ftsInum==0.5 | ftsInum==2.5)), by(ftsInum)

stripplot meancoop_gr if ab=="Amp" & type=="res_isol", over(ftsInum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ftsInum) jitter(5 5) ///
title("Co-culture growth rates of {it:ftsI}" "{it:S. enterica} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(green green)  ///
msymbol(circle triangle) ///
msize(vlarge vlarge) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(1) ///
legend(off) ///
xlabel(0.5 `" "Co-culture-" "evolved" "wild-type {it:ftsI}" "' 2.5 `" "Co-culture-" "evolved" "mutant {it:ftsI}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
text(0.55 1.5 "p=0.3545", size(medsmall)) ///
text(0.54 1.5 "____________________", size(medium)) 

**************acrB/ompR**********************
generate acrB = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrB = 1 if pop_id=="rMM090"
replace acrB = 1 if pop_id=="rMM119"
generate acrBnum = 0.5 if ab=="Amp" & acrB==0 & evol_condn=="Smono"
replace acrBnum = 2.5 if ab=="Amp" & acrB==1 & evol_condn=="Smono"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & (acrBnum==0.5 | acrBnum==2.5)), by(acrBnum)

stripplot meanmono_gr if ab=="Amp" & type=="res_isol", over(acrBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(acrBnum) jitter(5 5) ///
title("Monoculture growth rates of {it:acrB/ompR}" "{it:S. enterica} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(vlarge vlarge) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(1) ///
legend(off) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:acrB/ompR}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:acrB/ompR}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(0(0.1)1, labsize(medlarge)) yscale(range(0 1)) ///
text(0.95 1.5 "p=0.0641", size(medsmall)) ///
text(0.94 1.5 "____________________", size(medium)) 

ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & (acrBnum==0.5 | acrBnum==2.5)), by(acrBnum)

stripplot meancoop_gr if ab=="Amp" & type=="res_isol", over(acrBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(acrBnum) jitter(5 5) ///
title("Co-culture growth rates of {it:acrB/ompR}" "{it:S. enterica} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rates", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold)  ///
msymbol(circle triangle) ///
msize(vlarge vlarge) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) aspectratio(1) ///
legend(off) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:acrB/ompR}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:acrB/ompR}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
text(0.55 1.5 "p=0.0641", size(medsmall)) ///
text(0.54 1.5 "____________________", size(medium)) 



