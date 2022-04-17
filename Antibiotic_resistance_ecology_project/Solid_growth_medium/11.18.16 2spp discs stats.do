*How best to do this...
ranksum area if(spp=="E" | spp=="S"), by(spp)
ranksum area if(spp=="E" | spp=="M"), by(spp)
ranksum area if(spp=="S" | spp=="M"), by(spp)
*one by two spp
ranksum area if(spp=="E" | spp=="ES"), by(spp)
ranksum area if(spp=="S" | spp=="ES"), by(spp)
ranksum area if(spp=="E" | spp=="EM"), by(spp)
ranksum area if(spp=="M" | spp=="EM"), by(spp)
ranksum area if(spp=="S" | spp=="SM"), by(spp)
ranksum area if(spp=="M" | spp=="SM"), by(spp)
*two by three spp
ranksum area if(spp=="ES" | spp=="coop"), by(spp)
ranksum area if(spp=="EM" | spp=="coop"), by(spp)
ranksum area if(spp=="SM" | spp=="coop"), by(spp)

