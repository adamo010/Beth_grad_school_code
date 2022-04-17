*variables needed: ab, spp, diameter, 

*Amp core stats:
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)

*Amp core graph:
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3) ///
title("Ampicillin", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge) margin(small)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 `" "Coop." "comm." "' 5  `" "Comp." "comm." "') ///
yscale(range(0 60)) ytick(#10) ///
ylabel(#10, angle(horizontal) labsize(medium)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.2)

*Amp Sal density 
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="3xS")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="3xS")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)

*Amp Sal density graph
stripplot diameter, over(spp_num) stack center vertical refline(lwidth(0.4) lcolor(black)) reflevel(median) separate(spp_num) jitter(3 3 3 3 3 3) ///
title("Ampicillin, {it:S. enterica} density", size(large) color(black) margin(zero)) ///
ytitle("Diameter of cleared area (mm)", size(medlarge)) xtitle("Species", size(medlarge)) ///
legend(off) ///
height(0.5) ///
lwidth(thick) lcolor(black) ///
mcolor(midblue gold black cranberry green purple)  ///
msymbol(circle circle circle circle circle) ///
msize(medium medium medium medium medium) ///
xlabel(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "3x {it:S.enterica}" 4 "{it:M. extorquens}" 5 `" "Coop." "comm." "' 6 `" "Comp." "comm" "') ///
xlabel(, alternate) ///
ylabel(0(10)60, angle(horizontal)) ///
yscale(range(0 60)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
scale(1.15)

