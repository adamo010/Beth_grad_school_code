clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
drop in 49/54
*This removes BA081 and BA083, Rif Smono rep3
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

********tail-specific protease prc************
generate prc = 0 if ab=="Rif" & type=="res_isol"
replace prc =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA010"
replace prc =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA036"
replace prc =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA145" & spp=="E"
replace prc =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA155" & spp=="E"
replace prc =1 if ab=="Rif" & type=="res_isol" & pop_id=="BA176" & spp=="E"

generate prcnum = 0.5 if ab=="Rif" & prc==0 & evol_condn=="Emono" & type=="res_isol"
replace prcnum = 2.5 if ab=="Rif" & prc==1 & evol_condn=="Emono" & type=="res_isol"
replace prcnum = 5.5 if ab=="Rif" & prc==0 & evol_condn=="Ecoop" & type=="res_isol"
replace prcnum = 7.5 if ab=="Rif" & prc==1 & evol_condn=="Ecoop" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (prcnum==0.5 | prcnum==2.5)), by(prc)
ranksum meanmic if(ab=="Rif" & type=="res_isol" & (prcnum==5.5 | prcnum==7.5)), by(prc)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(prcnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(prcnum) jitter(5 5 5 5) ///
title("log{subscript:2}MICs of {it:E. coli} tail-specific protease" "mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MICs", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue purple purple) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
xlabel(0.5 `" "Monoculture-" "evolved" "wild-type {it:prc}" "' 2.5 `" "Monoculture-" "evolved" "mutant {it:prc}" "' ///
5.5 `" "Co-culture-" "evolved" "wild-type {it:prc}" "' 7.5 `" "Co-culture-" "evolved" "mutant {it:prc}" "', labsize(medium)) ///
legend(off) ///
graphregion(fcolor(white)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.7 1.5 "p=0.6228", size(medium)) ///
text(7.6 1.5 "_______________", size(medium)) ///
text(6.7 6.5 "p=0.1266", size(medium)) ///
text(6.6 6.5 "_______________", size(medium))
