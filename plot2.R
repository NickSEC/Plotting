setwd("/Users/nicklukianoff/Desktop/Explore Data/Proj 1")

#Read in the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Select only the 2 days that we need and format them
data <- subset(data2, Date == "1/2/2007" | Date == "2/2/2007")
data$fulldate <- as.POSIXct(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")

#Format the numerical column to display correctly
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Plot 2
plot(data$fulldate,
     data$Global_active_power,
     type = "l",
     xlab ="",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()
