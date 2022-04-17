*variables: whatever
*Do Abs together why not, should be fine
*Amp
ranksum mic if(ab=="amp" & spp=="E" & (type=="mono" | type=="coop")), by(type)
ranksum mic if(ab=="amp" & spp=="E" & (type=="mono" | type=="comp")), by(type)
ranksum mic if(ab=="amp" & spp=="E" & (type=="coop" | type=="comp")), by(type)
ranksum mic if(ab=="amp" & spp=="S" & (type=="mono" | type=="coop")), by(type)
ranksum mic if(ab=="amp" & spp=="S" & (type=="mono" | type=="comp")), by(type)
ranksum mic if(ab=="amp" & spp=="S" & (type=="coop" | type=="comp")), by(type)
ranksum mic if(ab=="amp" & spp=="M" & (type=="mono" | type=="coop")), by(type)
ranksum mic if(ab=="amp" & spp=="M" & (type=="mono" | type=="comp")), by(type)
ranksum mic if(ab=="amp" & spp=="M" & (type=="coop" | type=="comp")), by(type)
*Tet
ranksum mic if(ab=="tet" & spp=="E" & (type=="mono" | type=="coop")), by(type)
ranksum mic if(ab=="tet" & spp=="E" & (type=="mono" | type=="comp")), by(type)
ranksum mic if(ab=="tet" & spp=="E" & (type=="coop" | type=="comp")), by(type)
ranksum mic if(ab=="tet" & spp=="S" & (type=="mono" | type=="coop")), by(type)
ranksum mic if(ab=="tet" & spp=="S" & (type=="mono" | type=="comp")), by(type)
ranksum mic if(ab=="tet" & spp=="S" & (type=="coop" | type=="comp")), by(type)
ranksum mic if(ab=="tet" & spp=="M" & (type=="mono" | type=="coop")), by(type)
ranksum mic if(ab=="tet" & spp=="M" & (type=="mono" | type=="comp")), by(type)
ranksum mic if(ab=="tet" & spp=="M" & (type=="coop" | type=="comp")), by(type)
