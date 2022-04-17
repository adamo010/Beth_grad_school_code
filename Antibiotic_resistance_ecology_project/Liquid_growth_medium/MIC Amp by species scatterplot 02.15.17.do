*Amp graphs
*first, need to add a new variable that allows each spp/culture type combination to be a different value therefore colour
generate spptype =1 if spp=="E" & type=="mono"
replace spptype =2 if spp=="E" & type=="coop"
replace spptype =3 if spp=="E" & type=="comp"
replace spptype =4 if spp=="S" & type=="mono"
replace spptype =5 if spp=="S" & type=="coop"
replace spptype =6 if spp=="S" & type=="comp"
replace spptype =7 if spp=="M" & type=="mono"
replace spptype =8 if spp=="M" & type=="coop"
replace spptype =9 if spp=="M" & type=="comp"
*now, graph
twoway (scatter mic spptype if spptype==1,color(midblue*.8)) ///
(scatter mic spptype if spptype==2,color(midblue*.5)) ///
(scatter mic spptype if spptype==3,color(midblue*.2)) ///
(scatter mic spptype if spptype==4,color(cranberry*.8)) ///
(scatter mic spptype if spptype==5,color(cranberry*.5)) ///
(scatter mic spptype if spptype==6,color(cranberry*.2)) ///
(scatter mic spptype if spptype==7,color(green*.8)) ///
(scatter mic spptype if spptype==8,color(green*.5)) ///
(scatter mic spptype if spptype==9,color(green*.2)), ///
legend(off) ///
ytitle("MIC (ug/mL)", size(medium)) xtitle("Species", size(medium)) ///
xlabel(1 "E. monoculture" 2 "E. cooperative" 3 "E. competitive" 4 "S. monoculture" 5 "S. cooperative" 6 "S. competitive" 7 "M. monoculture" 8 "M. cooperative" 9 "M. competitive") ///
xlabel(, labsize(small) alternate) ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(large))

