clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

*New variables here: pop_id, ab, type(abfree_isol, res_isol), evol_condn(Emono/Smono/Ecoop/Scoop), growth_condn(mono), spp(E/S),
*rep(1-6), meancoop_gr(#)

*Want to create new variables for yoaE, ompF, ftsI, ompR/acrB: first two are in both mono and coop-evolved, ftsI is only in coop, ompR/acrB is only in mono

*******************yoaE*************************
generate yoaE = 0 if ab=="Amp" & spp=="S"
replace yoaE = 1 if pop_id=="rMM090"
replace yoaE = 1 if pop_id=="rMM108"
replace yoaE = 1 if pop_id=="rMM137"
replace yoaE = 1 if pop_id=="rMM167"
replace yoaE = 1 if pop_id=="rMM176"
generate yoaEnum = 0.5 if ab=="Amp" & yoaE==0 & evol_condn=="Smono"
replace yoaEnum = 2.5 if ab=="Amp" & yoaE==1 & evol_condn=="Smono"
replace yoaEnum = 5 if ab=="Amp" & yoaE==0 & evol_condn=="Scoop"
replace yoaEnum = 7 if ab=="Amp" & yoaE==1 & evol_condn=="Scoop"

ranksum meanmic if(ab=="Amp" & type=="res_isol" & (yoaEnum==0.5 | yoaEnum==2.5)), by(yoaEnum)
ranksum meanmic if(ab=="Amp" & type=="res_isol" & (yoaEnum==5 | yoaEnum==7)), by(yoaEnum)

stripplot meanmic if ab=="Amp" & type=="res_isol", over(yoaEnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(yoaEnum) jitter(5 5 5 5) ///
title("MICs of {it:yoaE} {it:S. enterica} mutants in Ampicillin", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Ampicillin, {&mu}g/mL", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold green green)  ///
msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:yoaE}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:yoaE}" "' ///
5 `" "Co-culture-" "evolved" "wild-type {it:yoaE}" "' 7 `" "Co-culture-" "evolved" "mutant {it:yoaE}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 8)) ///
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3 3)) ///
text(2.7 1.5 "p=0.6228", size(medium)) ///
text(2.6 1.5 "_______________", size(medium)) ///
text(1.8 6 "p=0.5002", size(medium)) ///
text(1.7 6 "_______________", size(medium))

*******************yoaE*************************
generate ompF = 0 if ab=="Amp" & spp=="S"
replace ompF = 1 if pop_id=="rMM067"
replace ompF = 1 if pop_id=="rMM078"
replace ompF = 1 if pop_id=="rMM108"
replace ompF = 1 if pop_id=="rMM146"
generate ompFnum = 0.5 if ab=="Amp" & ompF==0 & evol_condn=="Smono"
replace ompFnum = 2.5 if ab=="Amp" & ompF==1 & evol_condn=="Smono"
replace ompFnum = 5 if ab=="Amp" & ompF==0 & evol_condn=="Scoop"
replace ompFnum = 7 if ab=="Amp" & ompF==1 & evol_condn=="Scoop"

ranksum meanmic if(ab=="Amp" & type=="res_isol" & (ompFnum==0.5 | ompFnum==2.5)), by(ompFnum)
ranksum meanmic if(ab=="Amp" & type=="res_isol" & (ompFnum==5 | ompFnum==7)), by(ompFnum)

stripplot meanmic if ab=="Amp" & type=="res_isol", over(ompFnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ompFnum) jitter(5 5 5 5) ///
title("MICs of {it:ompF} {it:S. enterica} mutants in Ampicillin", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Ampicillin, {&mu}g/mL", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold green green)  ///
msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) ///
mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:ompF}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:ompF}" "' ///
5 `" "Co-culture-" "evolved" "wild-type {it:ompF}" "' 7 `" "Co-culture-" "evolved" "mutant {it:ompF}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 8)) ///
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3 3)) ///
text(2.7 1.5 "p=0.4867", size(medium)) ///
text(2.6 1.5 "_______________", size(medium)) ///
text(1.8 6 "p=0.2278", size(medium)) ///
text(1.7 6 "_______________", size(medium))

**************ftsI**********************
generate ftsI = 0 if ab=="Amp" & evol_condn=="Scoop"
replace ftsI = 1 if pop_id=="rMM127"
replace ftsI = 1 if pop_id=="rMM158"
generate ftsInum = 0.5 if ab=="Amp" & ftsI==0 & evol_condn=="Scoop"
replace ftsInum = 2.5 if ab=="Amp" & ftsI==1 & evol_condn=="Scoop"

ranksum meanmic if(ab=="Amp" & type=="res_isol" & (ftsInum==0.5 | ftsInum==2.5)), by(ftsInum)

stripplot meanmic if ab=="Amp" & type=="res_isol", over(ftsInum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ftsInum) jitter(5 5) ///
title("MICs of {it:ftsI} {it:S. enterica}" "mutants in Ampicillin", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Ampicillin, {&mu}g/mL", size(medlarge)) ///
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
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:ftsI}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:ftsI}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3 3)) ///
text(1.8 1.5 "p=0.0952", size(medium)) ///
text(1.7 1.5 "____________________", size(medium)) 

**********************acrB***********************
generate acrB = 0 if ab=="Amp" & evol_condn=="Smono"
replace acrB = 1 if pop_id=="rMM090"
replace acrB = 1 if pop_id=="rMM119"
generate acrBnum = 0.5 if ab=="Amp" & acrB==0 & evol_condn=="Smono"
replace acrBnum = 2.5 if ab=="Amp" & acrB==1 & evol_condn=="Smono"

ranksum meanmic if(ab=="Amp" & type=="res_isol" & (acrBnum==0.5 | acrBnum==2.5)), by(acrBnum)

stripplot meanmic if ab=="Amp" & type=="res_isol", over(acrBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(acrBnum) jitter(5 5) ///
title("MICs of {it:acrB/ompR} {it:S. enterica}" "mutants in Ampicillin", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Ampicillin, {&mu}g/mL", size(medlarge)) ///
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
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3 3)) ///
text(2.6 1.5 "p=0.1400", size(medium)) ///
text(2.5 1.5 "____________________", size(medium)) 


**********************metL***********************
generate metL = 0 if ab=="Amp" & evol_condn=="Scoop"
replace metL = 1 if pop_id=="rMM127"
replace metL = 1 if pop_id=="rMM137"
generate metLnum = 0.5 if ab=="Amp" & metL==0 & evol_condn=="Scoop"
replace metLnum = 2.5 if ab=="Amp" & metL==1 & evol_condn=="Scoop"

ranksum meanmic if(ab=="Amp" & type=="res_isol" & (metLnum==0.5 | metLnum==2.5)), by(metLnum)

stripplot meanmic if ab=="Amp" & type=="res_isol", over(metLnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(metLnum) jitter(5 5)  ///
title("MICs of {it:metL} {it:S. enterica}" "mutants in Ampicillin", size(large) color(black) margin(zero))  ///
ytitle("log{subscript:2} MIC in Ampicillin, {&mu}g/mL", size(medlarge)) ///
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
xlabel(0.5 `" "Co-culture-" "evolved" "wild-type {it:metL}" "' 2.5 `" "Co-culture-" "evolved" "mutant {it:metL}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(-3(1)3, labsize(medlarge)) yscale(range(-3 3)) ///
text(2.6 1.5 "p=0.1400", size(medium)) ///
text(2.5 1.5 "____________________", size(medium)) 
