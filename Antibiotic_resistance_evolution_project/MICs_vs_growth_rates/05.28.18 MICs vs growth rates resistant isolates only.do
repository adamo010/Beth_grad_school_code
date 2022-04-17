****Variable names
*isolate_id, ab (Rif/Amp), ab_num (1,2), type (anc, pop, abfree_isol, res_isol), type_num (1/2/3/4), 
*growth_condn (mono/coop), growth_condn_num (1/2), evol_condn (Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc/Coop), 
*evol_condn_num (1/2/3/4/5/6/7/8), spp (E/S/ES), spp_num (1/2/3), rep (1-6), mono_gr, mono_yield, coop_gr, coop_yield

*Colour schema for reps 1-6, respectively:
*Emono abfree: blue*0.5 bluishgray*0.5 cyan*0.5 eltblue*0.5 midblue*0.5 teal*0.5
*Emono res: blue bluishgray cyan eltblue midblue teal
*Smono abfree: gold*0.25
*Smono res: gold
*Coop abfree: lime*0.35 dkgreen*0.5 olive_teal*0.5 midgreen*0.5 mint*0.5 eltgreen*0.5
*Coop res: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

generate dumb_shit = 1 if type=="anc" & evol_condn=="Eanc"
replace dumb_shit = 2 if type=="abfree_isol" & evol_condn=="Emono"
replace dumb_shit = 3 if type=="res_isol" & evol_condn=="Emono"
replace dumb_shit = 4 if type=="abfree_isol" & evol_condn=="Ecoop"
replace dumb_shit = 5 if type=="res_isol" & evol_condn=="Ecoop"
replace dumb_shit = 6 if type=="anc" & evol_condn=="Coopanc"
replace dumb_shit = 7 if type=="anc" & evol_condn=="Sanc"
replace dumb_shit = 8 if type=="abfree_isol" & evol_condn=="Smono"
replace dumb_shit = 9 if type=="res_isol" & evol_condn=="Smono"
replace dumb_shit = 10 if type=="abfree_isol" & evol_condn=="Scoop"
replace dumb_shit = 11 if type=="res_isol" & evol_condn=="Scoop"

generate log2mic = ln(mic)/ln(2) 

*************************
*Rifampicin growth rates
*not by replicate
*************************

*Rif E monoculture GRs
regress mono_gr mic if dumb_shit==3 & ab=="Rif"
est store mono_ev_RifE
regress mono_gr mic if dumb_shit==5 & ab=="Rif"
est store coop_ev_RifE
suest mono_ev_RifE coop_ev_RifE
test [mono_ev_RifE_mean]mic=[coop_ev_RifE_mean]mic

