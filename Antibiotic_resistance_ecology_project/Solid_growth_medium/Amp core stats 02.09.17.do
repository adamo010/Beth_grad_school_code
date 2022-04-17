*variables: whatever
*Amp
ranksum area if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum area if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum area if(ab=="amp" & (spp=="E" | spp=="coop")), by(spp)
ranksum area if(ab=="amp" & (spp=="E" | spp=="comp")), by(spp)
ranksum area if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum area if(ab=="amp" & (spp=="S" | spp=="coop")), by(spp)
ranksum area if(ab=="amp" & (spp=="S" | spp=="comp")), by(spp)
ranksum area if(ab=="amp" & (spp=="M" | spp=="coop")), by(spp)
ranksum area if(ab=="amp" & (spp=="M" | spp=="comp")), by(spp)
ranksum area if(ab=="amp" & (spp=="coop" | spp=="comp")), by(spp)

