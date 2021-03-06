*Amp core
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)

*Amp 2spp
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="ES")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="EM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="SM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="ES" | spp=="EM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="ES" | spp=="SM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="ES" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="EM" | spp=="SM")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="EM" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="SM" | spp=="coop")), by(spp)

*Amp Sal density stats
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="3xS")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="3xS")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="M")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="3xS" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)

*Tet
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="S")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="M")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="E" | spp=="comp")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="S" | spp=="M")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="S" | spp=="coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="S" | spp=="comp")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="M" | spp=="coop")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="M" | spp=="comp")), by(spp)
ranksum diameter if(ab=="tet" & (spp=="coop" | spp=="comp")), by(spp)
