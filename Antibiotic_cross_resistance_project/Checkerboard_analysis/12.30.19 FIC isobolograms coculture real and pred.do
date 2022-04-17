*variables: spp(E/S/ES), spp_num(1/2/3), rep(1/3), combo(various), combo_num(1/10), vert_ab(name), hoz_ab(name), fic_vert(#), fic_hoz(#), pred_or_real(pred/real)

*Use only replicate 2 data

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR multiple abs project\Xboard analysis\04.03.19 isobolograms mono and co-cultures with preds.dta"

*Combo 1: Nalidixic acid/ streptomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==1 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==1 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ streptomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Streptomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 2: Nalidixic acid/ bleomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==2 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==2 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ bleomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 3: Streptomycin/ ciprofloxacin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==3 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==3 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Streptomycin/ ciprofloxacin", size(large) color(black) margin(medium)) ///
xtitle("FIC Streptomycin", size(medium)) ytitle("FIC Ciprofloxacin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white))
 ///
note("ES observed line is underneath others", color(black) size(medsmall))

*Combo 4: Nalidixic acid/ Spectinomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==4 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==4 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ spectinomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Spectinomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 5: Nalidixic acid/ Doxycycline
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==5 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==5 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ doxycycline", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Doxycycline", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 
///
note("ES observed line is underneath others", color(black) size(medsmall))

*Combo 6: Spectinomycin/ streptomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==1 & combo_num==6 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==1 & combo_num==6 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Spectinomycin/ streptomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Spectinomycin", size(medium)) ytitle("FIC Streptomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(1)8, angle(horizontal) labsize(medsmall)) yscale(range(0 8)) ///
legend(nocolfirst rows(1) order(4 "ES observed" 5 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 7: Nalidixic acid/ Ciprofloxacin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==7 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==7 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Nalidixic acid/ Ciprofloxacin", size(large) color(black) margin(medium)) ///
xtitle("FIC Nalidixic acid", size(medium)) ytitle("FIC Ciprofloxacin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)2.2, angle(horizontal) labsize(medsmall)) yscale(range(0 2.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 8: Ciprofloxacin/ bleomycin
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==8 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==8 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Ciprofloxacin/ bleomycin", size(large) color(black) margin(medium)) ///
xtitle("FIC Ciprofloxacin", size(medium)) ytitle("FIC Bleomycin", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 

*Combo 9: Streptomycin/ doxycycline
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==9 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==3 & combo_num==9 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Streptomycin/ doxycycline", size(large) color(black) margin(medium)) ///
xtitle("FIC Streptomycin", size(medium)) ytitle("FIC Doxycycline", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 
///
note("ES observed line is underneath others", color(black) size(medsmall))

*Combo 10: Spectinomycin/ doxycycline
graph twoway (scatteri 0 1 1 0, connect(l) clwidth(thick) clcolor(black) clpattern(shortdash) msymbol(i)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==10 & spp=="ES" & pred_or_real=="real", ///
lcolor(green) lwidth(thick) mcolor(green) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)) ///
(connected fic_hoz fic_vert if rep==2 & combo_num==10 & spp=="ES" & pred_or_real=="pred", ///
lcolor(green*0.25) lwidth(thick) mcolor(green*0.25) msymbol(cirlce) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("Spectinomycin/ doxycycline", size(large) color(black) margin(medium)) ///
xtitle("FIC Spectinomycin", size(medium)) ytitle("FIC Doxycycline", size(medium)) ///
xlabel(0(0.2)1.2, labsize(medsmall)) xscale(range(0 1.2)) ///
ylabel(0(0.2)1.2, angle(horizontal) labsize(medsmall)) yscale(range(0 1.2)) ///
legend(nocolfirst rows(1) order(2 "ES observed" 3 "ES predicted")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) 
///
note("ES observed line is underneath others", color(black) size(medsmall))
