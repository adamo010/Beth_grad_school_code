*Liquid med all
*Double check MIC1 vs. MIC2 is specified

*Amp combined community:
stripplot mic1, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter (5 5 5 5 5) ///
title("Ampicillin", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Coop." "comm." "' 5  `" "Comp." "comm." "') ///
yscale(range(120)) ytick(#12) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

*Change dataset
*Tet combined community:
stripplot mic1, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Coop." "comm." "' 5  `" "Comp." "comm." "') ///
yscale(range(110)) ytick(#12) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)


***************
*By spp graphs
***************

*Ec Amp
stripplot mic1 if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ymtick(#13) ///
ylabel(0(1)6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Sal Amp
stripplot mic1 if spp=="S", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.5 gold*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ytick(#13) ///
ylabel(0(1)6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Mex Amp
stripplot mic1 if spp=="M", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(110)) ytick(#12) ///
ylabel(0(10)110, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)


**********Change datasets

*Ec Tet
stripplot mic1 if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}, MIC" "with 72h cutoff", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(12)) ytick(#13) ///
ylabel(0(1)12, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Sal Tet
stripplot mic1 if spp=="S", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(gold gold*0.5 gold*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(110)) ytick(#12) ///
ylabel(0(10)110, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Mex Tet
stripplot mic2 if spp=="M", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}," "MIC with 72h cutoff", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) mlcolor (black black black) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ytick(#13) ///
ylabel(0(1)6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.6)
