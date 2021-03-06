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

# Plot 4, setting mfrow
par(mfrow = c(2,2))

# Plot 4.1, top left
plot(data2days$date_time, data2days$Global_active_power, xlab = "",
     ylab = "Global Active Power", type = "l")

# Plot 4.2, top right
plot(data2days$date_time, data2days$Voltage, xlab = "datetime",
     ylab = "Voltage", type = "l")

# Plot 4.1, bottom left
plot(data2days$date_time, data2days$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
points(data2days$date_time, data2days$Sub_metering_2, type = "l", col = "red")
points(data2days$date_time, data2days$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4.1, bottom right
with(data2days, plot(date_time, Global_reactive_power, xlab = "datetime",
     type = "l"))

# Copy to file
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()