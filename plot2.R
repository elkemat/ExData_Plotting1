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

# Plot 2
plot(data2days$date_time, data2days$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "l")

# Copy to file
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()