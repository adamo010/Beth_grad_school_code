*Number of mutations: actual data
*from 02.21.19 compiled mutations list with citatons.xls, but not pulling data directly from this sheet

*In two parts: part 1: total # mutations per replicate, compare mono and coop
*Part 2: total # unique mutations per community type: compare mono and coop

*Part 1: Total # mutations per replicate
clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Number of mutations\03.18.19 number of mutations per replicate no RifSmono rep3.dta"

generate spp = "E" if type=="Emono" | type=="Ecoop"
replace spp = "S" if type=="Smono" | type=="Scoop"

generate rep_name = "Rep 1" if rep==1
replace rep_name = "Rep 2" if rep==2
replace rep_name = "Rep 3" if rep==3
replace rep_name = "Rep 4" if rep==4
replace rep_name = "Rep 5" if rep==5
replace rep_name = "Rep 6" if rep==6

generate typenum = 1 if type=="Emono"
replace typenum = 2 if type=="Ecoop"
replace typenum = 3  if type=="Smono"
replace typenum = 4 if type=="Scoop"

*variables: ab(Rif/Amp) type(Emono/Smono/Ecoop/Scoop), library(BAxxx/rMMxxx), rep(1-6), count(# mutations), spp(E/S)

*Graph E Rif
graph bar count if ab=="Rif" & spp=="E", over(typenum) over(rep_name) asyvars ///
bar(1, color(midblue) lcolor(black) lwidth(medium)) bar(2, color(purple) lcolor(black) lwidth(medium)) ///
title("Number of mutations per replicate in Rifampicin-evolved {it:E. coli}", size(medlarge) color(black) margin(medsmall)) ///
ytitle("# mutations in population", size(medium) color(black)) ///
legend(colfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 2 "Coculture-evolved {it:E. coli}") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("*Mutations are counted if they reach >=50% frequency in the passage 20 population")

*Graph S Rif
graph bar count if ab=="Rif" & spp=="S", over(typenum) over(rep_name) asyvars ///
bar(1, color(gold) lcolor(black) lwidth(medium)) bar(2, color(green) lcolor(black) lwidth(medium)) ///
title("Number of mutations per replicate in Rifampicin-evolved {it:S. enterica}", size(medlarge) color(black) margin(medsmall)) ///
ytitle("# mutations in population", size(medium) color(black)) ///
legend(colfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 2 "Coculture-evolved {it:S. enterica}") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("*Mutations are counted if they reach >=50% frequency in the passage 20 population")

*Graph E Amp
graph bar count if ab=="Amp" & spp=="E", over(typenum) over(rep_name) asyvars ///
bar(1, color(midblue) lcolor(black) lwidth(medium)) bar(2, color(purple) lcolor(black) lwidth(medium)) ///
title("Number of mutations per replicate in Ampicillin-evolved {it:E. coli}", size(medlarge) color(black) margin(medsmall)) ///
ytitle("# mutations in population", size(medium) color(black)) ///
legend(colfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 2 "Coculture-evolved {it:E. coli}") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("*Mutations are counted if they reach >=50% frequency in the passage 10 population")

*Graph S Amp
graph bar count if ab=="Amp" & spp=="S", over(typenum) over(rep_name) asyvars ///
bar(1, color(gold) lcolor(black) lwidth(medium)) bar(2, color(green) lcolor(black) lwidth(medium)) ///
title("Number of mutations per replicate in Ampicillin-evolved {it:S. enterica}", size(medlarge) color(black) margin(medsmall)) ///
ytitle("# mutations in population", size(medium) color(black)) ///
legend(colfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 2 "Coculture-evolved {it:S. enterica}") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
note("*Mutations are counted if they reach >=50% frequency in the passage 10 population")

**************************************************
*Part 2: # unique mutations per community type

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Number of mutations\03.18.19 number of mutations per commtype no RifSmono rep3.dta"

*variables: ab(Rif/Amp), type1(Emono/Smono/Ecoop/Scoop), num_genes1(#), type2(Emono/Smono/Ecoop/Scoop), num_genes2(#)
*Type1 includes mutator Scoop in Amp, type2 does not
generate typenum1 = 1 if type1=="Emono" & ab=="Rif"
replace typenum1 = 2 if type1=="Ecoop" & ab=="Rif"
replace typenum1 = 4 if type1=="Smono" & ab=="Rif"
replace typenum1 = 5 if type1=="Scoop" & ab=="Rif"
replace typenum1 = 8 if type1=="Emono" & ab=="Amp"
replace typenum1 = 9 if type1=="Ecoop" & ab=="Amp"
replace typenum1 = 11 if type1=="Smono" & ab=="Amp"
replace typenum1 = 12 if type1=="Scoop" & ab=="Amp"

generate typenum2 = 1 if type2=="Emono" & ab=="Rif"
replace typenum2 = 2 if type2=="Ecoop" & ab=="Rif"
replace typenum2 = 4 if type2=="Smono" & ab=="Rif"
replace typenum2 = 5 if type2=="Scoop" & ab=="Rif"
replace typenum2 = 8 if type2=="Emono" & ab=="Amp"
replace typenum2 = 9 if type2=="Ecoop" & ab=="Amp"
replace typenum2 = 11 if type2=="Smono" & ab=="Amp"
replace typenum2 = 12 if type2=="Scoop" & ab=="Amp"

*Include mutator strain
twoway (bar num_genes1 typenum1 if type1=="Emono", color(midblue) lcolor(black) lwidth(medium)) ///
(bar num_genes1 typenum1 if type1=="Ecoop", color(purple) lcolor(black) lwidth(medium)) ///
(bar num_genes1 typenum1 if type1=="Smono", color(gold) lcolor(black) lwidth(medium)) ///
(bar num_genes1 typenum1 if type1=="Scoop", color(green) lcolor(black) lwidth(medium)), /// 
title("Number of unique mutations evolved in different communities", size(medlarge) color(black) margin(medsmall)) ///
ytitle("# unique mutations in community type", size(medium) color(black)) ///
xtitle("") xlabel(3 "Rifampicin-evolved" 10 "Ampicllin-evolved", labsize(medsmall)) ///
legend(colfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 2 "Coculture-evolved {it:E. coli}" ///
3 "Monoculture-evolved {it:S. enterica}" 4 "Coculture-evolved {it:S. enterica}") size(medsmall)) ///
graphregion(fcolor(white)) scale(0.9) /// 
plotregion(margin(zero)) ///
note("*Mutations are counted if they reach >=50% frequency in the final passage population")

*Not including mutator strain
*Got a problem with scale here
twoway (bar num_genes2 typenum2 if type2=="Emono", color(midblue) lcolor(black) lwidth(medium)) ///
(bar num_genes2 typenum2 if type2=="Ecoop", color(purple) lcolor(black) lwidth(medium)) ///
(bar num_genes2 typenum2 if type2=="Smono", color(gold) lcolor(black) lwidth(medium)) ///
(bar num_genes2 typenum2 if type2=="Scoop", color(green) lcolor(black) lwidth(medium)), /// 
title("Number of unique mutations evolved in different communities", size(medlarge) color(black) margin(medsmall)) ///
ytitle("# unique mutations in community type", size(medium) color(black)) ///
ylabel(0(1)8) yscale(range(0 8)) ///
xtitle("") xlabel(3 "Rifampicin-evolved" 10 "Ampicllin-evolved", labsize(medsmall)) ///
legend(colfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 2 "Coculture-evolved {it:E. coli}" ///
3 "Monoculture-evolved {it:S. enterica}" 4 "Coculture-evolved {it:S. enterica}") size(medsmall)) ///
graphregion(fcolor(white)) scale(0.9) /// 
plotregion(margin(zero)) ///
note("*Mutations are counted if they reach >=50% frequency in the final passage population" ///
"**Does not include {it:S. enterica} mutator strain evolved in co-culture in Ampicillin")










