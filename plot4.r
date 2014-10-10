data <- read.table("household_power_consumption.txt",header = T,sep = ';')
data$Date <- as.character(data$Date)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]
data$Time <- as.character(data$Time)
dateTime <- paste(data$Date,data$Time)
dateTime <- strptime(dateTime,"%Y-%m-%d %H:%M:%S")

png(file="plot4.png", width = 480, height=480,bg ="transparent")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

par(mfcol= c(2, 2))

plot(dateTime,data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)",cex.lab = 0.7)

plot(dateTime, data$Sub_metering_1, col = "black",type="l",xlab = "",ylab = "Energy sub metering")
lines(dateTime, data$Sub_metering_2, col = "red")
lines(dateTime, data$Sub_metering_3, col = "blue")
legend("topright",lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")

plot(dateTime,data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(dateTime,data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()