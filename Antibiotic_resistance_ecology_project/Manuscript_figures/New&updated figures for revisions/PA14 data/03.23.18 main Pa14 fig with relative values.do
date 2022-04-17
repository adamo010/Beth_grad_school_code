*Stats: 
kwallis rel if type_num==1, by(conc)
kwallis rel if type_num==2, by(conc)
kwallis rel if type_num==3, by(conc)

*PA14 on mucin
ranksum rel if (type_num==1 & conc==0 | conc==5), by(conc)
ranksum rel if (type_num==1 & conc==0 | conc==10), by(conc)
ranksum rel if (type_num==1 & conc==0 | conc==25), by(conc)
ranksum rel if (type_num==1 & conc==5 | conc==10), by(conc)
ranksum rel if (type_num==1 & conc==5 | conc==25), by(conc)
ranksum rel if (type_num==1 & conc==10 | conc==25), by(conc)

*PA14 coculture
ranksum rel if (type_num==2 & conc==0 | conc==5), by(conc)
ranksum rel if (type_num==2 & conc==0 | conc==10), by(conc)
ranksum rel if (type_num==2 & conc==0 | conc==25), by(conc)
ranksum rel if (type_num==2 & conc==5 | conc==10), by(conc)
ranksum rel if (type_num==2 & conc==5 | conc==25), by(conc)
ranksum rel if (type_num==2 & conc==10 | conc==25), by(conc)

*Fermenters only
ranksum rel if (type_num==3 & conc==0 | conc==5), by(conc)
ranksum rel if (type_num==3 & conc==0 | conc==10), by(conc)
ranksum rel if (type_num==3 & conc==0 | conc==25), by(conc)
ranksum rel if (type_num==3 & conc==5 | conc==10), by(conc)
ranksum rel if (type_num==3 & conc==5 | conc==25), by(conc)
ranksum rel if (type_num==3 & conc==10 | conc==25), by(conc)


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
xlabel(2.5 `" "PA14 on" "mucin (CFU)" "' 7.5 `" "Co-culture on" "mucin (PA14 CFU)" "' 12.5 `" "Fermenters on" "mucin (OD600)" "') ///
ytitle("Relative CFU", axis(1) size(medlarge)) ytitle("Relative OD600", axis(2) size(medlarge)) ///
yscale(axis(1) range(0 1.3)) ytick(#8, axis(1)) yscale(axis(2) range(0 1.3)) ytick(#8, axis(2)) ///
ylabel(#8, axis(1) angle(horizontal) labsize(medium)) ylabel(#8, axis(2) angle(horizontal) labsize(medium)) ///
xtitle(" ") ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) ///
text(1.3 2.5 "p=0.4862") text(1.1 7.5 "p=0.0173") text(1.1 12.5 "p=0.0216") ///
scale(0.8)





