## Plot4 plot 4 graphes with par function

## Read data
donnees <- read.csv(file.path("household_power_consumption.txt"), sep = ";")

## Filter data
timed_data <- subset(donnees, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01", format = "%Y-%m-%d") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02", format = "%Y-%m-%d"))

clean_data <- subset(timed_data, Global_active_power != "?")
power_data <- as.numeric(as.character(clean_data$Global_active_power))

clean_data <- subset(timed_data, Voltage != "?")
voltage_data <- as.numeric(as.character(clean_data$Voltage))

clean_data <- subset(timed_data, Sub_metering_1 != "?" & Sub_metering_2 != "?" & Sub_metering_3 != "?" )
sm1_data <- as.numeric(as.character(clean_data$Sub_metering_1))
sm2_data <- as.numeric(as.character(clean_data$Sub_metering_2))
sm3_data <- as.numeric(as.character(clean_data$Sub_metering_3))

clean_data <- subset(timed_data, Global_reactive_power != "?")
reactive_power_data <- as.numeric(as.character(clean_data$Global_reactive_power))

times <- paste(clean_data$Date, clean_data$Time)
times <- strptime(times, "%d/%m/%Y %H:%M:%S")

## Create a 2*2 matrix to hold the spots
par(mfrow = c(2, 2))

## Display the plots
plot(times, power_data, xlab = "", ylab = "Global Active Power", type = "l")

plot(times, voltage_data, xlab = "datetime", ylab = "Voltage", type = "l")

plot(times, sm1_data, xlab = "", type = "l", col = "black", ylab = "Energy sub metering")
points(times, sm2_data, xlab = "", type = "l", col = "red")
points(times, sm3_data, xlab = "", type = "l", col = "blue")
## Legend
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(times, reactive_power_data, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

## Export to a PNG file
dev.copy(png, file = "plot4.png")
dev.off()
