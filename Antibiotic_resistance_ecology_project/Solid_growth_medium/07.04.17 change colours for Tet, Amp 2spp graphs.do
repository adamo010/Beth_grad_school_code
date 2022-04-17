*Redoing colours for Disc diffusion graphs
*Disc diffusion graphs to do: Amp core, Tet core (fig4); Amp 2spp; Amp Sal density
*Have Amp core and Amp Sal density in a new file b/c needed to redo comp comm
*So, need to rerun Tet core and Amp 2spp with cranberry for Mex
*Use dataset Tet core solid med diameters 03.08.17.dta and 

*Tet core
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Tetracycline", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Coop." "comm." "' 5  `" "Comp." "comm." "') ///
yscale(range(0 50)) ytick(#12) ///
ylabel(#6, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2)

*Amp 2spp
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin, 2-species cocultures", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(gold orange navy8 chocolate green)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:S. enterica}" 2 `" "{it:E. coli-}" "{it:S. enterica}" "' 3 `" "{it:E. coli-}" "{it:M. extorquens}" "' 4 `" "{it:S. enterica-}" "{it:M. extorquens}" "' 5 `" "Coop." "comm." "') ///
xlabel(, alternate) ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)
