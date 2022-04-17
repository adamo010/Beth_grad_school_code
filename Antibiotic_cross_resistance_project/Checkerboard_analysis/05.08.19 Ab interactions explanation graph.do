clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR paper 3\Xboard analysis\05.08.19 Ab interactions explanation graph.dta"

graph twoway (bar mic_drug1 int_num if int_num==1, bcolor(black) lcolor(black) lwidth(thin)) ///
(bar mic_drug1 int_num if int_num==3, bcolor(gold) lcolor(black) lwidth(thin)) ///
(bar mic_drug1 int_num if int_num==5, bcolor(green) lcolor(black) lwidth(thin)) ///
(bar mic_drug1 int_num if int_num==7, bcolor(red) lcolor(black) lwidth(thin)), ///
ytitle("Drug A MIC ({&mu}g/mL)", color(black) size(huge)) ///
xtitle("", margin(medsmall)) ///
ylabel(0(5)15, labsize(huge) angle(horizontal)) yscale(range(0 15)) ///
xlabel(1 `" "Drug A" "alone" "' 3`" "Drug A+B," "Independence" "' ///
5 `" "Drug A+B," "Synergy" "' 7 `" "Drug A+B," "Antagonism" "', labsize(vlarge)) ///
legend(off) ///
graphregion(fcolor(white)) plotregion(margin(zero)) scale(0.9) aspectratio(0.75)

 
