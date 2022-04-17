*Bar graphs: nicked this from area stuff- should work for mic
*need to do Abs seperately
collapse(mean) meanmic= mic (sd) sdmic=mic (count) n=mic, by(spp)
generate himic = meanmic + sdmic
generate lomic = meanmic - sdmic
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
replace spp_num =4 if spp=="coop"
replace spp_num =5 if spp=="comp"
generate type =1 if spp=="E"
replace type =2 if spp=="S"
replace type =3 if spp=="M"
replace type =4 if spp=="coop"
replace type =5 if spp=="comp"
*try this one:
*seperate window as usual
twoway (bar meanmic type if spp_num==1, color (midblue)) ///
(bar meanmic type if spp_num==2, color(cranberry)) ///
(bar meanmic type if spp_num==3, color(green)) ///
(bar meanmic type if spp_num==4, color(gs6)) ///
(bar meanmic type if spp_num==5, color(purple)) ///
(rcap himic lomic type, color(black)), ///
legend (colfirst order(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 "Cooperative community" 5 "Competitive community")) ///
ytitle("Average MIC (ng/uL)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
xtitle("Species") ///
xlabel(1 " " 2 " " 3 " " 4 " " 5 " ", noticks) ///
graphregion(fcolor(white))
*Tet
twoway (bar meanmic type if spp_num==1, color (midblue)) ///
(bar meanmic type if spp_num==2, color(cranberry)) ///
(bar meanmic type if spp_num==3, color(green)) ///
(bar meanmic type if spp_num==4, color(gs6)) ///
(bar meanmic type if spp_num==5, color(purple)) ///
(rcap himic lomic type, color(black)), ///
legend (colfirst order(1 "{it:E. coli}" 2 "{it:S. enterica}" 3 "{it:M. extorquens}" 4 "Cooperative community" 5 "Competitive community")) ///
ytitle("Average MIC (ng/uL)") xtitle("Species") ///
ylabel(, angle(horizontal)) ///
xtitle("Species") ///
xlabel(1 " " 2 " " 3 " " 4 " " 5 " ", noticks) ///
graphregion(fcolor(white))

