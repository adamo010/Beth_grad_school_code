
*Variables: spp (Emono, Coop), startperc (0.03, 62.25), end_perc(some #)

collapse(mean) meanend= end_perc (sd) sdend= end_perc (count) n= end_perc, by(spp start_perc)


*cleanup
collapse (mean) meanpercent= galk_percent (sd) sdpercent= galk_percent (count) n=galk_percent, by(spp startend)

generate hipercent = meanpercent + invttail(n-1,0.025)*(sdpercent / sqrt(n))
generate lopercent = meanpercent - invttail(n-1,0.025)*(sdpercent / sqrt(n))

generate spptime = 1 if startend=="start" & spp=="Emono"
replace spptime = 2 if startend=="end" & spp=="Emono"
replace spptime = 3 if startend=="start" & spp=="Coop"
replace spptime = 4 if startend=="start" & spp=="Coop"

*graphing
twoway (scatter meanfinal, by(sppinitial))
 if initialgalk==0.03 & spp=="Emono", color(midblue)) ///
(scatter meanfinal sppinitial if initialgalk==0.03 & spp=="Coop", color(green)) ///
(rcap hifinal lofinal sppinitial)


twoway (bar meanwrite sesrace if race==1) ///
       (bar meanwrite sesrace if race==2) ///
       (bar meanwrite sesrace if race==3) ///
       (bar meanwrite sesrace if race==4) ///
       (rcap hiwrite lowrite sesrace), ///
       legend(row(1) order(1 "Hispanic" 2 "Asian" 3 "Black" 4 "White") ) ///
       xlabel( 2.5 "Low" 7.5 "Middle" 12.5 "High", noticks) ///
       xtitle("Socio Economic Status") ytitle("Mean Writing Score")

twoway (bar meanmic spptype if type=="mono" & spp=="E",color(midblue*.8)) ///
(bar meanmic spptype if type=="coop" & spp=="E",color(midblue*.5)) ///
(bar meanmic spptype if type=="comp" & spp=="E",color(midblue*.2)) ///
(bar meanmic spptype if type=="mono" & spp=="S",color(cranberry*.8)) ///
(bar meanmic spptype if type=="coop" & spp=="S",color(cranberry*.5)) ///
(bar meanmic spptype if type=="comp" & spp=="S",color(cranberry*.2)) ///
(bar meanmic spptype if type=="mono" & spp=="M",color(green*.8)) ///
(bar meanmic spptype if type=="coop" & spp=="M",color(green*.5)) ///
(bar meanmic spptype if type=="comp" & spp=="M",color(green*.2)) ///
(rcap himic lomic spptype, color(black)), ///
legend(colfirst rows(3) order(1 "E. monoculture" 2 "E. cooperative" 3 "E. competitive" 4 "S. monoculture" 5 "S. cooperative" 6 "S. competitive" 7 "M. monoculture" 8 "M. cooperative" 9 "M. competitive") ) ///
xlabel( 2 "{it:E. coli}" 7 "{it:S. enterica}" 12 "{it:M. extorquens}", noticks) ///
xtitle("Species") ///
ytitle("MIC (ng/uL)") ///
ylabel(, angle(horizontal)) ///
graphregion(fcolor(white) margin(vsmall))
