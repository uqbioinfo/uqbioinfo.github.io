library(raster)
library(maptools)
library(parallel)

setwd("C:/GIS_Guide")

bio<-getData("worldclim",var="bio",res=2.5) # download bioclim data at the desired resolution

rains<-bio[[12]] # precipitation

spplot(rains,col=rainbow(100)) # plot

# create list of the country codes from some African countries

Africa<-list("AGO","BDI","BEN","BFA","BWA","CAF","CIV","CMR","COD","COG","CPV","DJI","DZA","EGY",
             "ERI","ETH","GAB","GHA","GIN","GMB","GNB","GNQ","KEN","LBR","LBY","LSO","MAR","MDG",
             "MLI","MOZ","MRT","MUS","MWI","NAM","NER","NGA","RWA","SEN","SLE","SOM",
             "SDN","SWZ","TZA","TGO","TUN","ZMB","ZWE","TCD","ZAF","ESH","UGA","SSD")


# create a function

myfunction<-function(x){
  cc<-getData("GADM",country=x,level=0) # download the country outline
  raindat<-extract(rains,cc,fun=mean,na.rm=TRUE,sp=TRUE) # extract and calculate mean precipitation value for the country
}

Mycluster<-makeCluster(3) # make a cluster of desired size (use detectCores() to find out how many you have)
clusterEvalQ(Mycluster,library(raster)) # library required packages across all cores
clusterExport(Mycluster,list("rains","Africa")) # export required objects to the cores

Result<-parLapply(Mycluster,Africa,fun=myfunction) # apply the function to the list using the cluster

stopCluster(Mycluster) # stop the cluster after finishing

All<-do.call("bind",Result) # combine the output into a single polygon layer
  
spplot(All["bio12"]) # plot this
