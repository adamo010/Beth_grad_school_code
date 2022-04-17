****** Amp P10 MICs over time: try to make boxplots for each time point

*variables: spp (E/S), spp_num(1/2), evol(mono/coop), evol_num(1/2), comm_type(Emono/Smono/Ecoop/Scoop), comm_type_num(1/2/3/4),
*ab(Rif/Amp), ab_num(1/2), passage(1-20), rep(1-6), mic(#)

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\05.25.18 population MICs for stats no precalculated medians.dta"

generate log2mic = ln(mic)/ln(2) 

******************
*Rifampicin
******************

*Rif Ecoli monoculture
generate log2mic1= log2mic if ab=="Rif" & comm_type=="Emono"
generate log2mic2= log2mic if ab=="Rif" & comm_type=="Ecoop"

ranksum log2mic if ab=="Rif" & spp=="E" & passage==20, by(comm_type)

graph box log2mic1 log2mic2 if ab=="Rif" & spp=="E", over(passage) ///
title("{it:E. coli} in Rifampicin, log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
medtype(marker marker) medmarker(msymbol(circle circle) mcolor(midblue purple)) ///
box(1, bcolor(midblue) lcolor(midblue)) box(2, bcolor(purple) lcolor(purple)) ///
marker(1, mcolor(midblue)) marker(2, mcolor(purple)) ///
ylabel(-3(1)7, labsize(medsmall)) yscale(range(-3 7)) ///
ytitle("log{subscript:2}(MIC) in Rifampicin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 2 "Co-culture-evolved {it:E. coli}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) ///
note("*{it:p}=0.0668 at passage 20, Mann-Whitney U test of median log{subscript:2}MIC")
*not bad: have to move legend down and add passage number to do this, though

*Rif Sal monoculture
generate log2mic3= log2mic if ab=="Rif" & comm_type=="Smono"
generate log2mic4= log2mic if ab=="Rif" & comm_type=="Scoop"

ranksum log2mic if ab=="Rif" & spp=="S" & passage==20, by(comm_type)

graph box log2mic3 log2mic4 if ab=="Rif" & spp=="S", over(passage) ///
title("{it:S. enterica} in Rifampicin, log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
medtype(marker marker) medmarker(msymbol(circle circle) mcolor(gold green)) ///
box(1, bcolor(gold) lcolor(gold)) box(2, bcolor(green) lcolor(green)) ///
marker(1, mcolor(gold)) marker(2, mcolor(green)) ///
ylabel(-3(1)8, labsize(medsmall)) yscale(range(-3 8)) ///
ytitle("log{subscript:2}(MIC) in Rifampicin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 2 "Co-culture-evolved {it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) ///
note("*{it:p}=0.0372 at passage 20, Mann-Whitney U test of median log{subscript:2}MIC")

*not bad: have to move legend down and add passage number to do this, though

******************
*Ampicillin
******************

*Amp Ecoli monoculture
generate log2mic5= log2mic if ab=="Amp" & comm_type=="Emono"
generate log2mic6= log2mic if ab=="Amp" & comm_type=="Ecoop"

ranksum log2mic if ab=="Amp" & spp=="E" & passage==10, by(comm_type)

graph box log2mic5 log2mic6 if ab=="Amp" & spp=="E" & passage<=10, over(passage) ///
title("{it:E. coli} in Ampicillin, log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
medtype(marker marker) medmarker(msymbol(circle circle) mcolor(midblue purple)) ///
box(1, bcolor(midblue) lcolor(midblue)) box(2, bcolor(purple) lcolor(purple)) ///
marker(1, mcolor(midblue)) marker(2, mcolor(purple)) ///
ylabel(-3(1)7, labsize(medsmall)) yscale(range(-3 7)) ///
ytitle("log{subscript:2}(MIC) in Ampicillin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:E. coli}" 2 "Co-culture-evolved {it:E. coli}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) ///
note("*{it:p}=0.0033 at passage 10, Mann-Whitney U test of median log{subscript:2}MIC")

*not bad: have to move legend down and add passage number to do this, though

*Amp Sal monoculture
generate log2mic7= log2mic if ab=="Amp" & comm_type=="Smono"
generate log2mic8= log2mic if ab=="Amp" & comm_type=="Scoop"

ranksum log2mic if ab=="Amp" & spp=="S" & passage==10, by(comm_type)

graph box log2mic7 log2mic8 if ab=="Amp" & spp=="S" & passage<=10, over(passage) ///
title("{it:S. enterica} in Ampicillin, log{subscript:2}MIC over time", size(medlarge) color(black) margin(zero)) ///
medtype(marker marker) medmarker(msymbol(circle circle) mcolor(gold green)) ///
box(1, bcolor(gold) lcolor(gold)) box(2, bcolor(green) lcolor(green)) ///
marker(1, mcolor(gold)) marker(2, mcolor(green)) ///
ylabel(-2(1)6, labsize(medsmall)) yscale(range(-2 6)) ///
ytitle("log{subscript:2}(MIC) in Ampicillin", size(medium)) ///
legend(nocolfirst rows(2) order(1 "Monoculture-evolved {it:S. enterica}" 2 "Co-culture-evolved {it:S. enterica}")) ///
plotregion(margin(zero)) graphregion(fcolor(white)) ///
note("*{it:p}=0.0163 at passage 10, Mann-Whitney U test of median log{subscript:2}MIC")

*not bad: have to move legend down and add passage number to do this, though





**FFUCKKKK THIS**************

*******another option
sort ab_num comm_type_num rep passage
by ab_num comm_type_num rep passage: egen med = median(log2mic)
by ab_num comm_type_num rep passage: egen lqt = pctile(log2mic), p(25)
by ab_num comm_type_num rep passage: egen uqt = pctile(log2mic), p(75)
by ab_num comm_type_num rep passage: egen iqr = iqr(log2mic)

by ab_num comm_type_num rep passage: egen ls = min(max(log2mic, lqt-1.5*iqr))
by ab_num comm_type_num rep passage: egen us = max(min(log2mic, uqt+1.5*iqr)) 
gen outliers = log2mic if(log2mic<=lqt-1.5*iqr | log2mic>=uqt+1.5*iqr)

twoway rbar lqt med passage if ab=="Rif" & comm_type=="Emono", || ///
rbar med uqt passage if ab=="Rif" & comm_type=="Emono"

twoway rbar lqt med passage if ab=="Rif" & comm_type=="Emono", pstyle(p1) barw(.5) || ///
       rbar med uqt passage if ab=="Rif" & comm_type=="Emono", pstyle(p1) barw(.5) || ///
       rspike lqt ls passage if ab=="Rif" & comm_type=="Emono", pstyle(p1) || ///
       rspike uqt us passage if ab=="Rif" & comm_type=="Emono", pstyle(p1) || ///
       rcap ls ls passage if ab=="Rif" & comm_type=="Emono", msize(*6) pstyle(p1) || ///
       rcap us us passage if ab=="Rif" & comm_type=="Emono", msize(*6) pstyle(p1) || ///
       scatter outliers passage if ab=="Rif" & comm_type=="Emono", pstyle(p1) || ///
       connected med passage if ab=="Rif" & comm_type=="Emono", legend(off)
	   
	   
	    xlabel( 1 "general" 2 "academic" 3 "vocational") ytitle(reading score)
	   
	   ///
       xlabel( 1 "general" 2 "academic" 3 "vocational") ytitle(reading score)





