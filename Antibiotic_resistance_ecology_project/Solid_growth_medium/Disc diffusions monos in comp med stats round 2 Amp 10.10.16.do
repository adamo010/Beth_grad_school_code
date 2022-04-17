*One Ab at a time- graph by spp, not by Ab per se
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(med spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
*Generate new vars
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
replace spp_num =4 if spp=="comp"
generate med_num =1 if med=="mono"
replace med_num =2 if med=="comp"
replace med_num =3 if med=="comp_succ"
replace med_num =4 if med=="comp_4x_succ"
replace med_num =5 if med=="S_succ"
generate sppmed =med_num if spp=="E"
replace sppmed =med_num+5 if spp=="S"
replace sppmed =med_num+10 if spp=="M"
replace sppmed =med_num+15 if spp=="comp"
sort sppmed
list sppmed spp med, sepby(spp)

*E graph (can be used for Amp and Tet)
twoway (bar meanarea sppmed if med=="mono" & spp=="E", color(midblue)) ///
(bar meanarea sppmed if med=="comp" & spp=="E", color(purple)) ///
(bar meanarea sppmed if med=="comp_succ" & spp=="E", color(purple*.6)) ///
(bar meanarea sppmed if med=="comp_4x_succ" & spp=="E", color(purple*.3)) ///
(rcap hiarea loarea sppmed if spp=="E", color(black)), ///
legend(colfirst rows(2) order(1 "E, monoculture" 2 "E, competitive" 3 "E, competitive + succinate" 4 "E, competitive + 4x succinate")) ///
xlabel(1 " " 2 " " 3 " " 4 " ", noticks) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white) margin(vsmall))


*S graph
twoway (bar meanarea med_num if spp=="S" & med=="mono", color(cranberry)) ///
(bar meanarea med_num if spp=="S" & med=="S_succ", color(cranberry*.5)) ///
(bar meanarea med_num if spp=="S" & med=="comp", color(purple)) ///
(bar meanarea med_num if spp=="S" & med=="comp_succ", color(purple*.6)) ///
(bar meanarea med_num if spp=="S" & med=="comp_4x_succ", color(purple*.3)) ///
(rcap hiarea loarea med_num if spp=="S", color(black)), ///
legend(colfirst rows(3) order(1 "S, monoculture" 2 "S, monoculture+ succinate" 3 "S, competitive" 4 "S, competitive + succinate" 5 "S, competitive + 4x succinate")) ///
xlabel(1 " " 2 " " 3 " " 4 " " 5 " ", noticks) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white) margin(vsmall))

*M graph
twoway (bar meanarea med_num if spp=="M" & med=="mono", color(green)) ///
(bar meanarea med_num if spp=="M" & med=="comp", color(purple)) ///
(bar meanarea med_num if spp=="M" & med=="comp_succ", color(purple*.6)) ///
(bar meanarea med_num if spp=="M" & med=="comp_4x_succ", color(purple*.3)) ///
(rcap hiarea loarea med_num if spp=="M", color(black)), ///
legend(colfirst rows(2) order(1 "M, monoculture" 2 "M, competitive" 3 "M, competitive + succinate" 4 "M, competitive + 4x succinate")) ///
xlabel(1 " " 2 " " 3 " " 4 " ", noticks) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white) margin(vsmall))

*Add a new variable here to get comp med working properly
generate compmed =1 if spp=="comp" & med=="comp"
replace compmed =2 if spp=="comp" & med=="comp_succ"
replace compmed =3 if spp=="comp" & med=="comp_4x_succ"

*Comp graph: no error bars: *Mednum isn't good enough here- need proper values b/c graph is offset
twoway (bar meanarea compmed if spp=="comp" & med=="comp", color(purple)) ///
(bar meanarea compmed if spp=="comp" & med=="comp_succ", color(purple*.6)) ///
(bar meanarea compmed if spp=="comp" & med=="comp_4x_succ", color(purple*.3)) ///
(rcap hiarea loarea compmed if spp=="comp", color(black)), ///
legend(colfirst rows(3) order (1 "Community, competitive" 2 "Community, competitive + succinate" 3 "Community, competitive + 4x succinate")) ///
xlabel(1 " " 2 " " 3 " ", noticks) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white) margin(vsmall))



