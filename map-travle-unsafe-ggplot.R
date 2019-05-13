# make the map with ggplot

library(maptools)
library(ggplot2)

# get the world map data
data(wrld_simpl)
# make a plot of the entire world
plot(wrld_simpl)

wrld_simpl$NAME
sw <- wrld_simpl[wrld_simpl$NAME=="Viet Nam",]
plot(sw)


wrld_simpl@data$id <- wrld_simpl@data$NAME
wrld <- fortify(wrld_simpl$data, region="NAME")
wrld <- subset(wrld, NAME != "Antarctica") # we don't rly need Antarctica


ggplot() + 
    geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25)

