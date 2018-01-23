## plot4.R
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
## Set up file and plot window
     png(filename = "plot4.png", width = 480, height = 480)
     par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(2, 2, 0, 0))
     ## 1st plot
     with(ep_2days, plot(DateTime, Global_active_power, type = "l",
                         xlab = "", ylab = "Global Active Power" ))
## 2nd plot
     with(ep_2days, plot(DateTime, Voltage, type = "l",
                         xlab = "datetime", ylab = "Voltage" ))
## 3rd plot
     with(ep_2days, plot(DateTime, Sub_metering_1, type = "l",
                         xlab = "", ylab = "Energy sub metering" ))
     lines(ep_2days$DateTime, ep_2days$Sub_metering_2, type = "l", col = "red")
     lines(ep_2days$DateTime, ep_2days$Sub_metering_3, type = "l", col = "blue")
     legend("topright", col=c("black", "blue", "red"), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = 1, lwd = 2, bty = "n")
## 4th plot
     with(ep_2days, plot(DateTime, Global_reactive_power, type = "l",
                         xlab = "datetime", ylab = "Global_reactive_power" ))
     dev.off()
     