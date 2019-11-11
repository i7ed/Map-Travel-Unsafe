# make the map with ggplot

library(maps)
library(ggplot2)
library(dplyr)
library(stringr)
# source data:
# https://www.cnn.com/2019/04/10/politics/state-department-travel-advisory-kidnapping-risk/index.html
##############

list.str = "Afghanistan, Algeria, Angola, Bangladesh, Burkina Faso, Cameroon, Central African Republic, Colombia, Democratic Republic of the Congo, Ethiopia, Haiti, Iran, Iraq, Kenya, Lebanon, Libya, Malaysia, Mali, Mexico, Niger, Nigeria, Pakistan, Papua New Guinea, Philippines, Russian Federation, Somalia, South Sudan, Sudan, Syria, Trinidad and Tobago, Turkey, Uganda, Ukraine (in Russian-controlled eastern Ukraine), Venezuela, and Yemen"
# clean up data
gsub(",and","",list.str) -> list.str
gsub("\\(.*\\)?","", list.str) -> list.str
list.ctr = data.frame( 
    region = str_trim(strsplit(list.str,',')[[1]])
)
list.ctr$value = 1:nrow(list.ctr)


WorldData <- map_data('world') %>% 
    filter(region != "Antarctica") %>% 
    fortify

ggplot() + 
    geom_map(data = WorldData, map=WorldData,
             aes(x = long, y=lat, group = group,
                 map_id=region),
             fill = 'white', col='blue', size=0.2) + 
    geom_map(data = list.ctr, map=WorldData,
             aes(fill='red', map_id=region),
             colour="#7f7f7f", size=0.5) +
    theme(legend.position = 'none') +
    xlab('longitude') +
    ylab('latitude')
ggsave('unsafe-map-travel-ggplot.png', width=6, height=4, dpi=300)
