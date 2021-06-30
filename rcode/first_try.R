# API code is necessary for this
# https://pakillo.github.io/R-GIS-tutorial/

library(dismo)
#install.packages("dismo")
mymap <- gmap("France")  # choose whatever country
plot(mymap)


library(RgoogleMaps)
newmap <- GetMap(center = c(49.49, 8.46), zoom = 10, 
                 destfile = "maps/zurich.png", 
                 maptype = "satellite")


##

library(tmap)
data(World)
png("pics/qtm_world.PNG")
qtm(World)
dev.off()



##

c(8.4539 , 49.4805  , 8.4774 , 49.4943 )


load("data/osm_mannheim.Rdata")

pdf("pics/Buildings_mannheim.pdf")
qtm(dat_M,fill=c("purple"),borders="black")
dev.off()

##

gc <- geocode_OSM("Berlin")
bbox <- get_bbox (c(13.22886  , 52.35704   , 13.54886 , 52.67704 ))
dat_osm <- extract_osm_objects (key = "higway", bbox = bbox)


##

library(osmplotr)
library(ggmap)
library(osmdata)


bbox <- getbb("Berlin")
dat <- extract_osm_objects(key = 'highway',
                              value = "primary",
                              bbox = bbox)

save(dat,file="data/primary_highway_berlin.RData")


dat_s <- extract_osm_objects(key = 'highway',
                           value = "secondary",
                           bbox = bbox)

save(dat_s,file="data/secondary_highway_berlin.RData")


###

bbox <- getbb("New York")
dat <- extract_osm_objects(key = 'highway',
                           value = "primary",
                           bbox = bbox)

save(dat,file="data/ny_highway_primary.RData")


sec <- extract_osm_objects(key = 'highway',
                           value = "secondary",
                           bbox = bbox)

save(dat,file="data/ny_highway_primary.RData")
save(sec,file="data/ny_highway_secondary.RData")

map <- osm_basemap(bbox = bbox, bg = "black")
map <- add_osm_objects(map, dat, col = "#00008B")
map <- add_osm_objects(map, sec, col = "purple")

png("pics/ny_roadmap.png")
print_osm_map(map)
dev.off()

vignette("osmplotr")


##

FRA4 <- raster::getData('GADM', country='FRA', 
                        level=4)


DT::datatable(FRA4@data)
