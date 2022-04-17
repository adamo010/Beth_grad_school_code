*Give this a crack
*Do Abs seperately
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp medium)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
generate med_num =1 if medium=="mono"
replace med_num =2 if medium=="comp"
generate sppmed =med_num if spp=="E"
replace sppmed =med_num+5 if spp=="S"
replace sppmed =med_num+10 if spp=="M"
sort sppmed
list sppmed spp medium, sepby(spp)

*Graphs: do each Ab seperately
twoway (bar meanarea sppmed if medium=="mono" & spp=="E",color(midblue)) ///
(bar meanarea sppmed if medium=="comp" & spp=="E",color(midblue*0.4)) ///
(bar meanarea sppmed if medium=="mono" & spp=="S",color(cranberry)) ///
(bar meanarea sppmed if medium=="comp" & spp=="S",color(cranberry*0.4)) ///
(bar meanarea sppmed if medium=="mono" & spp=="M",color(green)) ///
(bar meanarea sppmed if medium=="comp" & spp=="M",color(green*0.4)) ///
(rcap hiarea loarea sppmed, color(black)), ///
legend(order(1 "E. coli, mono" 2 "E. coli, comp" 3 "S. enterica, mono" 4 "S. enterica, comp" 5 "M. extorquens, mono" 6 "M. extroquens, comp")) ///
legend(nocolfirst) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(, nolabel noticks) ///
ylabel(, angle(horizontal)) ///
title("Ampicillin area of clearing", color(black)) ///
graphregion(fcolor(white))

*Tet graph
twoway (bar meanarea sppmed if medium=="mono" & spp=="E",color(midblue)) ///
(bar meanarea sppmed if medium=="comp" & spp=="E",color(midblue*0.4)) ///
(bar meanarea sppmed if medium=="mono" & spp=="S",color(cranberry)) ///
(bar meanarea sppmed if medium=="comp" & spp=="S",color(cranberry*0.4)) ///
(bar meanarea sppmed if medium=="mono" & spp=="M",color(green)) ///
(bar meanarea sppmed if medium=="comp" & spp=="M",color(green*0.4)) ///
(rcap hiarea loarea sppmed, color(black)), ///
legend(order(1 "E. coli, mono" 2 "E. coli, comp" 3 "S. enterica, mono" 4 "S. enterica, comp" 5 "M. extorquens, mono" 6 "M. extroquens, comp")) ///
legend(nocolfirst) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
xlabel(, nolabel noticks) ///
ylabel(, angle(horizontal)) ///
title("Tetracycline area of clearing", color(black)) ///
graphregion(fcolor(white))