*Rif Ecoli monoculture vs coculture: monoculture growth rates
graph twoway (lfit mono_gr mic if dumb_shit==1 & ab=="Rif", color(gs6)) ///
(scatter mono_gr mic if dumb_shit==1 & ab=="Rif", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==3 & ab=="Rif", color(midblue)) ///
(scatter mono_gr mic if dumb_shit==3 & ab=="Rif", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==5 & ab=="Rif", color(purple)) ///
(scatter mono_gr mic if dumb_shit==5 & ab=="Rif", color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Rifampicin, isolate MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0)) ///
text(0.6 100 "R{superscript:2}=0.3481", size(medsmall)) text(0.3 45 "R{superscript:2}= 0.0635", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.5186", size(medsmall) span) 

*Rif S monoculture GRs
regress mono_gr mic if dumb_shit==9 & ab=="Rif"
est store mono_ev_RifS
regress mono_gr mic if dumb_shit==11 & ab=="Rif"
est store coop_ev_RifS
suest mono_ev_RifS coop_ev_RifS
test [mono_ev_RifS_mean]mic=[coop_ev_RifS_mean]mic

*Rif Sal monoculture vs coculture: monoculture growth rates
graph twoway (lfit mono_gr mic if dumb_shit==7 & ab=="Rif", color(gs6)) ///
(scatter mono_gr mic if dumb_shit==7 & ab=="Rif", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==9 & ab=="Rif", color(gold)) ///
(scatter mono_gr mic if dumb_shit==9 & ab=="Rif", color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==11 & ab=="Rif", color(midgreen)) ///
(scatter mono_gr mic if dumb_shit==11 & ab=="Rif", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Rifampicin, isolate MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0)) ///
text(0.7 200 "R{superscript:2}=0.4914", size(medsmall)) text(0.9 100 "R{superscript:2}= 0.0995", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p<0.00001", size(medsmall) span) 

*Coculture GRs Rif

*Rif E cocultureculture GRs
regress coop_gr mic if dumb_shit==3 & ab=="Rif"
est store mono_ev_RifE
regress coop_gr mic if dumb_shit==5 & ab=="Rif"
est store coop_ev_RifE
suest mono_ev_RifE coop_ev_RifE
test [mono_ev_RifE_mean]mic=[coop_ev_RifE_mean]mic

*Rif Ecoli monoculture vs coculture: coculture growth rates
graph twoway (lfit coop_gr mic if dumb_shit==1 & ab=="Rif", color(gs6)) ///
(scatter coop_gr mic if dumb_shit==1 & ab=="Rif", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==3 & ab=="Rif", color(midblue)) ///
(scatter coop_gr mic if dumb_shit==3 & ab=="Rif", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==5 & ab=="Rif", color(purple)) ///
(scatter coop_gr mic if dumb_shit==5 & ab=="Rif", color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Rifampicin, isolate MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
text(0.37 100 "R{superscript:2}=0.2153", size(medsmall)) text(0.5 49 "R{superscript:2}= 0.0808", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.0655", size(medsmall) span) 

*Rif S monoculture GRs
regress coop_gr mic if dumb_shit==9 & ab=="Rif"
est store mono_ev_RifS
regress coop_gr mic if dumb_shit==11 & ab=="Rif"
est store coop_ev_RifS
suest mono_ev_RifS coop_ev_RifS
test [mono_ev_RifS_mean]mic=[coop_ev_RifS_mean]mic

*Rif Sal monoculture vs coculture: coculture growth rates
graph twoway (lfit coop_gr mic if dumb_shit==7 & ab=="Rif", color(gs6)) ///
(scatter coop_gr mic if dumb_shit==7 & ab=="Rif", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==9 & ab=="Rif", color(gold)) ///
(scatter coop_gr mic if dumb_shit==9 & ab=="Rif", color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==11 & ab=="Rif", color(midgreen)) ///
(scatter coop_gr mic if dumb_shit==11 & ab=="Rif", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Rifampicin, isolate MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Rifampicin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
text(0.5 200 "R{superscript:2}=0.2828", size(medsmall)) text(0.57 95 "R{superscript:2}= 0.0016", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.3696", size(medsmall) span) 

***********************************************************************************************************

*************************
*Ampicillin growth rates
*not by replicate
*************************

*Amp E monoculture GRs
regress mono_gr mic if dumb_shit==3 & ab=="Amp"
est store mono_ev_AmpE
regress mono_gr mic if dumb_shit==5 & ab=="Amp"
est store coop_ev_AmpE
suest mono_ev_AmpE coop_ev_AmpE
test [mono_ev_AmpE_mean]mic=[coop_ev_AmpE_mean]mic

*Amp Ecoli monoculture vs coculture: monoculture growth rates
graph twoway (lfit mono_gr mic if dumb_shit==1 & ab=="Amp", color(gs6)) ///
(scatter mono_gr mic if dumb_shit==1 & ab=="Amp", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==3 & ab=="Amp", color(midblue)) ///
(scatter mono_gr mic if dumb_shit==3 & ab=="Amp", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==5 & ab=="Amp", color(purple)) ///
(scatter mono_gr mic if dumb_shit==5 & ab=="Amp", color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Ampicillin, isolate MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0)) ///
text(0.36 100 "R{superscript:2}=0.5285", size(medsmall)) text(0.56 45 "R{superscript:2}= 0.0010", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.3313", size(medsmall) span) 

*Amp S monoculture GRs
regress mono_gr mic if dumb_shit==9 & ab=="Amp"
est store mono_ev_AmpS
regress mono_gr mic if dumb_shit==11 & ab=="Amp"
est store coop_ev_AmpS
suest mono_ev_AmpS coop_ev_AmpS
test [mono_ev_AmpS_mean]mic=[coop_ev_AmpS_mean]mic

*Amp Sal monoculture vs coculture: monoculture growth rates
graph twoway (lfit mono_gr mic if dumb_shit==7 & ab=="Amp", color(gs6)) ///
(scatter mono_gr mic if dumb_shit==7 & ab=="Amp", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==9 & ab=="Amp", color(gold)) ///
(scatter mono_gr mic if dumb_shit==9 & ab=="Amp", color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit mono_gr mic if dumb_shit==11 & ab=="Amp", color(midgreen)) ///
(scatter mono_gr mic if dumb_shit==11 & ab=="Amp", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Ampicillin, isolate MICs" "vs. monoculture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Monoculture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)1.0, labsize(medium)) yscale(range(0 1.0)) ///
text(0.9 200 "R{superscript:2}=0.0455", size(medsmall)) text(0.65 325 "R{superscript:2}= 0.2251", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.0197", size(medsmall) span) 

*Coculture GRs Amp

*Amp E cocultureculture GRs
regress coop_gr mic if dumb_shit==3 & ab=="Amp"
est store mono_ev_AmpE
regress coop_gr mic if dumb_shit==5 & ab=="Amp"
est store coop_ev_AmpE
suest mono_ev_AmpE coop_ev_AmpE
test [mono_ev_AmpE_mean]mic=[coop_ev_AmpE_mean]mic

*Amp Ecoli monoculture vs coculture: coculture growth rates
graph twoway (lfit coop_gr mic if dumb_shit==1 & ab=="Amp", color(gs6)) ///
(scatter coop_gr mic if dumb_shit==1 & ab=="Amp", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==3 & ab=="Amp", color(midblue)) ///
(scatter coop_gr mic if dumb_shit==3 & ab=="Amp", color(midblue) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==5 & ab=="Amp", color(purple)) ///
(scatter coop_gr mic if dumb_shit==5 & ab=="Amp", color(purple) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:E. coli} Ampicillin, isolate MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
text(0.45 100 "R{superscript:2}=0.2318", size(medsmall)) text(0.6 49 "R{superscript:2}= 0.1168", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.0511", size(medsmall) span) 

*Amp S monoculture GRs
regress coop_gr mic if dumb_shit==9 & ab=="Amp"
est store mono_ev_AmpS
regress coop_gr mic if dumb_shit==11 & ab=="Amp"
est store coop_ev_AmpS
suest mono_ev_AmpS coop_ev_AmpS
test [mono_ev_AmpS_mean]mic=[coop_ev_AmpS_mean]mic

*Amp Sal monoculture vs coculture: coculture growth rates
graph twoway (lfit coop_gr mic if dumb_shit==7 & ab=="Amp", color(gs6)) ///
(scatter coop_gr mic if dumb_shit==7 & ab=="Amp", color(gs6) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==9 & ab=="Amp", color(gold)) ///
(scatter coop_gr mic if dumb_shit==9 & ab=="Amp", color(gold) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)) ///
(lfit coop_gr mic if dumb_shit==11 & ab=="Amp", color(midgreen)) ///
(scatter coop_gr mic if dumb_shit==11 & ab=="Amp", color(midgreen) msymbol(circle) msize(large) mlcolor(black) mlwidth(vthin)), ///
title("{it:S. enterica} Ampicillin, isolate MICs" "vs. co-culture growth rates", size(medlarge) color(black) margin(zero)) ///
xtitle("[Ampicillin] ({&mu}g/mL)", size(medsmall)) ytitle("Co-culture growth rate", size(medium) margin(vsmall)) ///
legend(nocolfirst rows(3) order(1 "Ancestral" 3 "Monoculture-evolved, resistant" 5 "Coculture-evolved, resistant") size(medsmall) keygap(zero)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(, angle(horizontal) labsize(medsmall)) ///
ylabel(0(0.1)0.7, labsize(medium)) yscale(range(0 0.7)) ///
text(0.65 43 "R{superscript:2}=0.0421", size(medsmall)) text(0.5 200 "R{superscript:2}= 0.1482", size(medsmall)) ///
note("slope{subscript: mono-evolved} vs. slope{subscript: coop-evolved} p=0.0330", size(medsmall) span) 




