data <- read.table("household_power_consumption.txt",header = T,sep = ';')
data$Date <- as.character(data$Date)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]
data$Time <- as.character(data$Time)
dateTime <- paste(data$Date,data$Time)
dateTime <- strptime(dateTime,"%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width = 480, height=480,bg ="transparent")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
plot(dateTime,data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()