*Have amp and tet saved in different files, so run this code for both
*MIC1: classic MIC: 3x lag time of Ab-free control
ranksum mic1 if(spp=="E" | spp=="S"), by(spp)
ranksum mic1 if(spp=="E" | spp=="M"), by(spp)
ranksum mic1 if(spp=="E" | spp=="Co"), by(spp)
ranksum mic1 if(spp=="E" | spp=="Cm"), by(spp)
ranksum mic1 if(spp=="S" | spp=="M"), by(spp)
ranksum mic1 if(spp=="S" | spp=="Co"), by(spp)
ranksum mic1 if(spp=="S" | spp=="Cm"), by(spp)
ranksum mic1 if(spp=="M" | spp=="Co"), by(spp)
ranksum mic1 if(spp=="M" | spp=="Cm"), by(spp)
ranksum mic1 if(spp=="Co" | spp=="Cm"), by(spp)

*MIC2: new MIC: 3x lag time of Ab-free control OR 72h cutoff
ranksum mic2 if(spp=="E" | spp=="S"), by(spp)
ranksum mic2 if(spp=="E" | spp=="M"), by(spp)
ranksum mic2 if(spp=="E" | spp=="Co"), by(spp)
ranksum mic2 if(spp=="E" | spp=="Cm"), by(spp)
ranksum mic2 if(spp=="S" | spp=="M"), by(spp)
ranksum mic2 if(spp=="S" | spp=="Co"), by(spp)
ranksum mic2 if(spp=="S" | spp=="Cm"), by(spp)
ranksum mic2 if(spp=="M" | spp=="Co"), by(spp)
ranksum mic2 if(spp=="M" | spp=="Cm"), by(spp)
ranksum mic2 if(spp=="Co" | spp=="Cm"), by(spp)
