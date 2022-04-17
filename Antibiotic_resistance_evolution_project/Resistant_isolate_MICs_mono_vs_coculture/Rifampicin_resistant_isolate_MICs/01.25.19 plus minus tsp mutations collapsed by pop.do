clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

********tail-specific protease************
generate tsp = 0 if ab=="Rif" & type=="res_isol"
replace tsp =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA010"
replace tsp =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA036"
replace tsp =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA145" & spp=="E"
replace tsp =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA155" & spp=="E"
replace tsp =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA176" & spp=="E"

generate tspnum = 0.5 if ab=="Rif" & tsp==0 & evol_condn=="Emono" & type=="res_isol"
replace tspnum = 2.5 if ab=="Rif" & tsp==1 & evol_condn=="Emono" & type=="res_isol"
replace tspnum = 5.5 if ab=="Rif" & tsp==0 & evol_condn=="Ecoop" & type=="res_isol"
replace tspnum = 7.5 if ab=="Rif" & tsp==1 & evol_condn=="Ecoop" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (tspnum==0.5 | tspnum==2.5)), by(tsp)
ranksum meanmic if(ab=="Rif" & type=="res_isol" & (tspnum==5.5 | tspnum==7.5)), by(tsp)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(tspnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(tspnum) jitter(5 5 5 5) ///
title("log{subscript:2}MICs of {it:E. coli} tail-specific protease" "mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MICs", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue purple purple) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:tsp}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:tsp}" "' ///
5.5 `" "Co-culture-" "evolved" "wild-type {it:tsp}" "' 7.5 `" "Co-culture-" "evolved" "mutant {it:tsp}" "', labsize(medium)) ///
legend(off) ///
graphregion(fcolor(white)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.7 1.5 "p=0.6228", size(medium)) ///
text(7.6 1.5 "_______________", size(medium)) ///
text(6.7 6.5 "p=0.1266", size(medium)) ///
text(6.6 6.5 "_______________", size(medium))
