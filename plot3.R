data <- read.table("household_power_consumption.txt", na.strings = "?", sep =";", header = T)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
#Create a new column with data and time as strings
data_subset$DateTime <- paste(data_subset$Date,data_subset$Time)
#Convert data and time string to POSIXlt
data_subset$DateTime <- strptime(data_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")
png("plot3.png")
with(data_subset,plot(DateTime,Sub_metering_1, type = "l",
                      xlab = "", ylab = "Energy sub metering"))
with(data_subset,lines(DateTime,Sub_metering_2, col = "red"))
with(data_subset,lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright",lty =1,col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )
dev.off()