*variables: spp(E/S/ES), spp_num(1/2/3), hyp_type(ind/ind, add/add, syn/syn, ant/ant), combo(cpx_blm), combo_num(8), fic_vert(#), fic_hoz(#)

*based on data from 03.26.19 FIC hypothesis graphs.xls

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\03.27.19 Xboard dummy hypothesis data.dta"

*Combo 1: Ind/ind
graph twoway (scatteri 0 0.5 0.5 0, connect(l) clwidth(thick) clcolor(red) clpattern(shortdash) msymbol(i)) ///
(scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="ind/ind" & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ind/ind" & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ind/ind" & spp=="ES", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Independent interactions", size(large) color(black) margin(medium)) ///
xtitle("FIC Ciprofloxacin", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(3 "{it:E. coli}" 4 "{it:S. enterica}" 5 "{it:E. coli- S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 2: Add/Add
graph twoway (scatteri 0 0.5 0.5 0, connect(l) clwidth(thick) clcolor(red) clpattern(shortdash) msymbol(i)) ///
(scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="add/add" & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="add/add" & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="add/add" & spp=="ES", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Additive/synergistic interactions", size(large) color(black) margin(medium)) ///
xtitle("FIC Ciprofloxacin", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(3 "{it:E. coli}" 4 "{it:S. enterica}" 5 "{it:E. coli- S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 3: Syn/Syn
graph twoway (scatteri 0 0.5 0.5 0, connect(l) clwidth(thick) clcolor(red) clpattern(shortdash) msymbol(i)) ///
(scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/syn" & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/syn" & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/syn" & spp=="ES", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Synergistic interactions", size(large) color(black) margin(medium)) ///
xtitle("FIC Ciprofloxacin", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(3 "{it:E. coli}" 4 "{it:S. enterica}" 5 "{it:E. coli- S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 4: Ant/Ant
graph twoway (scatteri 0 0.5 0.5 0, connect(l) clwidth(thick) clcolor(red) clpattern(shortdash) msymbol(i)) ///
(scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(scatteri 4 0 0 4, connect(l) clwidth(thick) clcolor(green) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="ant/ant" & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ant/ant" & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ant/ant" & spp=="ES", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Antagonistic interactions", size(large) color(black) margin(medium)) ///
xtitle("FIC Ciprofloxacin", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(1)8, labsize(medsmall)) xscale(range(0 8)) ///
ylabel(0(1)8, angle(horizontal) labsize(medsmall)) yscale(range(0 8)) ///
legend(nocolfirst rows(1) order(4 "{it:E. coli}" 5 "{it:S. enterica}" 6 "{it:E. coli- S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 



