*Variable names:
*type(PA14 on glu CFU/PA14 on mucin/Pa14 co CFU/ferm only), type_num(1/2/3/4),
*conc_amp(0/5/10/25), amp_num(1/2/3/4), raw(big num), relative(small num)

*Probably have to do this in two separate graphs because OD600 is so different from CFU

*Stats: 
kwallis rel if type_num==1, by(conc)
kwallis rel if type_num==2, by(conc)
kwallis rel if type_num==3, by(conc)
kwallis rel if type_num==4, by(conc)

*Edit data for graph
collapse(mean) meanraw=raw (sd) sdraw=raw (count) n=raw, by(amp_num type_num)
generate hiraw = meanraw + sdraw
generate loraw = meanraw - sdraw
generate typeamp = amp_num if type_num==1
replace typeamp = amp_num+5 if type_num==2
replace typeamp = amp_num+10 if type_num==3
***only add this part after graph 1
replace typeamp = amp_num+15 if type_num==4


*Graph one: CFU
twoway (bar meanraw typeamp if (amp_num==1 & type_num==1), color(gold*0.25)) ///
(bar meanraw typeamp if (amp_num==1 & type_num==2), color(blue*0.25)) ///
(bar meanraw typeamp if (amp_num==1 & type_num==3), color(midgreen*0.25)) ///
(bar meanraw typeamp if (amp_num==2 & type_num==1), color(gold*0.5)) ///
(bar meanraw typeamp if (amp_num==2 & type_num==2), color(blue*0.5)) ///
(bar meanraw typeamp if (amp_num==2 & type_num==3), color(midgreen*0.5)) ///
(bar meanraw typeamp if (amp_num==3 & type_num==1), color(gold*0.75)) ///
(bar meanraw typeamp if (amp_num==3 & type_num==2), color(blue*0.75)) ///
(bar meanraw typeamp if (amp_num==3 & type_num==3), color(midgreen*0.75)) ///
(bar meanraw typeamp if (amp_num==4 & type_num==1), color(gold)) ///
(bar meanraw typeamp if (amp_num==4 & type_num==2), color(blue)) ///
(bar meanraw typeamp if (amp_num==4 & type_num==3), color(midgreen)) ///
(rcap hiraw loraw typeamp, color(black)) , ///
legend(colfirst rows(3) order(1 " " 2 "0ug/mL" "Ampicillin" 3 " " ///
4 " " 5 "5ug/mL" "Ampicillin" 6 " " 7 " " 8 "10ug/mL" "Ampicillin" 9 " " ///
10 " " 11 "25ug/mL" "Ampicillin" 12 " ") size(medium) symxsize(7)) ///
xlabel(2.5 `" "PA14 on glucose" "(monoculture)" "' 7.5 `" "PA14 on mucin" "(monoculture)" "' 12.5 `" "PA14 on mucin" "(co-culture)" "') ///
ytitle("Colony-forming units (CFU)", size(medium)) ///
yscale(range(0 2.5e09)) ytick(#6) ///
ylabel(#6, angle(horizontal) labsize(medsmall)) ///
xtitle(" ") ///
xscale(range(0 14)) xsc(r(0(1)14)) ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) ///
text(4.7e+08 2.5 "p=0.4432") text(5.7e+08 7.5 "p=0.4832") text(2.2e+09 12.5 "p=0.0173") ///
scale(0.8)


*Graph two: OD600

*NOW do this one: 
*have to re-input the fermenters only data ONLY
collapse(mean) meanraw=raw (sd) sdraw=raw (count) n=raw, by(amp_num type_num)
generate hiraw = meanraw + sdraw
generate loraw = meanraw - sdraw
generate typeamp = amp_num if type_num==4

twoway (bar meanraw typeamp if (amp_num==1 & type_num==4), color(magenta*0.25)) ///
(bar meanraw typeamp if (amp_num==2 & type_num==4), color(magenta*0.5)) ///
(bar meanraw typeamp if (amp_num==3 & type_num==4), color(magenta*0.75)) ///
(bar meanraw typeamp if (amp_num==4 & type_num==4), color(magenta)) ///
(rcap hiraw loraw typeamp, color(black)), ///
legend(colfirst rows(1) order(1 "0ug/mL" "Ampicillin" 2 "5ug/mL" "Ampicillin" 3 "10ug/mL" "Ampicillin" 4 "25ug/mL" "Ampicillin") size(medium) symxsize(7)) ///
xlabel(2.5 "Anaerobic fermenter community on mucin", labsize(medium)) ///
ytitle("OD600", size(medium)) ///
yscale(range(0 0.7)) ytick(#9)  ///
ylabel(#9, angle(horizontal) labsize(medium)) ///
xtitle(" ") ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) ///
text(0.62 2.5 "p=0.0216") ///
scale(0.8)
