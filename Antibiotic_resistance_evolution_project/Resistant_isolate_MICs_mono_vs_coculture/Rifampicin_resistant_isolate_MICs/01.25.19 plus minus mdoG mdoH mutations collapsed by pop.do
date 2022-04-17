clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
generate log2mic = ln(mic)/ln(2) 
collapse (mean) meanmic= log2mic, by(pop_id ab type evol_condn growth_condn spp rep)

generate mdo = 0 if ab=="Rif" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA030" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA036" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA049" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA067" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA079" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA083" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA098" & type=="res_isol"
replace mdo = 1 if ab=="Rif" & pop_id=="BA115" & type=="res_isol"

generate mdonum = 0.5 if ab=="Rif" & mdo==0 & evol_condn=="Emono" & type=="res_isol"
replace mdonum = 2.5 if ab=="Rif" & mdo==1 & evol_condn=="Emono" & type=="res_isol"
replace mdonum = 5.5 if ab=="Rif" & mdo==0 & evol_condn=="Smono" & type=="res_isol"
replace mdonum = 7.5 if ab=="Rif" & mdo==1 & evol_condn=="Smono" & type=="res_isol"

ranksum meanmic if(ab=="Rif" & type=="res_isol" & (mdonum==0.5 | mdonum==2.5)), by(mdo)
ranksum meanmic if(ab=="Rif" & type=="res_isol" & (mdonum==5.5 | mdonum==7.5)), by(mdo)

stripplot meanmic if ab=="Rif" & type=="res_isol", over(mdonum) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdonum) jitter(5 5 5 5) ///
title("log{subscript:2}MIC of {it:mdoG} ({it:E. coli}) and {it:mdoH}" "({it:S. enterica}) mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
ytitle("log{subscript:2}MIC", size(medlarge)) ///
xtitle("") ///
height(0.5) lwidth(thick) lcolor(black) ///
mcolor(midblue midblue gold gold) msymbol(circle triangle circle triangle) ///
msize(vlarge vlarge vlarge vlarge) mlcolor(black black black black) mlwidth(thin thin thin thin) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
legend(off) ///
xlabel(0.5 `" "{it:E. coli}" "wild-type {it:mdoG}" "' 2.5 `" "{it:E. coli}" "mutant {it:mdoG}" "' ///
5.5 `" "{it:S. enterica}" "wild-type {it:mdoH}" "' 7.5 `" "{it:S. enterica}" "mutant {it:mdoH}" "', labsize(medium)) ///
ylabel(#10, angle(horizontal) labsize(large)) xscale(range(0 8.5)) ///
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
text(7.68 1.5 "p=0.8166", size(medium)) ///
text(7.67 1.5 "_______________", size(medium)) ///
text(7.78 6.5 "p=0.7697", size(medium)) ///
text(7.77 6.5 "_______________", size(medium))
