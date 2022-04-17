*One Ab at a time
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(med spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
*Generate new vars
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
replace spp_num =4 if spp=="comm"
generate med_num =1 if med=="E hypho"
replace med_num =2 if med=="S hypho"
replace med_num =3 if med=="S succinate"
replace med_num =4 if med=="M hypho"
replace med_num =5 if med=="Comp"
replace med_num =6 if med=="Comp_succ"
replace med_num =7 if med=="Comp_4x_succ"
generate sppmed =med_num if spp=="E"
replace sppmed =med_num+5 if spp=="S"
replace sppmed =med_num+10 if spp=="M"
replace sppmed =med_num+15 if spp=="comm"
sort sppmed
list sppmed spp med, sepby(spp)
*Amp graph
twoway (bar meanarea sppmed if med=="E hypho" & spp="E", color (midblue)) ///
(bar meanarea sppmed if med=="Comp" & spp="E", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="E", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="E", color(purple*.3)) ///
(bar meanarea sppmed if med=="S hypho" & spp="S", color (cranberry)) ///
(bar meanarea sppmed if med=="Comp" & spp="S", color (purple)) ///
(bar meanarea sppmed if med=="M hypho" & spp="M", color (green)) ///
(bar meanarea sppmed if med=="Comp" & spp="M", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="M", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="M", color(purple*.3)) ///
(bar meanarea sppmed if med=="Comp" & spp="comm", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="comm", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="comm", color(purple*.3)) ///
(rcap himic lomic spptype, color(black)), ///
legend(colfirst rows(4) order(1 "Ec, mono" 2 "Ec, comp" 3 "Ec, comp_succ" 4 "Ec, comp_4x_succ" 5 "Sal, mono" 6 "Sal, comp" 7 "Mex, mono" 8 "Mex, comp" 9 "Mex, comp_succ" 10 "Mex, comp_4x_succ" 11 "Comm, comp" 12 "Comm, comp_succ" 13 "Comm, comp_4x_succ") ) ///
xlabel( 2 "E. coli" 7 "S. enterica" 12 "M. extorquens" 17 "Community", noticks) ///
xtitle("Species") ///
ytitle("Area of clearing (mm^2)") ///
ylabel(, angle(horizontal)) ///
title("Ampicillin", color(black)) ///
graphregion(fcolor(white) margin(vsmall))

*Tet
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(medium spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
*Generate new vars
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
replace spp_num =4 if spp=="comm"
generate med_num =1 if type=="E hypho"
replace med_num =2 if type=="S hypho"
replace med_num =3 if type=="S succinate"
replace med_num =4 if type=="M hypho"
replace med_num =5 if type=="Comp"
replace med_num =6 if type=="Comp_succ"
replace med_num =7 if type=="Comp_4x_succ"
generate spptype =type_num if spp=="E"
replace spptype =type_num+5 if spp=="S"
replace spptype =type_num+10 if spp=="M"
replace spptype =type_num+15 if spp=="comm"
sort spptype
list spptype spp type, sepby(spp)
*Tet graph
twoway (bar meanarea sppmed if med=="E hypho" & spp="E", color (midblue)) ///
(bar meanarea sppmed if med=="Comp" & spp="E", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="E", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="E", color(purple*.3)) ///
(bar meanarea sppmed if med=="S hypho" & spp="S", color (cranberry)) ///
(bar meanarea sppmed if med=="S succinate" & spp=="S", color(cranberry*.5)) ///
(bar meanarea sppmed if med=="Comp" & spp="S", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="S", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="S", color(purple*.3)) ///
(bar meanarea sppmed if med=="M hypho" & spp="M", color (green)) ///
(bar meanarea sppmed if med=="Comp" & spp="M", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="M", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="M", color(purple*.3)) ///
(bar meanarea sppmed if med=="Comp" & spp="comm", color (purple)) ///
(bar meanarea sppmed if med=="Comp_succ" & spp="comm", color(purple*.6)) ///
(bar meanarea sppmed if med=="Comp_4x_succ" & spp=="comm", color(purple*.3)) ///
(rcap himic lomic spptype, color(black)), ///
legend(colfirst rows(4) order(1 "Ec, mono" 2 "Ec, comp" 3 "Ec, comp_succ" 4 "Ec, comp_4x_succ" 5 "Sal, mono" 6 "Sal, succinate" 7 "Sal, comp" 8 "Sal, comp_succ" 9 "Sal, comp_4x succ" 10 "Mex, mono" 11 "Mex, comp" 12 "Mex, comp_succ" 13 "Mex, comp_4x_succ" 14 "Comm, comp" 15 "Comm, comp_succ" 16 "Comm, comp_4x_succ") ) ///
xlabel( 2 "E. coli" 7 "S. enterica" 12 "M. extorquens" 17 "Community", noticks) ///
xtitle("Species") ///
ytitle("Area of clearing (mm^2)") ///
ylabel(, angle(horizontal)) ///
title("Tetracycline", color(black)) ///
graphregion(fcolor(white) margin(vsmall))

