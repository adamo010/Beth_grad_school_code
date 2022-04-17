*Liquid med all

*Start with combined community

*Amp combined community:
stripplot mic, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter (3 3 3 3 3) ///
title("Ampicillin", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Coop." "comm." "' 5  `" "Comp." "comm." "') ///
yscale(range(60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

**create new variables: bu number is 'blowup' number
generate bu=1 if spp=="E"
replace bu=2 if spp=="S"
replace bu=3 if spp=="coop"

*Amp blowup of low MICs
stripplot mic, over(bu) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(bu) jitter(3 3 3 3 3) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle(" ") ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry gs6)  ///
msymbol(circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 `" "Coop." "comm." "') ///
yscale(range(0 2.5)) ytick(#6) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.25) ///
aspectratio(1.4)

*Change dataset
*Tet combined community:
stripplot mic, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Coop." "comm." "' 5  `" "Comp." "comm." "') ///
yscale(range(60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

**create new variables: bu number is 'blowup' number
generate bu=1 if spp=="E"
replace bu=2 if spp=="M"
replace bu=3 if spp=="coop"

*Tet blowup of low MICs
stripplot mic, over(bu) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(bu) jitter(3 3 3 3 3) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle(" ") ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue green gs6)  ///
msymbol(circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:M. extorquens}" 3 `" "Coop." "comm." "') ///
yscale(range(0 6)) ytick(#7) ///
ylabel(#7, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.25) ///
aspectratio(1.4)

***************
*By spp graphs
***************

*Ec Amp
stripplot mic if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(2.5)) ytick(#5) ///
ylabel(#5, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Sal Amp
stripplot mic if spp=="S", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(2.5)) ytick(#5) ///
ylabel(#5, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Mex Amp
stripplot mic if spp=="M", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(green green*0.5 green*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)


**********Change datasets

*Ec Tet
stripplot mic if spp=="E", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: E. coli}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue midblue*0.5 midblue*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(0 1 2 3 4 5 6)) ytick(#7) ///
ylabel(#7, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Sal Tet
stripplot mic if spp=="S", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: S. enterica}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry cranberry*0.5 cranberry*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(60)) ytick(#7) ///
ylabel(#7, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)

*Mex Tet
stripplot mic if spp=="M", over(type_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(type_num) jitter(3 3 3) ///
title("{it: M. extorquens}", size(large) color(black) margin(zero)) ///
ytitle("MIC (ug/mL)", size(medlarge)) xtitle("Community Type", size(medlarge) margin(small)) ///
legend(off) ///
height(0.3) ///
lwidth(thick) lcolor(black) ///
mcolor(green green*0.5 green*0.3) ///
mlcolor(black black black) mlwidth(medthin medthin medthin) ///
msymbol(circle circle circle) msize(medlarge medlarge medlarge) ///
xlabel(1 "Mono." 2 "Coop." 3 "Comp.", labsize(medium)) ///
yscale(range(6)) ytick(#7) ///
ylabel(#7, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1) ///
aspectratio(1.8)
