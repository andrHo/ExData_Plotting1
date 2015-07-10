data <- read.table("household_power_consumption.txt", na.strings = "?", sep =";", header = T)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
png("plot1.png")
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()