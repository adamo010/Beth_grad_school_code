*variables: spp(E/S/ES), spp_num(1/2/3), hyp_type(ind/ind, syn/syn, ant/ant, syn/add), hyp_num(1/2/3/4), fic_vert(#), fic_hoz(#)

*based on data from 03.26.19 FIC hypothesis graphs.xls

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\04.03.19 isobologram demo hypothesis graphs.dta"

**********Median values**************
*Ind/ind
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(vthick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="ind/ind" & spp=="E", ///
lcolor(midblue) lwidth(vthick) mcolor(midblue) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ind/ind" & spp=="S", ///
lcolor(gold) lwidth(vthick) mcolor(gold) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ind/ind" & spp=="ES", ///
lcolor(green) lwidth(vthick) mcolor(green) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)), ///
xtitle("FIC_A", size(huge)) ytitle("FIC_B", size(huge)) ///
xlabel(0(0.2)1.2, labsize(huge)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(huge)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "E" 3 "S" 4 "ES") size(huge)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.65)

*Syn/syn
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(vthick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/syn" & spp=="E", ///
lcolor(midblue) lwidth(vthick) mcolor(midblue) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/syn" & spp=="S", ///
lcolor(gold) lwidth(vthick) mcolor(gold) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/syn" & spp=="ES", ///
lcolor(green) lwidth(vthick) mcolor(green) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)), ///
xtitle("FIC_A", size(huge)) ytitle("FIC_B", size(huge)) ///
xlabel(0(0.2)1.2, labsize(huge)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(huge)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "E" 3 "S" 4 "ES") size(huge)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.65)

*Ant/ant
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(vthick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="ant/ant" & spp=="E", ///
lcolor(midblue) lwidth(vthick) mcolor(midblue) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ant/ant" & spp=="S", ///
lcolor(gold) lwidth(vthick) mcolor(gold) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="ant/ant" & spp=="ES", ///
lcolor(green) lwidth(vthick) mcolor(green) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)), ///
xtitle("FIC_A", size(huge)) ytitle("FIC_B", size(huge)) ///
xlabel(0(2)8.5, labsize(huge)) xscale(range(0 8.5)) ///
ylabel(0(2)8.5, angle(horizontal) labsize(huge)) yscale(range(0 8.5)) ///
legend(nocolfirst rows(1) order(2 "E" 3 "S" 4 "ES") size(huge)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.65)

*Syn/add
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(vthick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/add" & spp=="E", ///
lcolor(midblue) lwidth(vthick) mcolor(midblue) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/add" & spp=="S", ///
lcolor(gold) lwidth(vthick) mcolor(gold) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if hyp_type=="syn/add" & spp=="ES", ///
lcolor(green) lwidth(vthick) mcolor(green) msymbol(cirlce) msize(vhuge) mlcolor(black) mlwidth(vthin)), ///
xtitle("FIC_A", size(huge)) ytitle("FIC_B", size(huge)) ///
xlabel(0(0.2)1.2, labsize(huge)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(huge)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "E" 3 "S" 4 "ES") size(huge)) ///
plotregion(margin(zero)) graphregion(fcolor(white)) aspectratio(0.65)
