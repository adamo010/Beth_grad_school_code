*variables: mic, spp, ab, type, spp_num, ab_num, type_num
*don't fuck with this- just do as is written
*also: holy fuck do each Ab seperately, because damn, Salmonella, those error bars! if you don't
collapse (mean) meanmic= mic (sd) sdmic= mic (count) n=mic, by(type spp)
generate himic = meanmic + sdmic
generate lomic = meanmic - sdmic
*create new vars with E=1, S=2, M=3
generate spp_num =1 if spp=="E"
replace spp_num =2 if spp=="S"
replace spp_num =3 if spp=="M"
generate type_num =1 if type=="mono"
replace type_num =2 if type=="coop"
replace type_num =3 if type=="comp"
generate spptype =type_num if spp=="E"
replace spptype =type_num+5 if spp=="S"
replace spptype =type_num+10 if spp=="M"
sort spptype
list spptype spp type, sepby(spp)
*post this in another file and hit 'play'
*for Amp
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
*for Tet
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
legend(colfirst rows(3) size(medsmall) margin(zero) order(1 "E. monoculture" 2 "E. cooperative" 3 "E. competitive" 4 "S. monoculture" 5 "S. cooperative" 6 "S. competitive" 7 "M. monoculture" 8 "M. cooperative" 9 "M. competitive") ) ///
xlabel( 2 "{it:E. coli}" 7 "{it:S. enterica}" 12 "{it:M. extorquens}", noticks) ///
ytitle("MIC (ng/uL)") ///
xtitle("Species") ///
ylabel(, angle(horizontal)) ///
xtitle(" ") ///
graphregion(fcolor(white) margin(vsmall))


		
