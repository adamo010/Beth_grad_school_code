clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*will be doing mono_grs and coop_grs in separate graphs

*****************E. coli**************************

*Step 1: generate mut/wt variables
*rne: in Emono
generate rne = 0 if ab=="Amp" & type=="res_isol" & spp=="E"
replace rne = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM010"
replace rne = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM060"

*proQ: in Ecoop
generate proQ = 0 if ab=="Amp" & type=="res_isol" & spp=="E"
replace proQ = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM137"
replace proQ = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM158"

*Step 2: generate 'over' variable for x-axis
generate dummy = 0.5 if rne==0 & evol_condn=="Emono" & type=="res_isol"
replace dummy = 2.5 if rne==1 & evol_condn=="Emono" & type=="res_isol"
replace dummy = 5.5 if proQ==0 & evol_condn=="Ecoop" & type=="res_isol"
replace dummy = 7.5 if proQ==1 & evol_condn=="Ecoop" & type=="res_isol"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Emono" & (rne==0 | rne==1)), by(rne)
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Ecoop" & (proQ==0 | proQ==1)), by(proQ)

ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Emono" & (rne==0 | rne==1)), by(rne)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Ecoop" & (proQ==0 | proQ==1)), by(proQ)

*Monoculture graph
stripplot meanmono_gr if ab=="Amp" & type=="res_isol", over(dummy) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy) jitter(5 5 5 5) ///
title("Monoculture growth rates of {it:E. coli} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("") legend(off) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue green green) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}" "wild-type {it:rne}" "' 2.5 `" "{it:E. coli}" "mutant {it:rne}" "' ///
5.5 `" "{it:E. coli}" "wild-type {it:proQ}" "' 7.5 `" "{it:E. coli}" "mutant {it:proQ}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0(0.1)1.1)) ///
text(0.68 1.5 "p=0.0641", size(medium)) ///
text(0.67 1.5 "_______________", size(medium)) ///
text(0.98 6.5 "p=0.6434", size(medium)) ///
text(0.97 6.5 "_______________", size(medium)) ///
note("*{it:rne} mutants evolved in monoculture, {it:proQ} mutants evolved in co-culture", size(small))

*Co-culture graph
stripplot meancoop_gr if ab=="Amp" & type=="res_isol", over(dummy) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy) jitter(5 5 5 5) ///
title("Co-culture growth rates of {it:E. coli} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("") legend(off) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue*0.5 midblue*0.5 green*0.5 green*0.5) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}" "wild-type {it:rne}" "' 2.5 `" "{it:E. coli}" "mutant {it:rne}" "' ///
5.5 `" "{it:E. coli}" "wild-type {it:proQ}" "' 7.5 `" "{it:E. coli}" "mutant {it:proQ}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0(0.1)0.8)) ///
text(0.68 1.5 "p=0.0641", size(medium)) ///
text(0.67 1.5 "_______________", size(medium)) ///
text(0.63 6.5 "p=0.3545", size(medium)) ///
text(0.62 6.5 "_______________", size(medium)) ///
note("*{it:rne} mutants evolved in monoculture, {it:proQ} mutants evolved in co-culture", size(small))


*****************S. enterica**************************
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*Step 1: generate mut/wt variables
*acrB: in Smono
generate acrB = 0 if ab=="Amp" & type=="res_isol" & evol_condn=="Smono"
replace acrB = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM090"
replace acrB = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM119"

*ramR: in Smono
generate ramR = 0 if ab=="Amp" & type=="res_isol" & evol_condn=="Smono"
replace ramR = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM078"
replace ramR = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM090"

*dehydratase: in Smono
generate deh = 0 if ab=="Amp" & type=="res_isol" & evol_condn=="Smono"
replace deh = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM078"
replace deh = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM090"
replace deh = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM098"
replace deh = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM108"

*metL: in Scoop
generate metL = 0 if ab=="Amp" & type=="res_isol" & evol_condn=="Scoop"
replace metL = 1 if ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & pop_id=="rMM127"
replace metL = 1 if ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & pop_id=="rMM137"

*Step 2: generate 'over' variable for x-axis
generate acrBnum = 0.5 if acrB==0 & evol_condn=="Smono" & type=="res_isol"
replace acrBnum = 2.5 if acrB==1 & evol_condn=="Smono" & type=="res_isol"
generate ramRnum = 5.5 if ramR==0 & evol_condn=="Smono" & type=="res_isol"
replace ramRnum = 7.5 if ramR==1 & evol_condn=="Smono" & type=="res_isol"
generate dehnum = 10.5 if deh==0 & evol_condn=="Smono" & type=="res_isol"
replace dehnum = 12.5 if deh==1 & evol_condn=="Smono" & type=="res_isol"
generate metLnum = 15.5 if metL==0 & evol_condn=="Scoop" & type=="res_isol"
replace metLnum = 17.5 if metL==1 & evol_condn=="Scoop" & type=="res_isol"

ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (acrB==0 | acrB==1)), by(acrB)
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (ramR==0 | ramR==1)), by(ramR)
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (deh==0 | deh==1)), by(deh)
ranksum meanmono_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (metL==0 | metL==1)), by(metL)

ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (acrB==0 | acrB==1)), by(acrB)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (ramR==0 | ramR==1)), by(ramR)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (deh==0 | deh==1)), by(deh)
ranksum meancoop_gr if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (metL==0 | metL==1)), by(metL)

