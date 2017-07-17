## Plot3 plot energy sub metering on the two days

## Read data
donnees <- read.csv(file.path("household_power_consumption.txt"), sep = ";")

## Filter data
timed_data <- subset(donnees, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01", format = "%Y-%m-%d") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02", format = "%Y-%m-%d"))
clean_data <- subset(timed_data, Sub_metering_1 != "?" & Sub_metering_2 != "?" & Sub_metering_3 != "?" )

sm1_data <- as.numeric(as.character(clean_data$Sub_metering_1))
sm2_data <- as.numeric(as.character(clean_data$Sub_metering_2))
sm3_data <- as.numeric(as.character(clean_data$Sub_metering_3))

times <- paste(clean_data$Date, clean_data$Time)
times <- strptime(times, "%d/%m/%Y %H:%M:%S")

## Display the plot
plot(times, sm1_data, xlab = "", type = "l", col = "black", ylab = "Energy sub metering")
points(times, sm2_data, xlab = "", type = "l", col = "red")
points(times, sm3_data, xlab = "", type = "l", col = "blue")

## Legend
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Export to a PNG file
dev.copy(png, file = "plot3.png")
dev.off()
