****** Amp P10 MICs over time: try to make boxplots for each time point

*variables: spp (E/S), spp_num(1/2), evol(mono/coop), evol_num(1/2), comm_type(Emono/Smono/Ecoop/Scoop), comm_type_num(1/2/3/4),
*ab(Rif/Amp), ab_num(1/2), passage(1-20), rep(1-6), mic(#)

clear
use "C:\Users\adamo\OneDrive\Documents\Harcombe_lab\AbR_evolution\Data analysis in Stata\Population MICs over time\05.25.18 population MICs for stats no precalculated medians.dta"

generate log2mic = ln(mic)/ln(2) 

*Summary stats

by ab comm_type, sort: table comm_type ab if passage==1, contents(mean mic median mic min mic max mic)

by comm_type, sort: table comm_type if passage==10 & ab=="Amp", contents(mean mic median mic min mic max mic)

by comm_type, sort: table comm_type if passage==20 & ab=="Rif", contents(mean mic median mic min mic max mic)
