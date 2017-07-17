## Plot1 plot global active power in february

## Read data
donnees <- read.csv(file.path("household_power_consumption.txt"), sep = ";")

## Filter data
timed_data <- subset(donnees, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01", format = "%Y-%m-%d") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02", format = "%Y-%m-%d"))
clean_data <- subset(timed_data, Global_active_power != "?")
power_data <- as.numeric(as.character(clean_data$Global_active_power))

## Display the plot in an histogram
hist(power_data, main = "Global Active Power", col = "red", xlab = "Globale Active Power (kilowatts)")

## Export to a PNG file
dev.copy(png, file = "plot1.png")
dev.off()
