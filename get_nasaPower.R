# Download nasapower data 
# and format data as ECCC historical .csv files
# Nasapower package required
# install.packages("nasapower")
# From:
# https://github.com/ropensci/nasapower
# 
# Parameter Codes:
# T2M_MAX                MERRA-2 Temperature at 2 Meters Maximum (C)
# T2M_MIN                MERRA-2 Temperature at 2 Meters Minimum (C)
# ALLSKY_SFC_PAR_TOT     CERES SYN1deg All Sky Surface PAR Total (W/m^2)
# PRECTOTCORR            MERRA-2 Precipitation Corrected (mm)
# RH2M                   MERRA-2 Relative Humidity at 2 Meters (%)
# WS10M                  MERRA-2 Wind Speed at 10 Meters (m/s)

library("nasapower")
setwd("C:/Users/PolsinelliM/Documents/Correlation Files")

#list of long,lat vectors for each location
locations <- list(c(46.29,-63.12),c(46.41,-63.35)) #c(longitude, latitude)
station_names <- list("Charlottetown A", "New Glasgow") #in same order as above for file naming
parameters = c("T2M_MIN","T2M_MAX","PRECTOTCORR","RH2M","WS10M","ALLSKY_SFC_PAR_TOT")
date_range <- c("1990-03-01","2020-10-31") #date start and end - "yyyy-mm-dd"
occurance <- "daily" #daily,hourly

i <- 1
while (i <= length(locations)){
climate_data <- get_power(community="ag", lonlat = locations[[i]], pars=parameters,dates = date_range, temporal_api = occurance)

write.csv(climate_data, file=paste(station_names[i],"NasaPower.csv",sep="_"))
i <- i + 1
}

