# Load and prepare data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
date_time <- paste(data$Date, data$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data <- cbind(date_time, data)
data2days <- subset(data, data$date_time >= "2007-02-01" & 
                            data$date_time < "2007-02-03")

# To avoid German weekdays in plot 
Sys.setlocale("LC_TIME", "en_US")

# Plot 3
plot(data2days$date_time, data2days$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
points(data2days$date_time, data2days$Sub_metering_2, type = "l", col = "red")
points(data2days$date_time, data2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy to file
dev.copy(png, file = "plot3.png")
dev.off()