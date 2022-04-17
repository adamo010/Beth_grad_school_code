*Run some stats first: see if old vs. new is different
*Note that these stats are not for paper; they are to see if comp and monoculture results from comp med testing match previous data
*Amp
ranksum area if(ab=="amp" & spp=="E"), by(oldnew)
ranksum area if(ab=="amp" & spp=="S"), by(oldnew)
ranksum area if(ab=="amp" & spp=="M"), by(oldnew)
ranksum area if(ab=="amp" & spp=="comp"), by(oldnew)
*Tet
ranksum area if(ab=="tet" & spp=="E"), by(oldnew)
ranksum area if(ab=="tet" & spp=="S"), by(oldnew)
ranksum area if(ab=="tet" & spp=="M"), by(oldnew)
ranksum area if(ab=="tet" & spp=="comp"), by(oldnew)

