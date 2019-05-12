# make the map with ggplot

library(maptools)
library(ggplot2)

# get the world map data
data(wrld_simpl)
# make a plot of the entire world
plot(wrld_simpl)


sw <- wrld_simpl[wrld_simpl$NAME=="France",]
plot(sw)


wrld_simpl@data$id <- wrld_simpl@data$NAME
wrld <- fortify(wrld_simpl, region="id")
wrld <- subset(wrld, id != "Antarctica") # we don't rly need Antarctica


ggplot() + 
    geom_map(data=sw, map=sw, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25)

