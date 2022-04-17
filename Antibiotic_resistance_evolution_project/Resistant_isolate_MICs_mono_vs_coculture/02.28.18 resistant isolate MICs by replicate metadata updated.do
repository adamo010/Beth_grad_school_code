*Redone all the metadata coding to avoid stuff fucking up again
*variable names are: isolateid, ab(Rif/Amp)***, ab_num(1/2), commtype(Emono/Ecoop/Smono/Scoop), ///
*commtype_num(1/2/3/4), evol_condn (mono/coop), evol_condn_num(1/2), spp(E/S), spp_num(1/2), ///
*rep(1-6), isolate_num(1-3), mic(some#)
*data is whatever the latest MIC round is (5, on 2/28/18)- with revised metadata

*first, generate a new rep varaiable such that each rep in mono/coop has a unique value
*put some space between mono and coop values so they don't run together too badly
generate typerep = rep
replace typerep =10 if evol_condn=="coop" & rep==1
replace typerep =11 if evol_condn=="coop" & rep==2
replace typerep =12 if evol_condn=="coop" & rep==3
replace typerep =13 if evol_condn=="coop" & rep==4
replace typerep =14 if evol_condn=="coop" & rep==5
replace typerep =15 if evol_condn=="coop" & rep==6

*also, try this: since making log2-based yaxes is apparently impossible, just log-transform MIC data
generate log2mic = ln(mic)/ln(2) 
*don't ask me, this looks weird but whatever

*Rif Ec graph
stripplot log2mic if ab=="Rif" & spp=="E", over(typerep) stack center vertical separate(typerep)  ///
title("{it:E. coli} Rifampicin, resistant isolate MICs by replicate", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Evolution condition", size(medium) margin(vsmall)) ///
height(0.5) ///
mcolor(blue bluishgray cyan eltblue midblue teal lime*0.7 dkgreen olive_teal midgreen mint eltgreen) ///
msymbol(circle circle circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
xlabel(3.5 "Monoculture-evolved" 12.5 "Coculture-evolved", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6" 7 "" 8 "" 9 "" 10 "" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Rif ESal graph
stripplot log2mic if ab=="Rif" & spp=="S", over(typerep) stack center vertical separate(typerep)  ///
title("{it:S. enterica} Rifampicin, resistant isolate MICs by replicate", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Rifampicin] (ug/mL)", size(medsmall)) xtitle("Evolution condition", size(medium) margin(vsmall)) ///
height(0.5) ///
mcolor(cranberry pink*0.5 maroon red magenta erose lime*0.7 dkgreen olive_teal midgreen mint eltgreen) ///
msymbol(circle circle circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
xlabel(3.5 "Monoculture-evolved" 12.5 "Coculture-evolved", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6" 7 "" 8 "" 9 "" 10 "" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#10, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)9, labsize(medium)) yscale(range(0 9)) 

*Amp Ec graph
*NB: don't have any data for Ecoop rep5 right now, so take this one out: took out mint from mcolor and manually moved eltgreen dot in legend over to rep6
stripplot log2mic if ab=="Amp" & spp=="E", over(typerep) stack center vertical separate(typerep)  ///
title("{it:E. coli} Ampicillin, resistant isolate MICs by replicate", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Evolution condition", size(medium) margin(vsmall)) ///
height(0.5) ///
mcolor(blue bluishgray cyan eltblue midblue teal lime*0.7 dkgreen olive_teal midgreen eltgreen) ///
msymbol(circle circle circle circle circle circle circle circle circle circle  circle) ///
msize(large large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
xlabel(3.5 "Monoculture-evolved" 12.5 "Coculture-evolved", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6" 7 "" 8 "" 9 "" 10 "" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#9, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)8, labsize(medium)) yscale(range(0 8)) 

*Amp Sal graph
*NB: don't have any data for Scoop rep4,6 right now, so take these out: took out midgreen eltgreen from mcolor and manually moved mint dot over to rep5
stripplot log2mic if ab=="Amp" & spp=="S", over(typerep) stack center vertical separate(typerep)  ///
title("{it:S. enterica} Ampicillin, resistant isolate MICs by replicate", size(medlarge) color(black) margin(zero)) ///
ytitle("log2[Ampicillin] (ug/mL)", size(medsmall)) xtitle("Evolution condition", size(medium) margin(vsmall)) ///
height(0.5) ///
mcolor(cranberry pink*0.5 maroon red magenta erose lime*0.7 dkgreen olive_teal mint) ///
msymbol(circle circle circle circle circle circle circle circle circle circle) ///
msize(large large large large large large large large large large) ///
mlcolor(black black black black black black black black black black) ///
mlwidth(vthin vthin vthin vthin vthin vthin vthin vthin vthin vthin) ///
xlabel(3.5 "Monoculture-evolved" 12.5 "Coculture-evolved", labsize(medsmall)) ///
legend(nocolfirst rows(2) order(1 "rep1" 2 "rep2" 3 "rep3" 4 "rep4" 5 "rep5" 6 "rep6" 7 "" 8 "" 9 "" 10 "" 11 "" 12 "") size(medsmall)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(#11, angle(horizontal) labsize(medsmall)) ///
ylabel(0(1)10, labsize(medium)) yscale(range(0 10)) 
