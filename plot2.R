## Plot2 plot global active power on the two days

## Read data
donnees <- read.csv(file.path("household_power_consumption.txt"), sep = ";")

## Filter data
timed_data <- subset(donnees, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01", format = "%Y-%m-%d") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02", format = "%Y-%m-%d"))
clean_data <- subset(timed_data, Global_active_power != "?")

power_data <- as.numeric(as.character(clean_data$Global_active_power))
times <- paste(clean_data$Date, clean_data$Time)
times <- strptime(times, "%d/%m/%Y %H:%M:%S")

## Display the plot
plot(times, power_data, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## Export to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()
