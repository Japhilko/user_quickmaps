# Getting things done
# Jan-Philipp Kolb
# 



# purl the presentation ---------------------------------------------------

purl("quick_high_quality_maps.Rmd")


bars <- extract_osm_objects(key = 'amenity',
                            #value = "bar",
                            bbox = bbox)


head(bars)
save(bars,file="C:/Arbeit/data/amenity_berlin.RData")


bars <- extract_osm_objects(value = "bar",
                            bbox = bbox)



# https://rdrr.io/cran/osmplotr/man/osm_structures.html

# Default structures:
osm_structures ()
# user-defined structures:
structures <- c ("highway", "park", "amenitiy", "tree")
structs <- osm_structures (structures = structures, 
                           col_scheme = "light")
# make_osm_map returns potentially modified list of data
## Not run: 
dat <- make_osm_map (osm_data = london, structures = structs)
# map contains updated $osm_data and actual map in $map
print_osm_map (dat$map)



dat_T <- extract_osm_objects (key = "natural", value = "tree", bbox = bbox)

save(dat_T,file="data/trees_berlin.RData")

leaflet()

##################
# https://stackoverflow.com/questions/61519042/plotting-sf-type-object-in-leaflet-r


library(leaflet)
library(eurostat)
library(dplyr)
library(ggplot2)

options(readr.default_locale=readr::locale(tz="Europe/Berlin"))
df60 <- get_eurostat_geospatial(resolution = 60)


CE.sf <- df60 %>%   
  filter(LEVL_CODE == 2 & 
           CNTR_CODE %in% c("NL")) %>% 
  select(NUTS_ID) 

plot(CE.sf,col=1:12)


CE.sf <- df60 %>%   
  filter(LEVL_CODE == 3 & 
           CNTR_CODE %in% c("DE")) %>% 
  select(NUTS_ID) 


pdf("pics/germany_nuts3.pdf")
plot(CE.sf,main="",col="royalblue")
dev.off()


CE.sf <- df60 %>%   
  filter(LEVL_CODE == 3 & 
           CNTR_CODE %in% c("FR")) %>% 
  select(NUTS_ID) 

plot(CE.sf,main="",col="royalblue")

save(df60,file="data/eurostat_df60.RData")


######

# https://cran.r-project.org/web/packages/osmplotr/vignettes/basic-maps.html

dat1 <- osmplotr::extract_osm_objects (key = "highway", value = "!primary",
                                       bbox = bbox)


library(osmplotr)

dat2 <- osmdata::opq (bbox = bbox) %>%
  add_feature (key = "highway") %>%
  add_feature (key = "highway", value = "!primary") %>%
  osmdata_sf ()
dat2 <- dat2$osm_lines


# that works
dat_NT <- extract_osm_objects (bbox = bbox, key = "natural", value = "!tree")
save(dat_NT,file="data/berlin_natural.RData")


pts_NT <- extract_osm_objects (bbox = bbox, 
                               key = "natural", 
                               value = "!tree",
                               return_type = "points")


plot(pts_NT)
save(pts_NT,file="data/pts_NT")



# The sf package ----------------------------------------------------------

library(sf)

nc <- st_read(system.file("shape/nc.shp", package="sf"))

par(mar = c(0,0,1,0))
plot(nc[1], reset = FALSE) # reset = FALSE: we want to add to a plot with a legend
plot(nc[1,1], col = 'grey', add = TRUE)


# The Eurostat data -------------------------------------------------------


library(DT)

DT::datatable(df60)



# osmdata -----------------------------------------------------------------


# https://docs.ropensci.org/osmplotr/articles/basic-maps.html

library(dplyr)
library(osmplotr)
library(osmdata)

bbox <- osmdata::getbb("Zürich")

dat1 <- osmplotr::extract_osm_objects (key = "highway", value = "!primary",
                                       bbox = bbox)
dat2 <- osmdata::opq (bbox = bbox) %>%
  add_feature (key = "highway") %>%
  add_feature (key = "highway", value = "!primary") %>%
  osmdata_sf ()
dat2 <- dat2$osm_lines



# To Do

# the NUTS codes
# the sf package


# https://www.r-bloggers.com/2016/12/rwind-r-package-released/



# World simple ------------------------------------------------------------

library(maptools)
data("wrld_simpl")

DT::datatable(wrld_simpl@data)



# Geocoding ---------------------------------------------------------------

info <- tmaptools::geocode_OSM("Bahnhof Zürich",details=T)


# 30 day map challenge ----------------------------------------------------


# https://urbandatapalette.com/post/2020-12-summary-30-map-challenge/

# http://web.archive.org/web/20080328104539/http://library.thinkquest.org:80/C006628/download.html

# https://www.gispo.fi/en/material-work/30daymapchallenge-2020-bigger-and-better/