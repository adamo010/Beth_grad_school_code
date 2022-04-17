*03.08.17: another round of analysis
*Graphs for all solid medium experiments: stripplots
*note that this is for diameter of zone of clearing, not area

*Amp core: diameter
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) ///
ytitle("Diameter of cleared area (mm)", size(medium)) xtitle("Species", size(medium)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

*Amp 2spp: diameter
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) ///
ytitle("Diameter of cleared area (mm)", size(medium)) xtitle("Species", size(medium)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(cranberry orange navy8 olive_teal gs6)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:S. enterica}" 2 `" "{it:E. coli-}" "{it:S. enterica}" "' 3 `" "{it:E. coli-}" "{it:M. extorquens}" "' 4 `" "{it:S. enterica-}" "{it:M. extorquens}" "' 5 `" "Cooperative" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.1)

*Amp Sal density: diameter
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
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) ///
ytitle("Diameter of cleared area (mm)", size(medium)) xtitle("Species", size(medium)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue cranberry green gs6 purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Cooperative" "community" "' 5  `" "Competitive" "community" "') ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)


