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

c(8.4539 , 49.4805  , 8.4774 , 49.4943 )