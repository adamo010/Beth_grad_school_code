*********Variables************
*pop_id, evol_condn (Emono/Smono/Ecoop/Scoop), av_mono_gr, av_mono_yield, 
*av_coop_gr, av_coop_yield, av_mic, mdog_mutation (0/1), mdoh_mutation (0/1),
*rpob_mutation (0/1), graph(1-4)

*******Colour schema********
*Emono: midblue, midblue*0.25
*Smono: gold, gold*0.25
*Ecoop: purple, purple*0.25
*Scoop: green, green*0.25

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Isolate growth rates\10.10.18 dividing up populations by genotype.dta" 

ranksum av_mono_gr if graph==1, by(mdog_mutation)
ranksum av_coop_gr if graph==1, by(mdog_mutation)

*Graph 1a: mdoG in Ecoli Rif monocultures
stripplot av_mono_gr if graph==1, over(mdog_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdog_mutation) jitter(5 5 5)  ///
title("Effect of mdoG mutations on" "{it:E. coli} monoculture growth rates", size(large) color(black)) ///
ytitle("Average isolate monoculture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of mdoG mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:mdoG}" 1 "mutant {it:mdoG}" 2 " ") ///
text(0.75 0.5 "p=0.8273", size(medium))

*Graph 1b: mdoG in Ecoli Rif co-cultures
stripplot av_coop_gr if graph==1, over(mdog_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdog_mutation) jitter(5 5 5)  ///
title("Effect of mdoG mutations on" "{it:E. coli} co-culture growth rates", size(large) color(black)) ///
ytitle("Average isolate co-culture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of mdoG mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:mdoG}" 1 "mutant {it:mdoG}" 2 " ") ///
text(0.6 0.5 "p=0.8273", size(medium))

***********************************************

ranksum av_mono_gr if graph==1, by(rpob_mutation)
ranksum av_coop_gr if graph==1, by(rpob_mutation)

*Graph 1c: mdoG in Ecoli Rif monocultures
stripplot av_mono_gr if graph==1, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:E. coli} monoculture growth rates", size(large) color(black)) ///
ytitle("Average isolate monoculture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.8, labsize(medlarge)) yscale(range(0 0.8)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.7 0.5 "p=0.1649", size(medium))

*Graph 1d: mdoG in Ecoli Rif co-cultures
stripplot av_coop_gr if graph==1, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:E. coli} co-culture growth rates", size(large) color(black)) ///
ytitle("Average isolate co-culture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.55 0.5 "p=0.1649", size(medium))

***********************************************

ranksum av_mono_gr if graph==2, by(rpob_mutation)
ranksum av_coop_gr if graph==2, by(rpob_mutation)

*Graph 2a: mdoG in Ecoli Rif monocultures
stripplot av_mono_gr if graph==2, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:E. coli} monoculture growth rates", size(large) color(black)) ///
ytitle("Average isolate monoculture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(purple purple*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.45 0.5 "p=0.3545", size(medium))

*Graph 2b: mdoG in Ecoli Rif co-cultures
stripplot av_coop_gr if graph==2, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:E. coli} co-culture growth rates", size(large) color(black)) ///
ytitle("Average isolate co-culture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(purple purple*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.55 0.5 "p=0.6434", size(medium))
***********************************************

ranksum av_mono_gr if graph==3, by(mdoh_mutation)
ranksum av_coop_gr if graph==3, by(mdoh_mutation)

*Graph 3a: mdoH in Sal Rif monocultures
stripplot av_mono_gr if graph==3, over(mdoh_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdoh_mutation) jitter(5 5 5)  ///
title("Effect of mdoH mutations on" "{it:S. enterica} monoculture growth rates", size(large) color(black)) ///
ytitle("Average isolate monoculture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of mdoH mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.9, labsize(medlarge)) yscale(range(0 0.9)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:mdoH}" 1 "mutant {it:mdoH}" 2 " ") ///
text(0.85 0.5 "p=0.3545", size(medium))

*Graph 3b: mdoH in Sal Rif coculture
stripplot av_coop_gr if graph==3, over(mdoh_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdoh_mutation) jitter(5 5 5)  ///
title("Effect of mdoH mutations on" "{it:S. enterica} co-culture growth rates", size(large) color(black)) ///
ytitle("Average isolate co-culture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of mdoH mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:mdoH}" 1 "mutant {it:mdoH}" 2 " ") ///
text(0.55 0.5 "p=0.3545", size(medium))

ranksum av_mono_gr if graph==3, by(rpob_mutation)
ranksum av_coop_gr if graph==3, by(rpob_mutation)

*Graph 3a: mdoH in Sal Rif monocultures
stripplot av_mono_gr if graph==3, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:S. enterica} monoculture growth rates", size(large) color(black)) ///
ytitle("Average isolate monoculture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.9, labsize(medlarge)) yscale(range(0 0.9)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.85 0.5 "p=0.3798", size(medium))

*Graph 3b: mdoH in Sal Rif coculture
stripplot av_coop_gr if graph==3, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:S. enterica} co-culture growth rates", size(large) color(black)) ///
ytitle("Average isolate co-culture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.6, labsize(medlarge)) yscale(range(0 0.6)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.55 0.5 "p=0.7697", size(medium))

****************************************
ranksum av_mono_gr if graph==4, by(rpob_mutation)
ranksum av_coop_gr if graph==4, by(rpob_mutation)

*Graph 4a: rpoB in Sal Rif monocultures
stripplot av_mono_gr if graph==4, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:S. enterica} monoculture growth rates", size(large) color(black)) ///
ytitle("Average isolate monoculture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(green green*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)1.1, labsize(medlarge)) yscale(range(0 1.1)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.95 0.5 "p=0.0641", size(medium))

*Graph 3b: mdoH in Sal Rif coculture
stripplot av_coop_gr if graph==4, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "{it:S. enterica} co-culture growth rates", size(large) color(black)) ///
ytitle("Average isolate mco-culture" "growth rate, by isolate", size(medlarge)) ///
xtitle("Presence/absense of rpoB mutation", size(medlarge) margin(small)) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(green green*0.25)  ///
msymbol(circle circle) ///
msize(large large) ///
mlcolor(black black) ///
mlwidth(thin thin) ///
legend(off) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero))  ///
ylabel(#10, angle(horizontal) labsize(large)) ///
ylabel(0(0.1)0.7, labsize(medlarge)) yscale(range(0 0.7)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(0.65 0.5 "p=1.000", size(medium))

