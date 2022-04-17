*MIC metrics to use: MIC1-3: testing sig diffs.

*MIC1: classic MIC
ranksum mic1 if(spp=="mono" | spp=="coop"), by(spp)
ranksum mic1 if(spp=="mono" | spp=="comp"), by(spp)
ranksum mic1 if(spp=="coop" | spp=="comp"), by(spp)

*MIC2: 72h cutoff
ranksum mic2 if(spp=="mono" | spp=="coop"), by(spp)
ranksum mic2 if(spp=="mono" | spp=="comp"), by(spp)
ranksum mic2 if(spp=="coop" | spp=="comp"), by(spp)

*MIC3: absolute/relative metrics combined
ranksum mic3 if(spp=="mono" | spp=="coop"), by(spp)
ranksum mic3 if(spp=="mono" | spp=="comp"), by(spp)
ranksum mic3 if(spp=="coop" | spp=="comp"), by(spp)
