*variables: whatever
*Do Abs together why not, should be fine
*Amp
ranksum mic if(ab=="amp" & (spp=="E" | spp=="S")), by(spp)
ranksum mic if(ab=="amp" & (spp=="E" | spp=="M")), by(spp)
ranksum mic if(ab=="amp" & (spp=="E" | spp=="Coop")), by(spp)
ranksum mic if(ab=="amp" & (spp=="E" | spp=="Comp")), by(spp)
ranksum mic if(ab=="amp" & (spp=="S" | spp=="M")), by(spp)
ranksum mic if(ab=="amp" & (spp=="S" | spp=="Coop")), by(spp)
ranksum mic if(ab=="amp" & (spp=="S" | spp=="Comp")), by(spp)
ranksum mic if(ab=="amp" & (spp=="M" | spp=="Coop")), by(spp)
ranksum mic if(ab=="amp" & (spp=="M" | spp=="Comp")), by(spp)
ranksum mic if(ab=="amp" & (spp=="Coop" | spp=="Comp")), by(spp)
*Tet
ranksum mic if(ab=="tet" & (spp=="E" | spp=="S")), by(spp)
ranksum mic if(ab=="tet" & (spp=="E" | spp=="M")), by(spp)
ranksum mic if(ab=="tet" & (spp=="E" | spp=="coop")), by(spp)
ranksum mic if(ab=="tet" & (spp=="E" | spp=="comp")), by(spp)
ranksum mic if(ab=="tet" & (spp=="S" | spp=="M")), by(spp)
ranksum mic if(ab=="tet" & (spp=="S" | spp=="coop")), by(spp)
ranksum mic if(ab=="tet" & (spp=="S" | spp=="comp")), by(spp)
ranksum mic if(ab=="tet" & (spp=="M" | spp=="coop")), by(spp)
ranksum mic if(ab=="tet" & (spp=="M" | spp=="comp")), by(spp)
ranksum mic if(ab=="tet" & (spp=="Coop" | spp=="comp")), by(spp)
