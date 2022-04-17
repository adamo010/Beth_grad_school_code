*Variables:
*sample(1-34); population(descriptor); isolate(descriptor); passage(10,13,or 20); annotation(mutation+bp change); 
*mutation(Q142*/N255S/A+/D534Y); mutation_num(1/2/3/4); *mut_pres(yes/no/suppressor); nut_pres_code(0/1/2); 
*pop_isol(pop/isol); pop_isol_num(0/1); mono_gr(#), mono_yield(#); *coop_gr(#), coop_yield(#), mic(#)

*Have a bunch of MIC/GR/yield data for isolates, which may or may not have the ftsI mutation by Sanger sequencing: 

*What should I graph?
*What do I have? Isolates and populations from P10/13/20, with some spotty MICs/GRs

clear 
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\01.22.19 ftsI mutants grs and mics.dta"

generate log2mic = ln(mic)/ln(2)

generate pass_pres = 1 if passage==10 & mut_pres=="no"
replace pass_pres = 2 if passage==10 & mut_pres=="yes"
replace pass_pres = 3 if passage==13 & mut_pres=="no"
replace pass_pres = 4 if passage==13 & mut_pres=="yes"
replace pass_pres = 5 if passage==20 & mut_pres=="no"
replace pass_pres = 6 if passage==20 & mut_pres=="yes"
replace pass_pres = 7 if passage==20 & mut_pres=="suppressor"

*All monoculture grs
stripplot mono_gr if pop_isol=="isol", over(mutation) ///
stack center vertical separate(pass_pres) jitter(5 5 5 5 5 5 5) ///
title("Isolate monoculture growth rates, by mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("Monoculture growth rates", size(medlarge)) ///
xtitle("{it:ftsI} mutation identified", size(medlarge)) ///
legend(colfirst rows(4) order(1 "Passage 10, mutation absent" 2 "Passage 10, mutation present" 3 "Passage 13, mutation absent" ///
4 "Passage 13, mutation present" 5 "Passage 20, mutation absent" 6 "Passage 20, mutation present" 7 "Passage 20, suppressor mutation")) ///
mcolor(blue blue gold gold green green green) msymbol(circle triangle circle triangle circle triangle square) ///
msize(large large large large large large large) mlcolor(black black black black black black black) ///
mlwidth(thin thin thin thin thin thin thin) ///
ylabel(#8 0(0.1)0.8, angle(horizontal) labsize(medlarge)) ///
graphregion(fcolor(white)) ///
plotregion(margin(zero)) 

*All coculture grs
stripplot coop_gr if pop_isol=="isol", over(mutation) ///
stack center vertical separate(pass_pres) jitter(5 5 5 5 5 5 5) ///
title("Isolate co-culture growth rates, by mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("Co-culture growth rates", size(medlarge)) ///
xtitle("{it:ftsI} mutation identified", size(medlarge)) ///
legend(colfirst rows(4) order(1 "Passage 10, mutation absent" 2 "Passage 10, mutation present" 3 "Passage 13, mutation absent" ///
4 "Passage 13, mutation present" 5 "Passage 20, mutation absent" 6 "Passage 20, mutation present" 7 "Passage 20, suppressor mutation")) ///
mcolor(blue blue gold gold green green green) msymbol(circle triangle circle triangle circle triangle square) ///
msize(large large large large large large large) mlcolor(black black black black black black black) ///
mlwidth(thin thin thin thin thin thin thin) ///
ylabel(#8 0(0.1)0.7, angle(horizontal) labsize(medlarge)) ///
graphregion(fcolor(white)) 
plotregion(margin(zero)) 

*All mics
stripplot log2mic if pop_isol=="isol", over(mutation) ///
stack center vertical separate(pass_pres) jitter(5 5 5 5 5 5 5) ///
title("Isolate log{subscript:2}MICs, by mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}MICs", size(medlarge)) ///
xtitle("{it:ftsI} mutation identified", size(medlarge)) ///
legend(colfirst rows(4) order(1 "Passage 10, mutation absent" 2 "Passage 10, mutation present" 3 "Passage 13, mutation absent" ///
4 "Passage 13, mutation present" 5 "Passage 20, mutation absent" 6 "Passage 20, mutation present" 7 "Passage 20, suppressor mutation")) ///
mcolor(blue blue gold gold green green green) msymbol(circle triangle circle triangle circle triangle square) ///
msize(large large large large large large large) mlcolor(black black black black black black black) ///
mlwidth(thin thin thin thin thin thin thin) ///
ylabel(#13 -2(1)10, angle(horizontal) labsize(medlarge)) ///
graphregion(fcolor(white)) 
plotregion(margin(zero)) 

************************

generate passpop = 1 if passage==10 & pop_isol=="pop"
replace passpop = 2 if passage==10 & pop_isol=="isol"
replace passpop = 3 if passage==13 & pop_isol=="pop"
replace passpop = 4 if passage==13 & pop_isol=="isol"
replace passpop = 5 if passage==20 & pop_isol=="pop"
replace passpop = 6 if passage==20 & pop_isol=="isol"

*Variables:
*sample(1-34); population(descriptor); isolate(descriptor); passage(10,13,or 20); annotation(mutation+bp change); 
*mutation(Q142*/N255S/A+/D534Y); mutation_num(1/2/3/4); *mut_pres(yes/no/suppressor); nut_pres_code(0/1/2); 
*pop_isol(pop/isol); pop_isol_num(0/1); mono_gr(#), mono_yield(#); *coop_gr(#), coop_yield(#), mic(#)

*Q142* mutations
stripplot mut_pres_code if mutation_num==1, over(rep) ///
stack center vertical separate(passpop) ///
title("Presence/absense of {it:ftsI} Q142* mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("Presence/absense of mutation", size(medium)) ///
xtitle("Replicate population", size(medium)) ///
xlabel(3 "Rep3" 4 "Rep4" 5 "Rep5", labsize(medium)) ///
legend(colfirst rows(3) order(1 "Passage 10, population" 2 "Passage 13, population" ///
3 "Passage 13, isolates" 4 "Passage 20, population" 5 "Passage 20, isolates")) ///
mcolor(blue gold gold green green) msymbol(circle circle triangle circle triangle) ///
msize(large large large large large) mlcolor(black black black black black) ///
mlwidth(thin thin thin thin thin) ///
ylabel(#3 0(1)2, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) ///
note("Y-axis: 0= mutation absent, 1= mutation present, 2= suppressor mutation present", size(small)) 

*N255S mutations
stripplot mut_pres_code if mutation_num==2, over(rep) ///
stack center vertical separate(passpop) ///
title("Presence/absense of {it:ftsI} N255S mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("Presence/absense of mutation", size(medium)) ///
xtitle("Replicate population", size(medium)) ///
xlabel(6 "Rep6", labsize(medium)) ///
legend(colfirst rows(2) order(1 "Passage 13, population" 2 "Passage 13, isolates" ///
3 "Passage 20, population" 4 "Passage 20, isolates")) ///
mcolor(gold gold green green) msymbol(circle triangle circle triangle) ///
msize(large large large large) mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
ylabel(#2 -0.5(1)1.5, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) ///
note("Y-axis: 0= mutation absent, 1= mutation present, 2= suppressor mutation present", size(small)) 

*+A mutations
stripplot mut_pres_code if mutation_num==3, over(rep) ///
stack center vertical separate(passpop) ///
title("Presence/absense of {it:ftsI} +A mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("Presence/absense of mutation", size(medium)) ///
xtitle("Replicate population", size(medium)) ///
xlabel(1 "Rep1" 2 "Rep2", labsize(medium)) ///
legend(colfirst rows(3) order(1 "Passage 10, population" 2 "Passage 10, isolates" 3 "Passage 13, population" ///
4 "Passage 13, isolates" 5 "Passage 20, population" 6 "Passage 20, isolates")) ///
mcolor(blue blue gold gold green green) msymbol(circle triangle circle triangle circle triangle) ///
msize(large large large large large large) mlcolor(black black black black black black) ///
mlwidth(thin thin thin thin thin thin) ///
ylabel(#2 -0.5(1)1.5, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) ///
note("Y-axis: 0= mutation absent, 1= mutation present, 2= suppressor mutation present", size(small)) 

*D534Y mutations
stripplot mut_pres_code if mutation_num==4, over(rep) ///
stack center vertical separate(passpop) ///
title("Presence/absense of {it:ftsI} D534Y mutation", size(medlarge) color(black) margin(zero)) ///
ytitle("Presence/absense of mutation", size(medium)) ///
xtitle("Replicate population", size(medium)) ///
xlabel(4 "Rep4", labsize(medium)) ///
legend(colfirst rows(2) order(1 "Passage 10, population" 2 "Passage 10, isolates" 3 "Passage 13, population" ///
4 "Passage 13, isolates")) ///
mcolor(blue blue gold gold) msymbol(circle triangle circle triangle) ///
msize(large large large large) mlcolor(black black black black) ///
mlwidth(thin thin thin thin) ///
ylabel(#2 -0.5(1)1.5, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) ///
note("Y-axis: 0= mutation absent, 1= mutation present, 2= suppressor mutation present", size(small))
