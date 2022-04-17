clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

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

ranksum meanmic if(ab=="Amp" & type=="res_isol" & evol_condn=="Emono" & (rne==0 | rne==1)), by(rne)
ranksum meanmic if(ab=="Amp" & type=="res_isol" & evol_condn=="Ecoop" & (proQ==0 | proQ==1)), by(proQ)

*Monoculture graph
stripplot meanmic if ab=="Amp" & type=="res_isol", over(dummy) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(dummy) jitter(5 5 5 5) ///
title("log{subscript:2}MICs of {it:E. coli} mutants evolved in Ampicillin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MIC", size(medlarge)) ///
xtitle("") legend(off) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue green green) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}" "wild-type {it:rne}" "' 2.5 `" "{it:E. coli}" "mutant {it:rne}" "' ///
5.5 `" "{it:E. coli}" "wild-type {it:proQ}" "' 7.5 `" "{it:E. coli}" "mutant {it:proQ}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
ylabel(-2(1)3, labsize(medlarge)) yscale(range(-2(1)3)) ///
text(2.38 1.5 "p=0.1649", size(medium)) ///
text(2.37 1.5 "_______________", size(medium)) ///
text(1.05 6.5 "p=0.3476", size(medium)) ///
text(1.04 6.5 "_______________", size(medium)) ///
note("*{it:rne} mutants evolved in monoculture, {it:proQ} mutants evolved in co-culture", size(small))

*****************S. enterica**************************
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

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

ranksum meanmic if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (acrB==0 | acrB==1)), by(acrB)
ranksum meanmic if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (ramR==0 | ramR==1)), by(ramR)
ranksum meanmic if(ab=="Amp" & type=="res_isol" & evol_condn=="Smono" & (deh==0 | deh==1)), by(deh)
ranksum meanmic if(ab=="Amp" & type=="res_isol" & evol_condn=="Scoop" & (metL==0 | metL==1)), by(metL)

*Monoculture graph: fix the aspect ratio
twoway (scatter meanmic acrBnum if(ab=="Amp" & type=="res_isol" & acrBnum==0.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic acrBnum if(ab=="Amp" & type=="res_isol" & acrBnum==2.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic ramRnum if(ab=="Amp" & type=="res_isol" & ramRnum==5.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic ramRnum if(ab=="Amp" & type=="res_isol" & ramRnum==7.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic dehnum if(ab=="Amp" & type=="res_isol" & dehnum==10.5), connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic dehnum if(ab=="Amp" & type=="res_isol" & dehnum==12.5), connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic metLnum if(ab=="Amp" & type=="res_isol" & metLnum==15.5), connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmic metLnum if(ab=="Amp" & type=="res_isol" & metLnum==17.5), connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), /// 
title("log{subscript:2}MICs of {it:S. enterica} mutants evolved in Ampicillin", size(medlarge) color(black) margin(medium))  ///
ytitle("log{subscript:2}MIC", size(medlarge)) ///
xtitle("") legend(off) graphregion(fcolor(white)) plotregion(margin(zero)) xsize(9) ysize(4) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type" "{it:acrB/ompR}" "' 2.5 `" "{it:S. enterica}" "mutant" "{it:acrB/ompR}" "' ///
5.5 `" "{it:S. enterica}" "wild-type" "{it:ramR}" "' 7.5 `" "{it:S. enterica}" "mutant" "{it:ramR}" "' ///
10.5 `" "{it:S. enterica}" "wild-type" "dehydratase" "' 12.5 `" "{it:S. enterica}" "mutant" "dehydratase" "' ///
15.5 `" "{it:S. enterica}" "wild-type" "{it:metL}" "' 17.5 `" "{it:S. enterica}" "wild-type" "{it:metL}" "', labsize(medsmall)) ///
ylabel(#10, angle(horizontal) labsize(large)) ///
xscale(range(-1 19)) xline(4, lcolor(black) lwidth(medium)) xline(9, lcolor(black) lwidth(medium)) ///
xline(14, lcolor(black) lwidth(medium)) ///
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3(1)3)) ///
text(2.55 1.5 "p=0.1400", size(medsmall)) ///
text(2.54 1.5 "__________", size(medsmall)) ///
text(2.55 6.5 "p=0.0491", size(medsmall)) ///
text(2.54 6.5 "__________", size(medsmall)) ///
text(2.55 11.5 "p=0.6228", size(medsmall)) ///
text(2.55 11.5 "__________", size(medsmall)) ///
text(1.55 16.5 "p=0.6336", size(medsmall)) ///
text(1.54 16.5 "__________", size(medsmall)) ///
note("*{it:acrB/ompR}, {it:ramR}, and dehydratase mutants evolved in monoculture, {it:metL} mutants evolved in co-culture", size(small))

