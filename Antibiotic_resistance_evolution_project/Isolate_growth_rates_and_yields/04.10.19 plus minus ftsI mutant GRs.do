clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\04.10.19 actual ftsI mutant grs and mics.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*******ftsI: if =1, mutation is present
generate ftsI = 0 if ab=="Amp" & type=="res_isol" & spp=="S"
replace ftsI = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM127"
replace ftsI = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM158"

*ftsInum1 is for mono grs, ftsInum2 is for coop grs (for graphing purposes only)
generate ftsInum1 = 0.5 if ab=="Amp" & ftsI==0 & evol_condn=="Scoop" & type=="res_isol"
replace ftsInum1 = 2.5 if ab=="Amp" & ftsI==1 & evol_condn=="Scoop" & type=="res_isol"
generate ftsInum2 = 5.5 if ab=="Amp" & ftsI==0 & evol_condn=="Scoop" & type=="res_isol"
replace ftsInum2 = 7.5 if ab=="Amp" & ftsI==1 & evol_condn=="Scoop" & type=="res_isol"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & (ftsInum1==0.5 | ftsInum1==2.5)), by(ftsI)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & (ftsInum2==5.5 | ftsInum2==7.5)), by(ftsI)

*need to add stats and adjust y-axes on this; also needs a title
twoway (scatter meanmono_gr ftsInum1 if(ab=="Amp" & type=="res_isol" & ftsInum1==0.5), c(1) yaxis(1) connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr ftsInum1 if(ab=="Amp" & type=="res_isol" & ftsInum1==2.5), c(1) yaxis(1) connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ftsInum2 if(ab=="Amp" & type=="res_isol" & ftsInum2==5.5), c(1) yaxis(2) connect(i) ///
mcolor(green*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ftsInum2 if(ab=="Amp" & type=="res_isol" & ftsInum2==7.5), c(1) yaxis(2) connect(i) ///
mcolor(green*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
legend(off) ///
title("Growth rates of {it:S. enterica} {it:ftsI} mutants in Ampicillin", size(medlarge) color(black) margin(zero))  ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:S. enterica}," "wild-type" "{it:ftsI}" "' ///
2.5 `" "{it:S. enterica}," "mutant" "{it:ftsI}" "' ///
5.5 `" "{it:S. enterica}," "wild-type" "{it:ftsI}" "' ///
7.5 `" "{it:S. enterica}," "mutant" "{it:ftsI}" "', labsize(medium)) ///
ytitle("Monoculture growth rates", axis(1) size(medlarge)) ytitle("Co-culture growth rates", axis(2) size(medlarge)) ///
yscale(axis(1) range(0(0.1)1.2)) ytick(#13, axis(1)) yscale(axis(2) range(0(0.1)1.2)) ytick(#13, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
text(1.06 1.5 "p=0.0641", size(medium)) ///
text(1.05 1.5 "_______________", size(medium)) ///
text(0.58 6.5 "p=0.3545", size(medium)) ///
text(0.57 6.5 "_______________", size(medium))
