## plot3.R
## Author: Scott Zwick - 1/22/2018
## Descriptions: Explatory Data Analysis - Course Project #1
##
setwd("~/R/Coursera/4-Exploratory_Data_Analysis/ExData_Plotting1")
## Read/Setup data file
     elec_pow <- read.table("household_power_consumption.txt", sep=";",
                       header = TRUE, na.strings = "?",
                       stringsAsFactors = FALSE)
     ep1 <- subset(elec_pow, Date == "1/2/2007")
     ep2 <- subset(elec_pow, Date == "2/2/2007")
     ep_2days <- rbind(ep1, ep2)
## Combine date & time columns and format
     ep_2days$DateTime <- paste(ep_2days$Date, ep_2days$Time, sep = " ")
     ep_2days$DateTime <- strptime(ep_2days$DateTime, format = "%d/%m/%Y %H:%M:%S")
## Subset metering
     
## Plot line graph
##   png(filename = "plot2.png", width = 480, height = 480)
     with(ep_2days, plot(DateTime, Sub_metering_1, type = "l",
                    xlab = "", ylab = "Energy sub metering" ))
     lines(ep_2days$DateTime, ep_2days$Sub_metering_2, type = "l", col = "red")
dev.off()