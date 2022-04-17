use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR project\AbR paper 1 figures centralized\Supplemental figures\Pa14 on mucin\01.03.17 Pa14 on mucin alone.dta", clear

*Stats: 
kwallis rel, by(conc_amp)

*Edit data for graph
collapse(mean) meanrel=rel (sd) sdrel=rel (count) n=rel, by(conc_amp)
generate hirel = meanrel + sdrel
generate lorel = meanrel - sdrel
generate colnum = 1 if conc_amp == 0
replace colnum = 2 if conc_amp == 5
replace colnum = 3 if conc_amp == 10
replace colnum = 4 if conc_amp == 25

*Graph: looks cool beans: had to do a few hand edits, but not too bad.
twoway (bar meanrel colnum if (conc_amp==0), color(blue*0.25)) ///
(bar meanrel colnum if (conc_amp==5), color(blue*0.5)) ///
(bar meanrel colnum if (conc_amp==10), color(blue*0.75)) ///
(bar meanrel colnum if (conc_amp==25), color(blue)) ///
(rcap hirel lorel colnum, color(black)), ///
legend(off) ///
xlabel(1 "0" 2 "5" 3 "10" 4 "25", labsize(medium)) ///
ytitle("Relative CFU", size(medlarge)) ///
yscale(range(0 1.4)) ytick(#8) ///
ylabel(#8, angle(horizontal) labsize(medium)) ///
xtitle("Concentration of Ampicillin (ug/mL)", size(medlarge)) ///
graphregion(fcolor(white)) ///
plotregion(margin(small)) ///
text(1.35 2.5 "p=0.4862", size(medium))



