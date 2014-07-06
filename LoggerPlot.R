setwd("<your file directory here>")

library(ggplot2)
library(ggmap)

log<-read.csv("<your logger data here")

c1<-median(log$Latitude)
c2<-median(log$Longitude)

map<-get_map(location = c(lon =c2, lat =c1 ),
        zoom = 16, scale = "auto",
        maptype ="toner",
        messaging = FALSE, urlonly = FALSE,
        filename = "ggmapTemp", crop = TRUE,
        color = "bw",
        source ="stamen")

gmap<-ggmap(map)

gmap+geom_point(data=log, aes(x=Longitude, y=Latitude, color=Event, shape=Event))+scale_shape(solid = FALSE)+scale_shape_manual(values=c(1,8,5,3,3,20,15,15,8))
