*IMPORTANT CONTROL: probably going to be a supplemental figure
*Changes in growth rate due to plate evolution (ignore Abs for now, hopefully)
*Compare GR/yield from ancestor vs. Ab-free evolved wells
*used data from excel file 01.31.17 control of plate vs ancestor Ab-free.xls

*variables to choose: spp (E/S/Coop), spp_num (1/2/3), type(Anc/Abfree), type_num(1/2) ///
*gr(number), yield(number), Ab(Amp/Rif), rep(number), isolate_num(number), evolved_partner(E/S)
*most of these are metadata and don't really matter, but better to have it there in case it all goes to shit and 
*I need to do some other stupid fucking analysis to figure out why

*give stripplot a stab: see how bad this gets
stripplot type_num, over(gr) separate(spp)

*pretty bad- let's go with a boxplot instead
graph box gr, over(type) over(spp) asyvars ///
box(1, color(purple)) marker(1, mcolor(purple)) ///
box(2, color(orange)) marker(2, mcolor(orange)) ///
legend(colfirst rows(1) order(1 "Ancestral" 2 "Antibiotic-free") size(medium)) ///
title("Growth rates of plate-evolved vs. ancestral cells", size(medlarge) color(black)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2)) ///
ytitle("Growth rate", size(medium) color(black)) ///
text(0.75 16 "p=0.1601") text(0.75 52 "p<0.0001") text(1.15 87 "p=0.0495") 

*Run some stats for this: 
ranksum gr if spp=="E. coli", by(type)
ranksum gr if spp=="S. enterica", by(type)
ranksum gr if spp=="Cooperative", by(type)

*That worked pretty okay: take a look at what happens if things are split up by Ab
generate ab_type= type
replace ab_type="Ancestral, Rifampicin" if type=="Anc" & ab=="Rifampicin"
replace ab_type="Ancestral, Ampicillin" if type=="Anc" & ab=="Ampicillin"
replace ab_type="Antibiotic-free, Rifampicin" if type=="Abfree" & ab=="Rifampicin"
replace ab_type="Antibiotic-free, Ampicillin" if type=="Abfree" & ab=="Ampicillin"

graph box gr, over(ab_type) over(spp) over(ab) asyvars ///
box(1, color(purple)) marker(1, mcolor(purple)) ///
box(2, color(orange)) marker(2, mcolor(orange)) ///
box(3, color(pink)) marker(3, mcolor(pink)) ///
box(4, color(midgreen)) marker(4, mcolor(midgreen)) ///
legend(nocolfirst rows(2) order(1 "Ancestral, Ampicillin" 2 "Ancestral, Rifampicin" 3 "Antibiotic-free, Ampicillin" 4 "Antibiotic-free, Rifampicin") size(medium)) ///
title("Growth rates of plate-evolved vs. ancestral cells", size(medlarge) color(black)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2)) ///
ytitle("Growth rate", size(medium) color(black)) ///
text(0.77 7 "p=0.0087", size(small)) text(0.74 23 "p=0.0017", size(small)) text(1.13 39 "p=0.1097", size(small)) ///
text(0.69 62 "p=0.5390", size(small)) text(0.7 79 "p=0.0082", size(small)) text(1.04 95 "p=0.4497", size(small))

ranksum gr if (spp=="Cooperative" & ab=="Ampicillin"), by(type)
ranksum gr if (spp=="E. coli" & ab=="Ampicillin"), by(type)
ranksum gr if (spp=="S. enterica" & ab=="Ampicillin"), by(type)
ranksum gr if (spp=="Cooperative" & ab=="Rifampicin"), by(type)
ranksum gr if (spp=="E. coli" & ab=="Rifampicin"), by(type)
ranksum gr if (spp=="S. enterica" & ab=="Rifampicin"), by(type)

*another way to look at it:
generate ab_type_num= 1
replace ab_type_num=1 if ab_type=="Ancestral, Rifampicin" 
replace ab_type_num=2 if ab_type=="Ancestral, Ampicillin" 
replace ab_type_num=3 if ab_type=="Antibiotic-free, Rifampicin" 
replace ab_type_num=4 if ab_type=="Antibiotic-free, Ampicillin" 

graph box gr, over(ab_type) over(spp) over(type) asyvars ///
box(1, color(purple)) marker(1, mcolor(purple)) ///
box(2, color(orange)) marker(2, mcolor(orange)) ///
box(3, color(pink)) marker(3, mcolor(pink)) ///
box(4, color(midgreen)) marker(4, mcolor(midgreen)) ///
legend(colfirst rows(2) order(3 "Antibiotic-free, Ampicillin" 4 "Antibiotic-free, Rifampicin" 1 "Ancestral, Ampicillin" 2 "Ancestral, Rifampicin" ) size(medium)) ///
title("Growth rates of plate-evolved vs. ancestral cells", size(medlarge) color(black)) ///
graphregion(fcolor(white)) /// 
plotregion(margin(zero)) ///
ylabel(0(0.2)1.2, labsize(medium)) yscale(range(0 1.2)) ///
ytitle("Growth rate", size(medium) color(black)) ///
text(0.74 7.4 "p=0.9714", size(small)) text(0.71 23.9 "p=0.3447", size(small)) text(1.13 40.4 "p=0.8875", size(small)) ///
text(0.70 59.6 "p=0.0100", size(small)) text(0.47 76.1 "p=0.1102", size(small)) text(0.93 92.6 "p=0.0491", size(small))


ranksum gr if (spp=="Cooperative" & type=="Abfree"), by(ab)
ranksum gr if (spp=="E. coli" & type=="Abfree"), by(ab)
ranksum gr if (spp=="S. enterica" & type=="Abfree"), by(ab)
ranksum gr if (spp=="Cooperative" & type=="Anc"), by(ab)
ranksum gr if (spp=="E. coli" & type=="Anc"), by(ab)
ranksum gr if (spp=="S. enterica" & type=="Anc"), by(ab)
