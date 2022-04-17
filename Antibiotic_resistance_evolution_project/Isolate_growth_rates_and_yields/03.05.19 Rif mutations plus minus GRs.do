*Supp fig 3 (as of 03.05.19): MICs and GRs of mdoG/mdoH/prc in ERif, mdoH in SRif

*************************************************************
***********Growth rates**************************************
*************************************************************

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\11.15.18 round3 GRs round10 MICs compiled data no anc no pop.dta"
collapse (mean) meanmono_gr= mono_gr (mean) meancoop_gr= coop_gr, by(pop_id ab type evol_condn growth_condn spp rep)

*******mdoG: if =1, mutation is present
generate mdoG = 0 if ab=="Rif" & type=="res_isol" & spp=="E"
replace mdoG = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA030"
replace mdoG = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA036"
replace mdoG = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA049"

*mdoGnum1 is for mono grs, mdoGnum2 is for coop grs (for graphing purposes only)
generate mdoGnum1 = 0.5 if ab=="Rif" & mdoG==0 & evol_condn=="Emono" & type=="res_isol"
replace mdoGnum1 = 2.5 if ab=="Rif" & mdoG==1 & evol_condn=="Emono" & type=="res_isol"
generate mdoGnum2 = 5.5 if ab=="Rif" & mdoG==0 & evol_condn=="Emono" & type=="res_isol"
replace mdoGnum2 = 7.5 if ab=="Rif" & mdoG==1 & evol_condn=="Emono" & type=="res_isol"

ranksum meanmono_gr if(ab=="Rif" & type=="res_isol" & (mdoGnum1==0.5 | mdoGnum1==2.5)), by(mdoG)
ranksum meancoop_gr if(ab=="Rif" & type=="res_isol" & (mdoGnum2==5.5 | mdoGnum2==7.5)), by(mdoG)

