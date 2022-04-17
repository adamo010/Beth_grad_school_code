*variables: spp(E/S/ES), spp_num(1/2/3), rep(1/3), combo(various), combo_num(1/10), vert_ab(name), hoz_ab(name), fic_vert(#), fic_hoz(#)

*based on data from 03.25.19 Xboard analysis in stata.xls: isobolograms tab
*Use only replicate 2 data, and do not include coculture lines

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\Xboard analysis\03.26.19 FIC isobolograms.dta"

*Combo 1: Nalidixic acid/ streptomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==1 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==1 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ streptomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Streptomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 2: Nalidixic acid/ bleomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==2 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==2 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ bleomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 3: Streptomycin/ ciprofloxacin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==3 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==3 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Streptomycin/ ciprofloxacin", size(large) color(black) margin(medium)) ///
xtitle("FIC Streptomycin", size(medium)) ytitle("FIC Ciprofloxacin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white))
 ///
note("{it:E. coli} line is underneath others", color(black) size(medsmall))

*Combo 4: Nalidixic acid/ Spectinomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==4 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==4 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ spectinomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Spectinomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 5: Nalidixic acid/ Doxycycline
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==5 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==5 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ doxycycline", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Doxycycline", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 
///
note("{it:E. coli} line is underneath others", color(black) size(medsmall))

*Combo 6: Spectinomycin/ streptomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==6 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==6 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Spectinomycin/ streptomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Spectinomycin", size(medium)) ytitle("FIC Streptomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)2.2, angle(horizontal) labsize(medsmall)) yscale(range(0 2.2)) ///
legend(nocolfirst rows(1) order(4 "{it:E. coli}" 5 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 7: Nalidixic acid/ Ciprofloxacin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==7 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==7 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ Ciprofloxacin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Ciprofloxacin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 8: Ciprofloxacin/ bleomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==1 & combo_num==8 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==1 & combo_num==8 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Ciprofloxacin/ bleomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Ciprofloxacin", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 9: Streptomycin/ doxycycline
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==9 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==9 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Streptomycin/ doxycyline", size(large) color(black) margin(medium)) ///
xtitle("FIC Streptomycin", size(medium)) ytitle("FIC Doxycycline", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 
///
note("{it:E. coli} line is underneath others", color(black) size(medsmall))

*Combo 10: Spectinomycin/ doxycycline
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==10 & spp=="E", ///
lcolor(midblue) lwidth(thick) mcolor(midblue) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==10 & spp=="S", ///
lcolor(gold) lwidth(thick) mcolor(gold) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Spectinomycin/ doxycyline", size(large) color(black) margin(medium)) ///
xtitle("FIC Spectinomycin", size(medium)) ytitle("FIC Doxycycline", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "{it:E. coli}" 3 "{it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 
///
note("{it:E. coli} line is underneath others", color(black) size(medsmall))
