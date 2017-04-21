# Load and prepare data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
date_time <- paste(data$Date, data$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
data <- cbind(date_time, data)
data2days <- subset(data, data$date_time >= "2007-02-01" & 
                            data$date_time < "2007-02-03")

# Plot 1
hist(data2days$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Copy to file
dev.copy(png, file = "plot1.png")
dev.off()
