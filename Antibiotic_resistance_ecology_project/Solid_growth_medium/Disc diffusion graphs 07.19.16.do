*this script makes things more similar to the hypothesis graphs
*use data from excel directly, but do it by ab only
*this updated version from the ASM graphs includes ES plates, and only does Amp*
*variables to include: area, spp
collapse(mean) meanarea= area (sd) sdarea=area (count) n=area, by(spp)
generate hiarea = meanarea + sdarea
generate loarea = meanarea - sdarea
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
replace spp_num =4 if spp=="coop"
replace spp_num =5 if spp=="comp"
replace spp_num =6 if spp=="ES"
generate type =1 if spp=="E"
replace type =2 if spp=="S"
replace type =3 if spp=="M"
replace type =4 if spp=="coop"
replace type =5 if spp=="comp"
replace type =6 if spp=="ES"
*This one mutherfucking works!!! re-run it for the tet input and modify:
twoway (bar meanarea type if spp_num==1) ///
(bar meanarea type if spp_num==2) ///
(bar meanarea type if spp_num==3) ///
(bar meanarea type if spp_num==4) ///
(bar meanarea type if spp_num==5) ///
(bar meanarea type if spp_num==6) ///
(rcap hiarea loarea type), ///
legend(order(1 "E. coli" 2 "S. enterica" 3 "M. extorquens" 4 "Cooperative community" 5 "Competitive community" 6 "E. coli/ S. enterica")) ///
ytitle("Average area of clearing (mm^2)") xtitle("Species") ///
title("Ampicillin") ///
note("*discs contained 2.5uL of 10 000ng/uL Ampicillin") 
*Jesus fucking christ I"m so glad this works now

