clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\01.27.19 P10 Amp pop and isolate data.dta"

generate log2mic = ln(mic)/ln(2) 

generate repdummy = 1 if rep==1
replace repdummy = 4 if rep==2
replace repdummy = 7 if rep==3
replace repdummy = 10 if rep==4
replace repdummy = 13 if rep==5
replace repdummy = 16 if rep==6 

*For coop
generate evol_binary = "mono" if (evol_condn=="Emono" | evol_condn=="Smono")
replace evol_binary = "coop" if (evol_condn=="Coop" | evol_condn=="Scoop")
generate evol_binary_num = 1 if evol_binary=="mono"
replace evol_binary_num = 2 if evol_binary=="coop"

generate typerep2 = 1 if type=="pop" & rep==1
replace typerep2 = 2 if type=="pop" & rep==2
replace typerep2 = 3 if type=="pop" & rep==3
replace typerep2 = 4 if type=="pop" & rep==4
replace typerep2 = 5 if type=="pop" & rep==5
replace typerep2 = 6 if type=="pop" & rep==6
replace typerep2 = 7 if type=="res_isol" & rep==1 & spp=="E"
replace typerep2 = 8 if type=="res_isol" & rep==2 & spp=="E"
replace typerep2 = 9 if type=="res_isol" & rep==3 & spp=="E"
replace typerep2 = 10 if type=="res_isol" & rep==4 & spp=="E"
replace typerep2 = 11 if type=="res_isol" & rep==5 & spp=="E"
replace typerep2 = 12 if type=="res_isol" & rep==6 & spp=="E"
replace typerep2 = 13 if type=="res_isol" & rep==1 & spp=="S"
replace typerep2 = 14 if type=="res_isol" & rep==2 & spp=="S"
replace typerep2 = 15 if type=="res_isol" & rep==3 & spp=="S"
replace typerep2 = 16 if type=="res_isol" & rep==4 & spp=="S"
replace typerep2 = 17 if type=="res_isol" & rep==5 & spp=="S"
replace typerep2 = 18 if type=="res_isol" & rep==6 & spp=="S"

*Amp Coop
stripplot log2mic if ab=="Amp" & evol_binary=="coop", over(repdummy) stack center vertical separate(typerep2) ///
title("Ampicillin, co-culture, isolates vs. population MICs", size(medlarge) color(black) margin(zero)) ///
ytitle("log{subscript:2}[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Replicate", size(medium) margin(vsmall)) ///
xlabel(1 "1" 4 "2" 7 "3" 10 "4" 13 "5" 16 "6", labsize(medsmall)) ///
height(0.5) ///
mcolor(lime*0.7 dkgreen olive_teal midgreen mint eltgreen gold yellow dkorange sandb orange_red orange) ///
msymbol(triangle triangle triangle triangle triangle triangle diamond diamond diamond diamond diamond diamond diamond) ///
msize(large large large large large large medlarge medlarge medlarge medlarge medlarge medlarge) ///
mlcolor(black black black black black black black black black black black black) /// 
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
legend(colfirst rows(6) order(1 "{it:ftsI} +A (rep1 population)" 2 "{it:yoaE} (rep2 population)" 3 "{it:ompF} (rep3 population)" 4 "{it:ftsI} Q142* (rep4 population)" ///
5 "{it:yoaE} (rep5 population)" 6 "(rep6 population)" 7 "{it:ftsI} wt (rep1 isolates)" 8 "" 9 "" 10 "{it:ftsI} D535Y (rep4 isolates)" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#8, angle(horizontal) labsize(medsmall)) ///
ylabel(-3(1)5, labsize(medium)) yscale(range(-3 5)) 
