*variable names are: isolateid, ab(Rif/Amp), ab_num(1/2), conc_ab (some # or 0), ab_free(abfree/resistant), res_num (0/1)
*commtype(Eanc/Emono/Ecoop/Sanc/Smono/Scoop/Coopanc) commtype_num(1/2/3/4/5/6/7), evol_condn(mono/coop/anc), evol_condn_num(1/2/3)
*spp(E/S/Coop), spp_num(1/2/3), 
*


*spp(E/S), spp_num(1/2), comm_type (mono/coop/anc), comm_type_num(1/2/3),  ///
*spptype(Emono/Ecoop/Smono/Scoop), spptype_num(1/2/3/4), *rep(1-6ish), mic(some#), isolate_id,  ///
*mono_gr(#), mono_yield(#), coop_gr(#), coop_yield(#)

*Note that Eanc/Sanc do not have coculture GRs, and Coopanc does not have monoculture GR: because stata coding is weird

*Colour schema for reps 1-6, respectively:
*Emono: blue bluishgray cyan eltblue midblue teal
*Smono: cranberry pink*0.5 maroon red magenta erose 
*Coop: lime*0.7 dkgreen olive_teal midgreen mint eltgreen
*Anc: gs2 gs8 gs4 gs10 gs6 gs12

*stats
ranksum mono_gr if(ab=="Rif" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum mono_gr if(ab=="Rif" & (spptype_num==3 | spptype_num==4)), by(spptype)
ranksum mono_gr if(ab=="Amp" & (spptype_num==1 | spptype_num==2)), by(spptype)
ranksum mono_gr if(ab=="Amp" & (spptype_num==3 | spptype_num==4)), by(spptype)

