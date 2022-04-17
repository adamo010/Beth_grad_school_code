use "C:\Users\adamo\Documents\UMN\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Main figures\Fig7 Pa crossfeeding\11.09.17 retrieved Pa mucin data.dta", clear

*Edit data for graph
collapse(mean) meanrel=rel (sd) sdrel=rel (count) n=rel, by(amp_num type_num)
generate hirel = meanrel + sdrel
generate lorel = meanrel - sdrel
generate typeamp = amp_num if type_num==1
replace typeamp = amp_num+5 if type_num==2
replace typeamp = amp_num+10 if type_num==3

*Graph: looks cool beans: had to do a few hand edits, but not too bad.
twoway (bar meanrel typeamp if (amp_num==1 & type_num==1), c(1) yaxis(1) color(blue*0.25)) ///
(bar meanrel typeamp if (amp_num==1 & type_num==2), c(1) yaxis(1) color(midgreen*0.25)) ///
(bar meanrel typeamp if (amp_num==1 & type_num==3), c(1) yaxis(1) color(magenta*0.25)) ///
(bar meanrel typeamp if (amp_num==2 & type_num==1), c(1) yaxis(1) color(blue*0.5)) ///
(bar meanrel typeamp if (amp_num==2 & type_num==2), c(1) yaxis(1) color(midgreen*0.5)) ///
(bar meanrel typeamp if (amp_num==2 & type_num==3), c(1) yaxis(1) color(magenta*0.5)) ///
(bar meanrel typeamp if (amp_num==3 & type_num==1), c(1) yaxis(2) color(blue*0.75)) ///
(bar meanrel typeamp if (amp_num==3 & type_num==2), c(1) yaxis(2) color(midgreen*0.75)) ///
(bar meanrel typeamp if (amp_num==3 & type_num==3), c(1) yaxis(2) color(magenta*0.75)) ///
(bar meanrel typeamp if (amp_num==4 & type_num==1), c(1) yaxis(2) color(blue)) ///
(bar meanrel typeamp if (amp_num==4 & type_num==2), c(1) yaxis(2) color(midgreen)) ///
(bar meanrel typeamp if (amp_num==4 & type_num==3), c(1) yaxis(2) color(magenta)) ///
(rcap hirel lorel typeamp, color(black) c(1) yaxis(1)) ///
(rcap hirel lorel typeamp, color(black) c(1) yaxis(2)), ///
legend(colfirst rows(3) order(1 " " 2 "0ug/mL" "Ampicillin" 3 " " ///
4 " " 5 "5ug/mL" "Ampicillin" 6 " " 8 " " 9 "10ug/mL" "Ampicillin" 10 " " ///
11 " " 12 "25ug/mL" "Ampicillin" 13 " ") size(medium) symxsize(7)) ///
xlabel(2.5 `" "PA14 on" "glucose (CFU)" "' 7.5 `" "Co-culture on" "mucin (PA14 CFU)" "' 12.5 `" "Fermenters on" "mucin (OD600)" "') ///
ytitle("Relative CFU", axis(1) size(medlarge)) ytitle("Relative OD600", axis(2) size(medlarge)) ///
yscale(axis(1) range(0 1.2)) ytick(#7, axis(1)) yscale(axis(2) range(0 1.2)) ytick(#7, axis(2)) ///
ylabel(#7, axis(1) angle(horizontal) labsize(medium)) ylabel(#7, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) ///
text(1.15 2.5 "p=0.4432") text(1.1 7.5 "p=0.0173") text(1.1 12.5 "p=0.0216") ///
scale(0.8)

*Stats: 
kwallis rel if type_num==1, by(conc)
kwallis rel if type_num==2, by(conc)
kwallis rel if type_num==3, by(conc)



