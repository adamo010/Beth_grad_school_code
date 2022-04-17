*********Variables************
*pop_id, evol_condn (Emono/Smono/Ecoop/Scoop), av_mono_gr, av_mono_yield, 
*av_coop_gr, av_coop_yield, av_mic, mdog_mutation (0/1), mdoh_mutation (0/1),
*rpob_mutation (0/1), graph(1-4)

*******Colour schema********
*Emono: midblue, midblue*0.25
*Smono: gold, gold*0.25
*Ecoop: purple, purple*0.25
*Scoop: green, green*0.25

*Goal: compare average MICs for replicates containing (or not) specific mutations

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Resistant isolate MICs in mono vs coculture\10.10.18 dividing up populations by genotype MICs.dta"

generate log2mic = ln(av_mic)/ln(2) 

**Graph 1: mdoG on Emono MICs
ranksum log2mic if graph==1, by(mdog_mutation)

stripplot log2mic if graph==1, over(mdog_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdog_mutation) jitter(5 5 5)  ///
title("Effect of mdoG mutations on" "monoculture-evolved {it:E. coli} MIC", size(large) color(black)) ///
ytitle("Average isolate log{subscript:2}MIC" "in Rifampicin, by isolate", size(medlarge)) ///
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
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:mdoG}" 1 "mutant {it:mdoG}" 2 " ") ///
text(7.7 0.5 "p=0.8166", size(medium))

**Graph 2: rpoB on Emono MICs
ranksum log2mic if graph==1, by(rpob_mutation)

stripplot log2mic if graph==1, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "monoculture-evolved {it:E. coli} MIC", size(large) color(black)) ///
ytitle("Average isolate log{subscript:2}MIC" "in Rifampicin, by isolate", size(medlarge)) ///
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
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(7.7 0.5 "p=0.0491", size(medium))

**Graph 3: rpoB on Emono MICs
ranksum log2mic if graph==2, by(rpob_mutation)

stripplot log2mic if graph==2, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "co-culture-evolved {it:E. coli} MIC", size(large) color(black)) ///
ytitle("Average isolate log{subscript:2}MIC" "in Rifampicin, by isolate", size(medlarge)) ///
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
ylabel(0(1)7, labsize(medlarge)) yscale(range(0 7)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(6.7 0.5 "p=0.0641", size(medium))

**Graph 4: mdoH on Smono MICs
ranksum log2mic if graph==3, by(mdoh_mutation)

stripplot log2mic if graph==3, over(mdoh_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(mdoh_mutation) jitter(5 5 5)  ///
title("Effect of mdoH mutations on" "monoculture-evolved {it:S. enterica} MIC", size(large) color(black)) ///
ytitle("Average isolate log{subscript:2}MIC" "in Rifampicin, by isolate", size(medlarge)) ///
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
ylabel(0(1)9, labsize(medlarge)) yscale(range(0 9)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:mdoH}" 1 "mutant {it:mdoH}" 2 " ") ///
text(8.3 0.5 "p=0.7697", size(medium))

**Graph 5: rpoB on Smono MICs
ranksum log2mic if graph==3, by(rpob_mutation)

stripplot log2mic if graph==3, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "monoculture-evolved {it:S. enterica} MIC", size(large) color(black)) ///
ytitle("Average isolate log{subscript:2}MIC" "in Rifampicin, by isolate", size(medlarge)) ///
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
ylabel(0(1)9, labsize(medlarge)) yscale(range(0 9)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(8.3 0.5 "p=0.1432", size(medium))

**Graph 6: rpoB on Scoop MICs
ranksum log2mic if graph==4, by(rpob_mutation)

stripplot log2mic if graph==4, over(rpob_mutation) ///
 stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(rpob_mutation) jitter(5 5 5)  ///
title("Effect of rpoB mutations on" "co-culture-evolved {it:S. enterica} MIC", size(large) color(black)) ///
ytitle("Average isolate log{subscript:2}MIC" "in Rifampicin, by isolate", size(medlarge)) ///
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
ylabel(0(1)8, labsize(medlarge)) yscale(range(0 8)) ///
xlabel(-1(1)2, labsize(medlarge)) xscale(range(-1 2)) ///
xlabel(-1 " " 0 "wild-type {it:rpoB}" 1 "mutant {it:rpoB}" 2 " ") ///
text(7.5 0.5 "p=0.0641", size(medium))

