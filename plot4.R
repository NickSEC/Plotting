setwd("/Users/nicklukianoff/Desktop/Explore Data/Proj 1")

#Read in the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Select only the 2 days that we need and format them
data <- subset(data2, Date == "1/2/2007" | Date == "2/2/2007")
data$fulldate <- as.POSIXct(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")

#Format the numerical column to display correctly
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

#Plot 4
par(mfrow = c(2,2))
plot(data$fulldate,
     data$Global_active_power,
     type = "l",
     xlab ="",
     ylab = "Global Active Power (kilowatts)")

plot(data$fulldate,
     data$Voltage,
     type = "l",
     xlab ="datetime",
     ylab = "Voltage")

plot(data$fulldate,
     data$Sub_metering_1,
     type = "l",
     xlab ="",
     ylab = "Energy sub metering")
lines(data$fulldate,
      data$Sub_metering_2,
      col = "red")
lines(data$fulldate,
      data$Sub_metering_3,
      col = "blue")
legend("topright",col=c("black","red","blue"),
       c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "),
       lty = c(1,1), lwd = c(1,1), bty = "n", cex =.5, y.intersp = .5)

plot(data$fulldate,
     data$Global_reactive_power,
     type = "l",
     xlab ="",
     ylab = "Global_reactive_power")

dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()

#The previous dev.off turned off the PNG, this next one turns off plotting 4 charts
dev.off()

