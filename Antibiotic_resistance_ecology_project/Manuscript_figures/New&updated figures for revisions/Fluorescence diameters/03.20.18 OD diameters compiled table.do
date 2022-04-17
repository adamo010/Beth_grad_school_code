generate ab_spp = spp_num
replace ab_spp = 6 if ab=="tet" & spp=="E"
replace ab_spp = 7 if ab=="tet" & spp=="S"
replace ab_spp = 8 if ab=="tet" & spp=="M"
replace ab_spp = 9 if ab=="tet" & spp=="coop"
replace ab_spp = 10 if ab=="tet" & spp=="comp"

*this will do all data together: grouped by ab_spp
tabstat diameter, statistics( count mean sd median iqr ) by(ab_spp) columns(statistics)

*this will make 2 tables, one for each ab
by ab, sort : tabstat diameter, statistics( count mean sd median iqr ) by(spp) columns(statistics)

generate antibiotic = ab
replace antibiotic = "Ampicillin" if ab=="amp"
replace antibiotic = "Tetracycline" if ab=="tet"

generate species = spp
replace species = "E. coli" if spp=="E"
replace species = "S. enterica" if spp=="S"
replace species = "M. extorquens" if spp=="M"
replace species = "Cooperative community" if spp=="coop"
replace species = "Competitive community" if spp=="comp"

by antibiotic, sort : tabstat diameter, statistics( count mean sd median iqr ) by(species) columns(statistics)

*Forget the fancy shit, I just need the numbers. Can do the edits in excel

by ab, sort : tabstat av_diam, statistics( mean sd median iqr ) by(spp_num) columns(statistics)


*Variables: ab (amp/tet), ab_num (1/2), spp (E/S/M), spp_num (1/2/3), rep (1-10), type (mono/coop/comp), type_num (1/2/3),
*D1(#), D2(#), D3(#), av_diam(#)

**Fluorescence diameters
by type, sort : tabstat av_diam if ab=="amp", statistics( mean sd median iqr ) by(spp) columns(statistics)

by type, sort : tabstat av_diam if ab=="tet", statistics( mean sd median iqr ) by(spp) columns(statistics)









