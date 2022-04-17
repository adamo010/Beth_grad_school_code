*Figure 5D: 
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

********rpoB************
generate rpoB = 1 if ab=="Rif" & type=="res_isol"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA036" & type=="res_isol"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA056" & type=="res_isol"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA083" & type=="res_isol"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA115" & type=="res_isol" 
replace rpoB = 0 if ab=="Rif" & pop_id=="BA125" & type=="res_isol" & spp=="S"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA145" & type=="res_isol" & spp=="S"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA155" & type=="res_isol" 
replace rpoB = 0 if ab=="Rif" & pop_id=="BA165" & type=="res_isol" & spp=="S"
replace rpoB = 0 if ab=="Rif" & pop_id=="BA176" & type=="res_isol" & spp=="E"

generate ErpoBnum = 0.5 if ab=="Rif" & rpoB==0 & evol_condn=="Emono" & type=="res_isol"
replace ErpoBnum = 2.5 if ab=="Rif" & rpoB==1 & evol_condn=="Emono" & type=="res_isol"
replace ErpoBnum = 5.5 if ab=="Rif" & rpoB==0 & evol_condn=="Ecoop" & type=="res_isol"
replace ErpoBnum = 7.5 if ab=="Rif" & rpoB==1 & evol_condn=="Ecoop" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (ErpoBnum==0.5 | ErpoBnum==2.5)), by(rpoB)
ranksum meanmic if(ab=="Rif" & type=="res_isol" & (ErpoBnum==5.5 | ErpoBnum==7.5)), by(rpoB)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(ErpoBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(ErpoBnum) jitter(5 5 5 5) ///
title("log{subscript:2}MICs of {it:E. coli} {it:rpoB} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MICs", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue purple purple) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:rpoB}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:rpoB}" "' ///
5.5 `" "Co-culture-" "evolved" "wild-type {it:rpoB}" "' 7.5 `" "Co-culture-" "evolved" "mutant {it:rpoB}" "', labsize(medium)) ///
legend(off) ///
graphregion(fcolor(white)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.7 1.5 "p=0.0491", size(medium)) ///
text(7.6 1.5 "_______________", size(medium)) ///
text(6.5 6.5 "p=0.0641", size(medium)) ///
text(6.4 6.5 "_______________", size(medium))

***********
generate SrpoBnum = 0.5 if ab=="Rif" & rpoB==0 & evol_condn=="Smono" & type=="res_isol"
replace SrpoBnum = 2.5 if ab=="Rif" & rpoB==1 & evol_condn=="Smono" & type=="res_isol"
replace SrpoBnum = 5.5 if ab=="Rif" & rpoB==0 & evol_condn=="Scoop" & type=="res_isol"
replace SrpoBnum = 7.5 if ab=="Rif" & rpoB==1 & evol_condn=="Scoop" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (SrpoBnum==0.5 | SrpoBnum==2.5)), by(rpoB)
ranksum meanmic if(ab=="Rif" & type=="res_isol" & (SrpoBnum==5.5 | SrpoBnum==7.5)), by(rpoB)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(SrpoBnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(SrpoBnum) jitter(5 5 5 5) ///
title("log{subscript:2}MICs of {it:S. enterica} {it:rpoB} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MICs", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold green green) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:rpoB}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:rpoB}" "' ///
5.5 `" "Co-culture-" "evolved" "wild-type {it:rpoB}" "' 7.5 `" "Co-culture-" "evolved" "mutant {it:rpoB}" "', labsize(medium)) ///
legend(off) ///
graphregion(fcolor(white)) ///
ylabel(0(1)9, labsize(medlarge)) yscale(range(0 9)) ///
text(8.7 1.5 "p=0.0641", size(medium)) ///
text(8.6 1.5 "_______________", size(medium)) ///
text(8.5 6.5 "p=0.0641", size(medium)) ///
text(8.4 6.5 "_______________", size(medium))
