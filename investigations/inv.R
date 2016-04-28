# W205 Final Project
# Andrew Burrage

library(ggplot2)
library(stargazer)
library(reshape2)
setwd("~/Desktop/BerkeleyMIDS/205/Final_Project/crime_project/investigations")

#READ IN CRIME AND STREETLIGHT DATA
chi<-read.csv('chicago_inv_data.csv', header=TRUE)
sf<-read.csv('sf_inv_data.csv', header=TRUE)

#SCATTERPLOT REPRESENTING NUMBER OF CRIMES AND NUMBER OF STREETLIGHT 311 REQUESTS
#FOR CHICAGO AND SAN FRANCISCO
scatter_chi <- ggplot(chi, aes(C_P1_CRIMES, C_311_STREETLIGHTS))
scatter_chi + geom_point() + geom_smooth(method="lm")

#WHAT DOES A REGRESSION TELL US ABOUT THE RELATIONSHIP BETWEEN STREETLIGHT OUTAGES AND CRIME
chi_mod1 <- lm(C_P1_CRIMES~C_311_STREETLIGHTS,data=chi)
summary(chi_mod1)

scatter_sf <- ggplot(sf, aes(SF_P1_CRIMES, SF_311_STREETLIGHTS))
scatter_sf + geom_point() + geom_smooth(method="lm")

sf_mod1 <- lm(SF_P1_CRIMES~SF_311_STREETLIGHTS,data=sf)
summary(sf_mod1)

#READ IN COMPLETED STREETLIGHT DATA
chi_lights<-read.csv('chicago_comp_lights.csv', header=TRUE)
#sf_lights<-read.csv('sf_comp_lights.csv', header=TRUE)
sf_lights<-read.csv('sf_comp_lights.csv', header=TRUE, stringsAsFactors=FALSE)

#CONVERT CHARACTER DATES TO TYPE DATE AND CALCULATE THE NUMBER OF DAYS IT TOOK TO FULFILL THE REQUEST
chi_lights$Completion_Date <- as.Date(chi_lights$Completion_Date, "%m/%d/%Y")
chi_lights$Creation_Date <- as.Date(chi_lights$Creation_Date, "%m/%d/%Y")
chi_lights$comp_time <- chi_lights$Completion_Date - chi_lights$Creation_Date
chi_lights$comp_time <- as.numeric(chi_lights$comp_time)

#CONVERT CHARACTER DATES TO TYPE DATE AND CALCULATE THE NUMBER OF DAYS IT TOOK TO FULFILL THE REQUEST
sf_lights$Closed <- as.Date(sf_lights$Closed, "%m/%d/%Y")
sf_lights$Opened <- as.Date(sf_lights$Opened, "%m/%d/%Y")
sf_lights$comp_time <- sf_lights$Closed - sf_lights$Opened
sf_lights$comp_time <- as.numeric(sf_lights$comp_time)

#SUMMARY STATS FOR NUMBER OF COMPLETION TIME IN DAYS FOR CHICAGO AND SF
summary(chi_lights$comp_time)
summary(sf_lights$comp_time)

chi$MEAN_COMP_TIME[1]

#CALCULATE MEAN DAYS FOR COMPLETION OF STREETLIGHT REQUEST IN CHICAGO BY DISTRICT
comp<-chi_lights[ chi_lights$Police_District==1,]
chi$MEAN_COMP_TIME[1] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==2,]
chi$MEAN_COMP_TIME[2] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==3,]
chi$MEAN_COMP_TIME[3] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==4,]
chi$MEAN_COMP_TIME[4] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==5,]
chi$MEAN_COMP_TIME[5] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==6,]
chi$MEAN_COMP_TIME[6] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==7,]
chi$MEAN_COMP_TIME[7] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==8,]
chi$MEAN_COMP_TIME[8] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==9,]
chi$MEAN_COMP_TIME[9] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==10,]
chi$MEAN_COMP_TIME[10] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==11,]
chi$MEAN_COMP_TIME[11] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==12,]
chi$MEAN_COMP_TIME[12] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==13,]
chi$MEAN_COMP_TIME[13] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==14,]
chi$MEAN_COMP_TIME[14] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==15,]
chi$MEAN_COMP_TIME[15] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==16,]
chi$MEAN_COMP_TIME[16] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==17,]
chi$MEAN_COMP_TIME[17] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==18,]
chi$MEAN_COMP_TIME[18] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==19,]
chi$MEAN_COMP_TIME[19] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==20,]
chi$MEAN_COMP_TIME[20] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==22,]
chi$MEAN_COMP_TIME[21] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==23,]
chi$MEAN_COMP_TIME[22] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==24,]
chi$MEAN_COMP_TIME[23] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==25,]
chi$MEAN_COMP_TIME[24] <- mean(comp$comp_time,na.rm=TRUE)
comp<-chi_lights[ chi_lights$Police_District==31,]
chi$MEAN_COMP_TIME[25] <- mean(comp$comp_time,na.rm=TRUE)

