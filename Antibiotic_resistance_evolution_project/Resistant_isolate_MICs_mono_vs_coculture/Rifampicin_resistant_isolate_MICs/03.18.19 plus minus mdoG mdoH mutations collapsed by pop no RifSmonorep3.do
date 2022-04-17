clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
drop in 49/54
*This removes BA081 and BA083, Rif Smono rep3
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

*******mdoG: if =1, mutation is present
generate mdoG = 0 if ab=="Rif" & type=="res_isol" & spp=="E"
replace mdoG = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA030"
replace mdoG = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA036"
replace mdoG = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA049"

generate mdoGnum = 0.5 if ab=="Rif" & mdoG==0 & evol_condn=="Emono" & type=="res_isol"
replace mdoGnum = 2.5 if ab=="Rif" & mdoG==1 & evol_condn=="Emono" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (mdoGnum==0.5 | mdoGnum==2.5)), by(mdoG)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(mdoGnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdoGnum) jitter(5 5) ///
title("log{subscript:2}MIC of {it:E. coli} {it:mdoG}" "mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MIC", size(medlarge)) ///
xtitle("") legend(off) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) plotregion(margin(zero)) aspectratio(1.25) ///
xlabel(0.5 `" "{it:E. coli}" "wild-type {it:mdoG}" "' 2.5 `" "{it:E. coli}" "mutant {it:mdoG}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.68 1.5 "p=0.8166", size(medium)) ///
text(7.67 1.5 "_______________", size(medium))


*******mdoHE: if =1, mutation is present
generate mdoHE = 0 if ab=="Rif" & type=="res_isol" & spp=="E"
replace mdoHE = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA010"
replace mdoHE = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA056"

generate mdoHEnum = 0.5 if ab=="Rif" & mdoHE==0 & evol_condn=="Emono" & type=="res_isol"
replace mdoHEnum = 2.5 if ab=="Rif" & mdoHE==1 & evol_condn=="Emono" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (mdoHEnum==0.5 | mdoHEnum==2.5)), by(mdoHE)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(mdoHEnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdoHEnum) jitter(5 5) ///
title("log{subscript:2}MIC of {it:E. coli} {it:mdoH}" "mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MIC", size(medlarge)) ///
xtitle("") legend(off) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) plotregion(margin(zero)) aspectratio(1.25) ///
xlabel(0.5 `" "{it:E. coli}" "wild-type {it:mdoH}" "' 2.5 `" "{it:E. coli}" "mutant {it:mdoH}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.68 1.5 "p>0.999", size(medium)) ///
text(7.67 1.5 "_______________", size(medium))

*******mdoHS: if =1, mutation is present
generate mdoHS = 0 if ab=="Rif" & type=="res_isol" & spp=="S"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA067"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA079"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA098"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA115"

generate mdoHSnum = 0.5 if ab=="Rif" & mdoHS==0 & evol_condn=="Smono" & type=="res_isol"
replace mdoHSnum = 2.5 if ab=="Rif" & mdoHS==1 & evol_condn=="Smono" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (mdoHSnum==0.5 | mdoHSnum==2.5)), by(mdoHS)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(mdoHSnum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdoHSnum) jitter(5 5) ///
title("log{subscript:2}MIC of {it:S. enterica} {it:mdoH}" "mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MIC", size(medlarge)) ///
xtitle("") legend(off) ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(gold gold) msymbol(circle triangle) ///
msize(vlarge vlarge) mlcolor(black black) mlwidth(thin thin) ///
graphregion(fcolor(white)) plotregion(margin(zero)) aspectratio(1.25) ///
xlabel(0.5 `" "{it:S. enterica}" "wild-type {it:mdoH}" "' 2.5 `" "{it:S. enterica}" "mutant {it:mdoH}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 3.5)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.68 1.5 "p>0.999", size(medium)) ///
text(7.67 1.5 "_______________", size(medium))



