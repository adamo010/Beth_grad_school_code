*variables: whatever
*Do Abs together why not, should be fine
*Amp
ranksum area if(spp=="E" | spp=="S"), by(spp)
ranksum area if(spp=="E" | spp=="ES"), by(spp)
ranksum area if(spp=="E" | spp=="coop"), by(spp)
ranksum area if(spp=="E" | spp=="comp"), by(spp)
ranksum area if(spp=="S" | spp=="ES"), by(spp)
ranksum area if(spp=="S" | spp=="coop"), by(spp)
ranksum area if(spp=="S" | spp=="comp"), by(spp)
ranksum area if(spp=="ES" | spp=="coop"), by(spp)
ranksum area if(spp=="ES" | spp=="comp"), by(spp)
ranksum area if(spp=="coop" | spp=="comp"), by(spp)