#CHICAGO POPULATION BY POLICE DISTRICT - 2010 POPULATION
chi$POP[1] <- 57055
chi$POP[2] <- 37768
chi$POP[3] <- 75235
chi$POP[4] <- 123575
chi$POP[5] <- 74396
chi$POP[6] <- 90841
chi$POP[7] <- 71071
chi$POP[8] <- 247373
chi$POP[9] <- 155681
chi$POP[10] <- 118093
chi$POP[11] <- 70474
chi$POP[12] <- 69220
chi$POP[13] <- 58649
chi$POP[14] <- 117738
chi$POP[15] <- 59458
chi$POP[16] <- 199482
chi$POP[17] <- 144096
chi$POP[18] <- 117041
chi$POP[19] <- 112622
chi$POP[20] <- 91279
chi$POP[21] <- 101941
chi$POP[22] <- 88164
chi$POP[23] <- 141038
chi$POP[24] <- 200391
chi$POP[25] <- 72917

#CHICAGO CRIME RATE PER 100,000 PEOPLE *** REMEBER WE AGGREGATED CRIME FOR PAST 6 YEARS, THESE RATES WILL BE EXTREMELY HIGH
chi$C_AVG_P1_CRIME <- chi$C_P1_CRIMES / 5
chi$C_AVG_P1_CRIME_RATE <- (chi$C_AVG_P1_CRIME / chi$POP) * 10000

