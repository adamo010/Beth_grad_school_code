*Statistics for jeff's data
*Fig 7a: od600: fermenters (1) vs. Pa14 alone (2)
ranksum rel_od600 if(conc_amp=="5" & type_num==1 | type_num==2), by(type)
ranksum rel_od600 if(conc_amp=="10" & type_num==1 | type_num==2), by(type)
ranksum rel_od600 if(conc_amp=="25" & type_num==1 | type_num==2), by(type)

*Figure 7b: cfu: Pa14 alone (2) vs. co-culture (3)
ranksum rel_cfu if(conc_amp=="5" & type_num==2 | type_num==3), by(type)
ranksum rel_cfu if(conc_amp=="10" & type_num==2 | type_num==3), by(type)
ranksum rel_cfu if(conc_amp=="25" & type_num==2 | type_num==3), by(type)

*try t-tests for shiggles
*Statistics for jeff's data
*Fig 7a: od600: fermenters (1) vs. Pa14 alone (2)
ttest rel_od600 if(conc_amp=="5" & type_num==1 | type_num==2), by(type)
ttest rel_od600 if(conc_amp=="10" & type_num==1 | type_num==2), by(type)
ttest rel_od600 if(conc_amp=="25" & type_num==1 | type_num==2), by(type)

*Figure 7b: cfu: Pa14 alone (2) vs. co-culture (3)
ttest rel_cfu if(conc_amp=="5" & type_num==2 | type_num==3), by(type)
ttest rel_cfu if(conc_amp=="10" & type_num==2 | type_num==3), by(type)
ttest rel_cfu if(conc_amp=="25" & type_num==2 | type_num==3), by(type)

*Kind of gross- why does anyone use t-tests?
*do I have to multiple-correct these?
