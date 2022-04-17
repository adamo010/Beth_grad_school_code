*Have amp and tet saved in different files, so run this code for both
*MIC1: classic MIC: 3x lag time of Ab-free control
ranksum mic1 if(spp=="E" & (type=="mono" | type=="coop")), by(type)
ranksum mic1 if(spp=="E" & (type=="mono" | type=="comp")), by(type)
ranksum mic1 if(spp=="E" & (type=="coop" | type=="comp")), by(type)
ranksum mic1 if(spp=="S" & (type=="mono" | type=="coop")), by(type)
ranksum mic1 if(spp=="S" & (type=="mono" | type=="comp")), by(type)
ranksum mic1 if(spp=="S" & (type=="coop" | type=="comp")), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="coop")), by(type)
ranksum mic1 if(spp=="M" & (type=="mono" | type=="comp")), by(type)
ranksum mic1 if(spp=="M" & (type=="coop" | type=="comp")), by(type)

*MIC2: new MIC: 3x lag time of Ab-free control OR 72h cutoff
ranksum mic2 if(spp=="E" & (type=="mono" | type=="coop")), by(type)
ranksum mic2 if(spp=="E" & (type=="mono" | type=="comp")), by(type)
ranksum mic2 if(spp=="E" & (type=="coop" | type=="comp")), by(type)
ranksum mic2 if(spp=="S" & (type=="mono" | type=="coop")), by(type)
ranksum mic2 if(spp=="S" & (type=="mono" | type=="comp")), by(type)
ranksum mic2 if(spp=="S" & (type=="coop" | type=="comp")), by(type)
ranksum mic2 if(spp=="M" & (type=="mono" | type=="coop")), by(type)
ranksum mic2 if(spp=="M" & (type=="mono" | type=="comp")), by(type)
ranksum mic2 if(spp=="M" & (type=="coop" | type=="comp")), by(type)