*Monoculture graph: fix the aspect ratio
twoway (scatter meanmono_gr acrBnum if(ab=="Amp" & type=="res_isol" & acrBnum==0.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr acrBnum if(ab=="Amp" & type=="res_isol" & acrBnum==2.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr ramRnum if(ab=="Amp" & type=="res_isol" & ramRnum==5.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr ramRnum if(ab=="Amp" & type=="res_isol" & ramRnum==7.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr dehnum if(ab=="Amp" & type=="res_isol" & dehnum==10.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr dehnum if(ab=="Amp" & type=="res_isol" & dehnum==12.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr metLnum if(ab=="Amp" & type=="res_isol" & metLnum==15.5), connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr metLnum if(ab=="Amp" & type=="res_isol" & metLnum==17.5), connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), /// 
title("Monoculture growth rates of {it:S. enterica} mutants evolved in Ampicillin", size(medlarge) color(black) margin(medium))  ///
ytitle("Monoculture growth rate", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) xsize(9) ysize(4) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type" "{it:acrB/ompR}" "' 2.5 `" "{it:S. enterica}" "mutant" "{it:acrB/ompR}" "' ///
5.5 `" "{it:S. enterica}" "wild-type" "{it:ramR}" "' 7.5 `" "{it:S. enterica}" "mutant" "{it:ramR}" "' ///
10.5 `" "{it:S. enterica}" "wild-type" "dehydratase" "' 12.5 `" "{it:S. enterica}" "mutant" "dehydratase" "' ///
15.5 `" "{it:S. enterica}" "wild-type" "{it:metL}" "' 17.5 `" "{it:S. enterica}" "wild-type" "{it:metL}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 19)) xline(4, lcolor(black) lwidth(medium)) xline(9, lcolor(black) lwidth(medium)) ///
xline(14, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0(0.1)1.1)) ///
text(0.98 1.5 "p=0.0641", size(medsmall)) ///
text(0.97 1.5 "__________", size(medsmall)) ///
text(0.98 6.5 "p=0.1649", size(medsmall)) ///
text(0.97 6.5 "__________", size(medsmall)) ///
text(0.98 11.5 "p=0.6434", size(medsmall)) ///
text(0.97 11.5 "__________", size(medsmall)) ///
text(1.05 16.5 "p=0.3545", size(medsmall)) ///
text(1.04 16.5 "__________", size(medsmall)) ///
note("*{it:acrB/ompR}, {it:ramR}, and dehydratase mutants evolved in monoculture, {it:metL} mutants evolved in co-culture", size(small))

*Co-culture graph
twoway (scatter meancoop_gr acrBnum if(ab=="Amp" & type=="res_isol" & acrBnum==0.5), connect(i) ///
mcolor(gold*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr acrBnum if(ab=="Amp" & type=="res_isol" & acrBnum==2.5), connect(i) ///
mcolor(gold*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ramRnum if(ab=="Amp" & type=="res_isol" & ramRnum==5.5), connect(i) ///
mcolor(gold*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr ramRnum if(ab=="Amp" & type=="res_isol" & ramRnum==7.5), connect(i) ///
mcolor(gold*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr dehnum if(ab=="Amp" & type=="res_isol" & dehnum==10.5), connect(i) ///
mcolor(gold*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr dehnum if(ab=="Amp" & type=="res_isol" & dehnum==12.5), connect(i) ///
mcolor(gold*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr metLnum if(ab=="Amp" & type=="res_isol" & metLnum==15.5), connect(i) ///
mcolor(green*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr metLnum if(ab=="Amp" & type=="res_isol" & metLnum==17.5), connect(i) ///
mcolor(green*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), /// 
title("Co-culture growth rates of {it:S. enterica} mutants evolved in Ampicillin", size(medlarge) color(black) margin(medium))  ///
ytitle("Co-culture growth rate", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) xsize(9) ysize(4) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type" "{it:acrB/ompR}" "' 2.5 `" "{it:S. enterica}" "mutant" "{it:acrB/ompR}" "' ///
5.5 `" "{it:S. enterica}" "wild-type" "{it:ramR}" "' 7.5 `" "{it:S. enterica}" "mutant" "{it:ramR}" "' ///
10.5 `" "{it:S. enterica}" "wild-type" "dehydratase" "' 12.5 `" "{it:S. enterica}" "mutant" "dehydratase" "' ///
15.5 `" "{it:S. enterica}" "wild-type" "{it:metL}" "' 17.5 `" "{it:S. enterica}" "wild-type" "{it:metL}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 19)) xline(4, lcolor(black) lwidth(medium)) xline(9, lcolor(black) lwidth(medium)) ///
xline(14, lcolor(black) lwidth(medium)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0(0.1)0.7)) ///
text(0.58 1.5 "p=0.0641", size(medsmall)) ///
text(0.57 1.5 "__________", size(medsmall)) ///
text(0.58 6.5 "p=0.3545", size(medsmall)) ///
text(0.57 6.5 "__________", size(medsmall)) ///
text(0.58 11.5 "p=0.6434", size(medsmall)) ///
text(0.57 11.5 "__________", size(medsmall)) ///
text(0.52 16.5 "p=0.6434", size(medsmall)) ///
text(0.51 16.5 "__________", size(medsmall)) ///
note("*{it:acrB/ompR}, {it:ramR}, and dehydratase mutants evolved in monoculture, {it:metL} mutants evolved in co-culture", size(small))









