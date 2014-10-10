data <- read.table("household_power_consumption.txt",header = T,sep = ';')
data$Date <- as.character(data$Date)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

png(file="plot1.png", width = 480, height=480,bg ="transparent")

hist(data$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

dev.off()