*need to add stats and adjust y-axes on this; also needs a title
twoway (scatter meanmono_gr mdoGnum1 if(ab=="Rif" & type=="res_isol" & mdoGnum1==0.5), c(1) yaxis(1) connect(i) ///
mcolor(midblue) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr mdoGnum1 if(ab=="Rif" & type=="res_isol" & mdoGnum1==2.5), c(1) yaxis(1) connect(i) ///
mcolor(midblue) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mdoGnum2 if(ab=="Rif" & type=="res_isol" & mdoGnum2==5.5), c(1) yaxis(2) connect(i) ///
mcolor(midblue*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mdoGnum2 if(ab=="Rif" & type=="res_isol" & mdoGnum2==7.5), c(1) yaxis(2) connect(i) ///
mcolor(midblue*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
legend(off) ///
title("Growth rates of {it:E. coli} {it:mdoG} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}," "wild-type" "{it:mdoG}" "' ///
2.5 `" "{it:E. coli}," "mutant" "{it:mdoG}" "' ///
5.5 `" "{it:E. coli}," "wild-type" "{it:mdoG}" "' ///
7.5 `" "{it:E. coli}," "mutant" "{it:mdoG}" "', labsize(medium)) ///
ytitle("Monoculture growth rates", axis(1) size(medlarge)) ytitle("Co-culture growth rates", axis(2) size(medlarge)) ///
yscale(axis(1) range(0(0.1)1)) ytick(#10, axis(1)) yscale(axis(2) range(0(0.1)1)) ytick(#10, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
text(0.78 1.5 "p=0.8273", size(medium)) ///
text(0.77 1.5 "_______________", size(medium)) ///
text(0.58 6.5 "p=0.8273", size(medium)) ///
text(0.57 6.5 "_______________", size(medium))

*******mdoHE: if =1, mutation is present
generate mdoHE = 0 if ab=="Rif" & type=="res_isol" & spp=="E"
replace mdoHE = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA010"
replace mdoHE = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA056"

*mdoHEnum1 is for mono grs, mdoHEnum2 is for coop grs (for graphing purposes only)
generate mdoHEnum1 = 0.5 if ab=="Rif" & mdoHE==0 & evol_condn=="Emono" & type=="res_isol"
replace mdoHEnum1 = 2.5 if ab=="Rif" & mdoHE==1 & evol_condn=="Emono" & type=="res_isol"
generate mdoHEnum2 = 5.5 if ab=="Rif" & mdoHE==0 & evol_condn=="Emono" & type=="res_isol"
replace mdoHEnum2 = 7.5 if ab=="Rif" & mdoHE==1 & evol_condn=="Emono" & type=="res_isol"

ranksum meanmono_gr if(ab=="Rif" & type=="res_isol" & (mdoHEnum1==0.5 | mdoHEnum1==2.5)), by(mdoHE)
ranksum meancoop_gr if(ab=="Rif" & type=="res_isol" & (mdoHEnum2==5.5 | mdoHEnum2==7.5)), by(mdoHE)

*need to add stats and adjust y-axes on this; also needs a title
twoway (scatter meanmono_gr mdoHEnum1 if(ab=="Rif" & type=="res_isol" & mdoHEnum1==0.5), c(1) yaxis(1) connect(i) ///
mcolor(midblue) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr mdoHEnum1 if(ab=="Rif" & type=="res_isol" & mdoHEnum1==2.5), c(1) yaxis(1) connect(i) ///
mcolor(midblue) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mdoHEnum2 if(ab=="Rif" & type=="res_isol" & mdoHEnum2==5.5), c(1) yaxis(2) connect(i) ///
mcolor(midblue*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mdoHEnum2 if(ab=="Rif" & type=="res_isol" & mdoHEnum2==7.5), c(1) yaxis(2) connect(i) ///
mcolor(midblue*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
legend(off) ///
title("Growth rates of {it:E. coli} {it:mdoH} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}," "wild-type" "{it:mdoH}" "' ///
2.5 `" "{it:E. coli}," "mutant" "{it:mdoH}" "' ///
5.5 `" "{it:E. coli}," "wild-type" "{it:mdoH}" "' ///
7.5 `" "{it:E. coli}," "mutant" "{it:mdoH}" "', labsize(medium)) ///
ytitle("Monoculture growth rates", axis(1) size(medlarge)) ytitle("Co-culture growth rates", axis(2) size(medlarge)) ///
yscale(axis(1) range(0(0.1)1)) ytick(#10, axis(1)) yscale(axis(2) range(0(0.1)1)) ytick(#10, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
text(0.78 1.5 "p=0.3545", size(medium)) ///
text(0.77 1.5 "_______________", size(medium)) ///
text(0.58 6.5 "p>0.999", size(medium)) ///
text(0.57 6.5 "_______________", size(medium))

*mdoHSnum1 is for mono grs, mdoHSnum2 is for coop grs (for graphing purposes only)
generate mdoHS = 0 if ab=="Rif" & type=="res_isol" & spp=="S"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA067"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA079"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA083"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA098"
replace mdoHS = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA115"

generate mdoHSnum1 = 0.5 if ab=="Rif" & mdoHS==0 & evol_condn=="Smono" & type=="res_isol"
replace mdoHSnum1 = 2.5 if ab=="Rif" & mdoHS==1 & evol_condn=="Smono" & type=="res_isol"
generate mdoHSnum2 = 5.5 if ab=="Rif" & mdoHS==0 & evol_condn=="Smono" & type=="res_isol"
replace mdoHSnum2 = 7.5 if ab=="Rif" & mdoHS==1 & evol_condn=="Smono" & type=="res_isol"

ranksum meanmono_gr if(ab=="Rif" & type=="res_isol" & (mdoHSnum1==0.5 | mdoHSnum1==2.5)), by(mdoHS)
ranksum meancoop_gr if(ab=="Rif" & type=="res_isol" & (mdoHSnum2==5.5 | mdoHSnum2==7.5)), by(mdoHS)

*Graph
twoway (scatter meanmono_gr mdoHSnum1 if(ab=="Rif" & type=="res_isol" & mdoHSnum1==0.5), c(1) yaxis(1) connect(i) ///
mcolor(gold) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr mdoHSnum1 if(ab=="Rif" & type=="res_isol" & mdoHSnum1==2.5), c(1) yaxis(1) connect(i) ///
mcolor(gold) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mdoHSnum2 if(ab=="Rif" & type=="res_isol" & mdoHSnum2==5.5), c(1) yaxis(2) connect(i) ///
mcolor(gold*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mdoHSnum2 if(ab=="Rif" & type=="res_isol" & mdoHSnum2==7.5), c(1) yaxis(2) connect(i) ///
mcolor(gold*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
legend(off) ///
title("Growth rates of {it:S. enterica} {it:mdoH} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:S. enterica}," "wild-type" "{it:mdoH}" "' ///
2.5 `" "{it:S. enterica}," "mutant" "{it:mdoH}" "' ///
5.5 `" "{it:S. enterica}," "wild-type" "{it:mdoH}" "' ///
7.5 `" "{it:S. enterica}," "mutant" "{it:mdoH}" "', labsize(medium)) ///
ytitle("Monoculture growth rates", axis(1) size(medlarge)) ytitle("Co-culture growth rates", axis(2) size(medlarge)) ///
yscale(axis(1) range(0(0.1)1)) ytick(#10, axis(1)) yscale(axis(2) range(0(0.1)1)) ytick(#10, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
text(0.88 1.5 "p=0.3798", size(medium)) ///
text(0.87 1.5 "_______________", size(medium)) ///
text(0.61 6.5 "p=0.3798", size(medium)) ///
text(0.60 6.5 "_______________", size(medium))


*******prc: if =1, mutation is present
*create mprc for monoculture-evolved isolates, cprc for coculture-evolved isolatese
generate mprc = 0 if ab=="Rif" & type=="res_isol" & spp=="E"
replace mprc = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA010"
replace mprc = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA036"

generate cprc = 0 if ab=="Rif" & type=="res_isol" & spp=="E"
replace cprc = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA145"
replace cprc = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA155"
replace cprc = 1 if ab=="Rif" & type=="res_isol" & pop_id=="BA176"

*prcnum1 is for mono grs, prcnum2 is for coop grs (for graphing purposes only)
generate mprcnum1 = 0.5 if ab=="Rif" & mprc==0 & evol_condn=="Emono" & type=="res_isol"
replace mprcnum1 = 2.5 if ab=="Rif" & mprc==1 & evol_condn=="Emono" & type=="res_isol"
generate mprcnum2 = 5.5 if ab=="Rif" & mprc==0 & evol_condn=="Emono" & type=="res_isol"
replace mprcnum2 = 7.5 if ab=="Rif" & mprc==1 & evol_condn=="Emono" & type=="res_isol"

generate cprcnum1 = 0.5 if ab=="Rif" & cprc==0 & evol_condn=="Ecoop" & type=="res_isol"
replace cprcnum1 = 2.5 if ab=="Rif" & cprc==1 & evol_condn=="Ecoop" & type=="res_isol"
generate cprcnum2 = 5.5 if ab=="Rif" & cprc==0 & evol_condn=="Ecoop" & type=="res_isol"
replace cprcnum2 = 7.5 if ab=="Rif" & cprc==1 & evol_condn=="Ecoop" & type=="res_isol"

ranksum meanmono_gr if(ab=="Rif" & type=="res_isol" & (mprcnum1==0.5 | mprcnum1==2.5)), by(mprc)
ranksum meancoop_gr if(ab=="Rif" & type=="res_isol" & (mprcnum2==5.5 | mprcnum2==7.5)), by(mprc)

ranksum meanmono_gr if(ab=="Rif" & type=="res_isol" & (cprcnum1==0.5 | cprcnum1==2.5)), by(cprc)
ranksum meancoop_gr if(ab=="Rif" & type=="res_isol" & (cprcnum2==5.5 | cprcnum2==7.5)), by(cprc)

*Graph: monoculture-evolved
twoway (scatter meanmono_gr mprcnum1 if(ab=="Rif" & type=="res_isol" & mprcnum1==0.5), c(1) yaxis(1) connect(i) ///
mcolor(midblue) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr mprcnum1 if(ab=="Rif" & type=="res_isol" & mprcnum1==2.5), c(1) yaxis(1) connect(i) ///
mcolor(midblue) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mprcnum2 if(ab=="Rif" & type=="res_isol" & mprcnum2==5.5), c(1) yaxis(2) connect(i) ///
mcolor(midblue*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr mprcnum2 if(ab=="Rif" & type=="res_isol" & mprcnum2==7.5), c(1) yaxis(2) connect(i) ///
mcolor(midblue*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
legend(off) ///
title("Growth rates of monoculture-evolved" "{it:E. coli} {it:prc} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}," "wild-type" "{it:prc}" "' ///
2.5 `" "{it:E. coli}," "mutant" "{it:prc}" "' ///
5.5 `" "{it:E. coli}," "wild-type" "{it:prc}" "' ///
7.5 `" "{it:E. coli}," "mutant" "{it:prc}" "', labsize(medium)) ///
ytitle("Monoculture growth rates", axis(1) size(medlarge)) ytitle("Co-culture growth rates", axis(2) size(medlarge)) ///
yscale(axis(1) range(0(0.1)1)) ytick(#10, axis(1)) yscale(axis(2) range(0(0.1)1)) ytick(#10, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
text(0.78 1.5 "p=0.0641", size(medium)) ///
text(0.77 1.5 "_______________", size(medium)) ///
text(0.58 6.5 "p=0.6434", size(medium)) ///
text(0.57 6.5 "_______________", size(medium))

*Graph: coculture-evolved
twoway (scatter meanmono_gr cprcnum1 if(ab=="Rif" & type=="res_isol" & cprcnum1==0.5), c(1) yaxis(1) connect(i) ///
mcolor(green) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meanmono_gr cprcnum1 if(ab=="Rif" & type=="res_isol" & cprcnum1==2.5), c(1) yaxis(1) connect(i) ///
mcolor(green) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr cprcnum2 if(ab=="Rif" & type=="res_isol" & cprcnum2==5.5), c(1) yaxis(2) connect(i) ///
mcolor(green*0.5) msymbol(circle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)) ///
(scatter meancoop_gr cprcnum2 if(ab=="Rif" & type=="res_isol" & cprcnum2==7.5), c(1) yaxis(2) connect(i) ///
mcolor(green*0.5) msymbol(triangle) msize(vlarge) mlcolor(black) mlwidth(thin) jitter (5)), ///
legend(off) ///
title("Growth rates of co-culture-evolved" "{it:E. coli} {it:prc} mutants in Rifampicin", size(medlarge) color(black) margin(zero))  ///
graphregion(fcolor(white)) plotregion(margin(zero)) ///
xlabel(0.5 `" "{it:E. coli}," "wild-type" "{it:prc}" "' ///
2.5 `" "{it:E. coli}," "mutant" "{it:prc}" "' ///
5.5 `" "{it:E. coli}," "wild-type" "{it:prc}" "' ///
7.5 `" "{it:E. coli}," "mutant" "{it:prc}" "', labsize(medium)) ///
ytitle("Monoculture growth rates", axis(1) size(medlarge)) ytitle("Co-culture growth rates", axis(2) size(medlarge)) ///
yscale(axis(1) range(0(0.1)0.8)) ytick(#9, axis(1)) yscale(axis(2) range(0(0.1)0.8)) ytick(#9, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") xscale(range(-1 9)) xline(4, lcolor(black) lwidth(medium)) ///
text(0.48 1.5 "p=0.0495", size(medium)) ///
text(0.47 1.5 "_______________", size(medium)) ///
text(0.58 6.5 "p=0.5127", size(medium)) ///
text(0.57 6.5 "_______________", size(medium))
