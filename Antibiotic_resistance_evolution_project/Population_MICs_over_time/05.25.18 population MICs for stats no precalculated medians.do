*Variables: spp (E/S), spp_num (1/2), evol (mono/coop), evol_num (1/2), comm_type(Emono/Smono/Ecoop/Scoop), comm_type_num(1/2/3/4),
*ab (Amp/Rif), ab_num(1/2), passage(1-20), rep(1-6), mic(some #)

*Stats only: graph in a different page

ranksum mic if(ab=="Rif" & passage==20 & (comm_type=="Emono" | comm_type=="Ecoop")), by(comm_type)
ranksum mic if(ab=="Rif" & passage==20 & (comm_type=="Smono" | comm_type=="Scoop")), by(comm_type)
ranksum mic if(ab=="Amp" & passage==20 & (comm_type=="Emono" | comm_type=="Ecoop")), by(comm_type)
ranksum mic if(ab=="Amp" & passage==20 & (comm_type=="Smono" | comm_type=="Scoop")), by(comm_type)
