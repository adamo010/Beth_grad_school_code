*Give this a crack- hopefully we'll see no differences
*Amp:
kwallis area if (ab=="Amp" & spp=="E"), by(med)
kwallis area if (ab=="Amp" & spp=="S"), by(med)
kwallis area if (ab=="Amp" & spp=="M"), by(med)
kwallis area if (ab=="Amp" & spp=="comp"), by(med)
*Tet:
kwallis area if (ab=="Tet" & spp=="E"), by(med)
kwallis area if (ab=="Tet" & spp=="S"), by(med)
kwallis area if (ab=="Tet" & spp=="M"), by(med)
kwallis area if (ab=="Tet" & spp=="comp"), by(med)

*Follow-up pairwise to see who's different:
*Sal in Amp
ranksum area if (ab=="Amp" & spp=="S" & (med=="mono" | med=="S_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="mono" | med=="comp")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="mono" | med=="comp_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="mono" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="S_succ" | med=="comp")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="S_succ" | med=="comp_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="S_succ" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="comp" | med=="comp_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="comp" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="S" & (med=="comp_succ" | med=="comp_4x_succ")), by(med)
*Mex in Amp
ranksum area if (ab=="Amp" & spp=="M" & (med=="mono" | med=="comp")), by(med)
ranksum area if (ab=="Amp" & spp=="M" & (med=="mono" | med=="comp_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="M" & (med=="mono" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="M" & (med=="comp" | med=="comp_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="M" & (med=="comp" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Amp" & spp=="M" & (med=="comp_succ" | med=="comp_4x_succ")), by(med)
*E in Tet
ranksum area if (ab=="Tet" & spp=="E" & (med=="mono" | med=="comp")), by(med)
ranksum area if (ab=="Tet" & spp=="E" & (med=="mono" | med=="comp_succ")), by(med)
ranksum area if (ab=="Tet" & spp=="E" & (med=="mono" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Tet" & spp=="E" & (med=="comp" | med=="comp_succ")), by(med)
ranksum area if (ab=="Tet" & spp=="E" & (med=="comp" | med=="comp_4x_succ")), by(med)
ranksum area if (ab=="Tet" & spp=="E" & (med=="comp_succ" | med=="comp_4x_succ")), by(med)
