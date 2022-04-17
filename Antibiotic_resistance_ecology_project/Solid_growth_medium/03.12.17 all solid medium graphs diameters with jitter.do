*Based off 03.08.17 do file, but added jitter to match liquid medium

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
*Not changed
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) ///
ytitle("Diameter of cleared area (mm)", size(medium)) xtitle("Species", size(medium)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry orange navy8 olive_teal gs6)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "3x {it:S.enterica}" 4 "{it:M. extorquens}" 5 `" "Cooperative" "comm." "' 6 `" "Competitive" "comm" "') ///
xlabel(, alternate) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.12)

*Tet core: diameter
*Changed
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