#RECODE NEIGHBORHOODS TO MATCH SF POLICE DISTRICTS
sf_lights$Neighborhood[sf_lights$Neighborhood=="Bayview"|sf_lights$Neighborhood=="Candlestick Point SRA"|sf_lights$Neighborhood=="Central Waterfront"|sf_lights$Neighborhood=="Dogpatch"|sf_lights$Neighborhood=="Hunters Point"|sf_lights$Neighborhood=="India Basin"|sf_lights$Neighborhood=="Little Hollywood"|sf_lights$Neighborhood=="Portola"|sf_lights$Neighborhood=="Potrero Hill"|sf_lights$Neighborhood=="Silver Terrace"|sf_lights$Neighborhood=="University Mound"] <- "BAYVIEW"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Aquatic Park / Ft. Mason"|sf_lights$Neighborhood=="Bret Harte"|sf_lights$Neighborhood=="Chinatown"|sf_lights$Neighborhood=="Downtown / Union Square"|sf_lights$Neighborhood=="Fairmount"|sf_lights$Neighborhood=="Financial District"|sf_lights$Neighborhood=="Lower Nob Hill"|sf_lights$Neighborhood=="Mint Hill"|sf_lights$Neighborhood=="Nob Hill"|sf_lights$Neighborhood=="North Beach"|sf_lights$Neighborhood=="Northern Waterfront"|sf_lights$Neighborhood=="Polk Gulch"|sf_lights$Neighborhood=="Rincon Hill"|sf_lights$Neighborhood=="Russian Hill"|sf_lights$Neighborhood=="Telegraph Hill"] <-"CENTRAL"  
sf_lights$Neighborhood[sf_lights$Neighborhood=="Bernal Heights"|sf_lights$Neighborhood=="Crocker Amazon"|sf_lights$Neighborhood=="Diamond Heights"|sf_lights$Neighborhood=="Excelsior"|sf_lights$Neighborhood=="Glen Park"|sf_lights$Neighborhood=="Holly Park"|sf_lights$Neighborhood=="Ingleside"|sf_lights$Neighborhood=="McLaren Park"|sf_lights$Neighborhood=="Miraloma Park"|sf_lights$Neighborhood=="Mission Terrace"|sf_lights$Neighborhood=="Outer Mission"|sf_lights$Neighborhood=="Peralta Heights"|sf_lights$Neighborhood=="Sherwood Forest"|sf_lights$Neighborhood=="Sunnydale"|sf_lights$Neighborhood=="Sunnyside"|sf_lights$Neighborhood=="Visitacion Valley"|sf_lights$Neighborhood=="Westwood Highlands"|sf_lights$Neighborhood=="Westwood Park"] <- "INGLESIDE"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Dolores Heights"|sf_lights$Neighborhood=="Eureka Valley"|sf_lights$Neighborhood=="Mission"|sf_lights$Neighborhood=="Mission Dolores"|sf_lights$Neighborhood=="Noe Valley"|sf_lights$Neighborhood=="Showplace Square"] <- "MISSION"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Alamo Square"|sf_lights$Neighborhood=="Cathedral Hill"|sf_lights$Neighborhood=="Civic Center"|sf_lights$Neighborhood=="Cow Hollow"|sf_lights$Neighborhood=="Downtown/Civic Center"|sf_lights$Neighborhood=="Hayes Valley"|sf_lights$Neighborhood=="Japantown"|sf_lights$Neighborhood=="Lower Haight"|sf_lights$Neighborhood=="Lower Pacific Heights"|sf_lights$Neighborhood=="Marina"|sf_lights$Neighborhood=="Pacific Heights"|sf_lights$Neighborhood=="Western Addition"] <- "NORTHERN"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Anza Vista"|sf_lights$Neighborhood=="Ashbury Heights"|sf_lights$Neighborhood=="Buena Vista"|sf_lights$Neighborhood=="Castro"|sf_lights$Neighborhood=="Castro/Upper Market"|sf_lights$Neighborhood=="Clarendon Heights"|sf_lights$Neighborhood=="Cole Valley"|sf_lights$Neighborhood=="Corona Heights"|sf_lights$Neighborhood=="Duboce Triangle"|sf_lights$Neighborhood=="Forest Knolls"|sf_lights$Neighborhood=="Haight Ashbury"|sf_lights$Neighborhood=="Laguna Honda"|sf_lights$Neighborhood=="Midtown Terrace"|sf_lights$Neighborhood=="Panhandle"|sf_lights$Neighborhood=="Parnassus Heights"|sf_lights$Neighborhood=="Twin Peaks"|sf_lights$Neighborhood=="Upper Market"|sf_lights$Neighborhood=="West of Twin Peaks"] <- "PARK"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Golden Gate Park"|sf_lights$Neighborhood=="Inner Richmond"|sf_lights$Neighborhood=="Lake Street"|sf_lights$Neighborhood=="Laurel Heights / Jordan Park"|sf_lights$Neighborhood=="Lincoln Park / Ft. Miley"|sf_lights$Neighborhood=="Lone Mountain"|sf_lights$Neighborhood=="Outer Richmond"|sf_lights$Neighborhood=="Presidio Heights"|sf_lights$Neighborhood=="Presidio Terrace"|sf_lights$Neighborhood=="Seacliff"|sf_lights$Neighborhood=="Sutro Heights"] <- "RICHMOND"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Mission Bay"|sf_lights$Neighborhood=="South Beach"|sf_lights$Neighborhood=="South of Market"|sf_lights$Neighborhood=="Treasure Island"|sf_lights$Neighborhood=="Treasure Island/YBI"|sf_lights$Neighborhood=="Yerba Buena Island"] <- "SOUTHERN"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Balboa Terrace"|sf_lights$Neighborhood=="Cayuga"|sf_lights$Neighborhood=="Forest Hill"|sf_lights$Neighborhood=="Golden Gate Heights"|sf_lights$Neighborhood=="Ingleside Terraces"|sf_lights$Neighborhood=="Inner Sunset"|sf_lights$Neighborhood=="Lake Shore"|sf_lights$Neighborhood=="Lakeshore"|sf_lights$Neighborhood=="Merced Heights"|sf_lights$Neighborhood=="Merced Manor"|sf_lights$Neighborhood=="Monterey Heights"|sf_lights$Neighborhood=="Mt. Davidson Manor"|sf_lights$Neighborhood=="Ocean View"|sf_lights$Neighborhood=="Oceanview"|sf_lights$Neighborhood=="Outer Sunset"|sf_lights$Neighborhood=="Parkmerced"|sf_lights$Neighborhood=="Parkside"|sf_lights$Neighborhood=="St. Francis Wood"|sf_lights$Neighborhood=="Stonestown"|sf_lights$Neighborhood=="West Portal"] <- "TARAVAL"
sf_lights$Neighborhood[sf_lights$Neighborhood=="Tenderloin"] <- "TENDERLOIN"

