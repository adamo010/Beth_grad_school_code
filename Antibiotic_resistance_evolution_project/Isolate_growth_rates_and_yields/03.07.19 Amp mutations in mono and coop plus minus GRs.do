clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*ompF: in Smono
generate ompF = 0 if ab=="Amp" & type=="res_isol" & spp=="S"
replace ompF = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM067"
replace ompF = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM078"
replace ompF = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM108"
replace ompF = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM146"

generate ompFnum = 0.5 if ompF==0 & evol_condn=="Smono" & type=="res_isol"
replace ompFnum = 2.5 if ompF==1 & evol_condn=="Smono" & type=="res_isol"
replace ompFnum = 5.5 if ompF==0 & evol_condn=="Scoop" & type=="res_isol"
replace ompFnum = 7.5 if ompF==1 & evol_condn=="Scoop" & type=="res_isol"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (ompFnum==0.5 | ompFnum==2.5)), by(ompF)
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (ompFnum==5.5 | ompFnum==7.5)), by(ompF)

twoway (scatter meanmono_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==0.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==2.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==5.5), connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==7.5), connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
title("Monoculture growth rates of {it:S. enterica}" "{it:ompF} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:S. enterica}," "wild-type {it:ompF}" "' 2.5 `" "Monoculture-" "evolved" "{it:S. enterica}" "mutant {it:ompF}" "' ///
5.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "wild-type {it:ompF}" "' 7.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "mutant {it:ompF}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0(0.1)1.1)) ///
text(1.01 1.5 "p=0.1266", size(medsmall)) ///
text(1.00 1.5 "__________", size(medsmall)) ///
text(1.05 6.5 "p=0.3798", size(medsmall)) ///
text(1.04 6.5 "__________", size(medsmall)) 

ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (ompFnum==0.5 | ompFnum==2.5)), by(ompF)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (ompFnum==5.5 | ompFnum==7.5)), by(ompF)

twoway (scatter meancoop_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==0.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==2.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==5.5), connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ompFnum if(ab=="Amp" & type=="res_isol" & ompFnum==7.5), connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
title("Co-culture growth rates of {it:S. enterica}" "{it:ompF} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:S. enterica}," "wild-type {it:ompF}" "' 2.5 `" "Monoculture-" "evolved" "{it:S. enterica}" "mutant {it:ompF}" "' ///
5.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "wild-type {it:ompF}" "' 7.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "mutant {it:ompF}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0(0.1)0.7)) ///
text(0.61 1.5 "p=0.5127", size(medsmall)) ///
text(0.60 1.5 "__________", size(medsmall)) ///
text(0.51 6.5 "p=0.3798", size(medsmall)) ///
text(0.50 6.5 "__________", size(medsmall)) 

***yoaE
generate yoaE = 0 if ab=="Amp" & type=="res_isol" & spp=="S"
replace yoaE = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM090"
replace yoaE = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM108"
replace yoaE = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM167"

generate yoaEnum = 0.5 if yoaE==0 & evol_condn=="Smono" & type=="res_isol"
replace yoaEnum = 2.5 if yoaE==1 & evol_condn=="Smono" & type=="res_isol"
replace yoaEnum = 5.5 if yoaE==0 & evol_condn=="Scoop" & type=="res_isol"
replace yoaEnum = 7.5 if yoaE==1 & evol_condn=="Scoop" & type=="res_isol"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (yoaEnum==0.5 | yoaEnum==2.5)), by(yoaE)
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (yoaEnum==5.5 | yoaEnum==7.5)), by(yoaE)

twoway (scatter meanmono_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==0.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==2.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==5.5), connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==7.5), connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
title("Monoculture growth rates of {it:S. enterica}" "{it:yoaE} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:S. enterica}," "wild-type {it:yoaE}" "' 2.5 `" "Monoculture-" "evolved" "{it:S. enterica}" "mutant {it:yoaE}" "' ///
5.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "wild-type {it:yoaE}" "' 7.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "mutant {it:yoaE}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0(0.1)1.1)) ///
text(1.01 1.5 "p=0.6434", size(medsmall)) ///
text(1.00 1.5 "__________", size(medsmall)) ///
text(1.05 6.5 "p=0.3798", size(medsmall)) ///
text(1.04 6.5 "__________", size(medsmall)) 

ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (yoaEnum==0.5 | yoaEnum==2.5)), by(yoaE)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (yoaEnum==5.5 | yoaEnum==7.5)), by(yoaE)

twoway (scatter meancoop_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==0.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==2.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==5.5), connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr yoaEnum if(ab=="Amp" & type=="res_isol" & yoaEnum==7.5), connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
title("Co-culture growth rates of {it:S. enterica}" "{it:yoaE} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "Monoculture-" "evolved" "{it:S. enterica}," "wild-type {it:yoaE}" "' 2.5 `" "Monoculture-" "evolved" "{it:S. enterica}" "mutant {it:yoaE}" "' ///
5.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "wild-type {it:yoaE}" "' 7.5 `" "Co-culture-" "evolved" "{it:S. enterica}" "mutant {it:yoaE}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0(0.1)0.7)) ///
text(0.61 1.5 "p=0.6434", size(medsmall)) ///
text(0.60 1.5 "__________", size(medsmall)) ///
text(0.51 6.5 "p=0.1432", size(medsmall)) ///
text(0.50 6.5 "__________", size(medsmall)) 
