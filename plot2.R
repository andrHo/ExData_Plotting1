data <- read.table("household_power_consumption.txt", na.strings = "?", sep =";", header = T)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
#Create a new column with data and time as strings
data_subset$DateTime <- paste(data_subset$Date,data_subset$Time)
#Convert data and time string to POSIXlt
data_subset$DateTime <- strptime(data_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")
png("plot2.png")
with(data_subset, plot(DateTime, Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
