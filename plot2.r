## plot2.R
## Author: Scott Zwick - 1/22/2018
## Descriptions: Explatory Data Analysis - Course Project #1
##
setwd("~/R/Coursera/4-Exploratory_Data_Analysis/ExData_Plotting1")
## Read/Setup data file
     elec_pow <- read.table("household_power_consumption.txt", sep=";",
                            header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
     ep1 <- subset(elec_pow, Date == "1/2/2007")
     ep2 <- subset(elec_pow, Date == "2/2/2007")
     ep_2days <- rbind(ep1, ep2)
##Convert format of date & time columns
     ep_2days$Date <- as.Date(ep_2days$Date , "%d/%m/%y")
     ## plot line graph
##png(filename = "plot1.png", width = 480, height = 480)
with(ep_2days, plot(Global_active_power, time))
##dev.off()