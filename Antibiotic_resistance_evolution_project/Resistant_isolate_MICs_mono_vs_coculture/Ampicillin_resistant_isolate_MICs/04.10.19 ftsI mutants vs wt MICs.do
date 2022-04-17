clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\04.10.19 actual ftsI mutant grs and mics.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

*******ftsI: if =1, mutation is present
generate ftsI = 0 if ab=="Amp" & type=="res_isol" & spp=="S"
replace ftsI = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM127"
replace ftsI = 1 if ab=="Amp" & type=="res_isol" & pop_id=="rMM158"

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
xlabel(0.5 `" "Co-culture-" "evolved" "wild-type {it:ftsI}" "' 2.5 `" "Co-culture-" "evolved" "mutant {it:ftsI}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3)) ///
ylabel(-3(1)4, labsize(medlarge)) yscale(range(-3 4)) ///
text(3.6 1.5 "p=0.0603", size(medium)) ///
text(3.5 1.5 "____________________", size(medium)) 