#REMOVE ENTRIES WITH NEGATIVE COMPLETION TIME
sf_lights$Neighborhood[sf_lights$comp_time<0]<-"NA"

#SUMMARY STATS FOR COMPLETION TIME BY POLICE DISTRICT
sf$MEAN_COMP_TIME[1] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="BAYVIEW"])
sf$MEAN_COMP_TIME[2] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="CENTRAL"])
sf$MEAN_COMP_TIME[3] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="INGLESIDE"])
sf$MEAN_COMP_TIME[4] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="MISSION"])
sf$MEAN_COMP_TIME[5] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="NORTHERN"])
sf$MEAN_COMP_TIME[6] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="PARK"])
sf$MEAN_COMP_TIME[7] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="RICHMOND"])
sf$MEAN_COMP_TIME[8] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="SOUTHERN"])
sf$MEAN_COMP_TIME[9] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="TARAVAL"])
sf$MEAN_COMP_TIME[10] <- mean(sf_lights$comp_time[sf_lights$Neighborhood=="TENDERLOIN"])

#SF POPULATION BY POLICE DISTRICT - 2010 POPULATION
sf$POP[1] <- 60301
sf$POP[2] <- 69276
sf$POP[3] <- 132328
sf$POP[4] <- 83235
sf$POP[5] <- 82348
sf$POP[6] <- 59572
sf$POP[7] <- 93693
sf$POP[8] <- 24157
sf$POP[9] <- 147806
sf$POP[10] <- 21669

#CHICAGO CRIME RATE PER 100,000 PEOPLE *** REMEBER I AGGREGATED CRIME FOR PAST 6 YEARS, THESE RATES WILL BE EXTREMELY HIGH
sf$SF_AVG_P1_CRIME <- sf$SF_P1_CRIMES / 7
sf$CRIME_RATE <- (sf$SF_AVG_P1_CRIME / sf$POP) * 10000

chi_test <- chi
sf_test <- sf
chi[order(chi$C_P1_CRIMES, decreasing=TRUE),]
chi[order(chi$CRIME_RATE, decreasing=TRUE),]
sf_test[order(sf_test$SF_P1_CRIMES, decreasing=TRUE),]

#as.factor(sf$SF_DISTRICT)
#STACKED BAR GRAPH OF TOTAL COUNT FOR CRIME AND STREET LIGHT REQUESTS
chi_crime_light <- chi[,c(1,2,3)]
sf_crime_light <- sf[,c(1,2,3)]

chi_crime_light_plot <- melt(chi_crime_light, id.var="C_DISTRICT")
ggplot(chi_crime_light_plot, aes(x = C_DISTRICT, y = value, fill = variable)) + 
  geom_bar(stat = "identity")

sf_crime_light_plot <- melt(sf_crime_light, id.var="SF_DISTRICT")
ggplot(sf_crime_light_plot, aes(x = SF_DISTRICT, y = value, fill = variable)) + 
  geom_bar(stat = "identity")

#MEAN COMPLETION TIME TO FULFILL STREET LIGHT REQUEST
chi_comp_time <- chi[,c(1,4)]
sf_comp_time <- sf[,c(1,4)]

chi_comp_time <- melt(chi_comp_time, id.var="C_DISTRICT")
ggplot(chi_comp_time, aes(x = C_DISTRICT, y = value, fill = variable)) + 
  geom_bar(stat = "identity")

sf_comp_time <- melt(sf_comp_time, id.var="SF_DISTRICT")
ggplot(sf_comp_time, aes(x = SF_DISTRICT, y = value, fill = variable)) + 
  geom_bar(stat = "identity")

#AVERAGE CRIME PER YEAR AND CRIME RATE PER 10,000 PEOPLE
chi_crimerate <- chi[,c(1,7:8)]
sf_crimerate <- sf[,c(1,7,6)]

chi_crimerate <- melt(chi_crimerate, id.var="C_DISTRICT")
ggplot(chi_crimerate, aes(x = C_DISTRICT, y = value, fill = variable)) + 
  geom_bar(stat = "identity")

sf_crimerate <- melt(sf_crimerate, id.var="SF_DISTRICT")
ggplot(sf_crimerate, aes(x = SF_DISTRICT, y = value, fill = variable)) + 
  geom_bar(stat = "identity")
