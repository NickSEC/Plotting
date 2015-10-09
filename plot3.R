setwd("/Users/nicklukianoff/Desktop/Explore Data/Proj 1")

#Read in the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Select only the 2 days that we need and format them
data <- subset(data2, Date == "1/2/2007" | Date == "2/2/2007")
data$fulldate <- as.POSIXct(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")

#Format the numerical column to display correctly
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Plot 3
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
       lty = c(1,1), lwd = c(1,1), cex = .75)

dev.copy(png,"plot3.png", width = 480, height = 480)
dev.off()
