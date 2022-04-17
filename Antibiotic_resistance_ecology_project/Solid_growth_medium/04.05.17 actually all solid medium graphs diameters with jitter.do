*Based off 03.08.17 do file, but added jitter to match liquid medium
*Also, amp sal density and amp 2spp are the only graphs with embedded colour changes;
*all other graphs had the colours changed by hand because fuck that noise of putting in the stats again

*Amp core: diameter
*changed
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

*Amp 2spp: diameter
**changed: also changed to reflect new colours (no other graphs here are)
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin, 2-species cocultures", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold orange navy8 chocolate green)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:S. enterica}" 2 `" "{it:E. coli-}" "{it:S. enterica}" "' 3 `" "{it:E. coli-}" "{it:M. extorquens}" "' 4 `" "{it:S. enterica-}" "{it:M. extorquens}" "' 5 `" "Cooperative" "community" "') ///
xlabel(, alternate) ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

*Amp Sal density: diameter
*Changed now! colours also changed
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3 3) ///
title("Ampicillin, {it:S. enterica} density", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold black red green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "3x {it:S.enterica}" 4 "{it:M. extorquens}" 5 `" "Cooperative" "comm." "' 6 `" "Competitive" "comm" "') ///
xlabel(, alternate) ///
ylabel(0(10)60, angle(horizontal)) ///
yscale(range(0 60)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

*Tet core: diameter
*Changed but colours not???
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
yscale(range(0 50)) ytick(#6) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

