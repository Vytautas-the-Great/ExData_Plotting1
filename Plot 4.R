# DATA LOADING AND CLEANING

data <- read.csv("household_power_consumption.txt", sep = ";",colClasses= 'character')
data[data == '?'] <- NA
data[ , c(3:9)] <- apply(data[ , c(3:9)], 2, function(x) as.numeric(x))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# PLOT NO 4
png('Plot 4.png',width = 480, height = 480,units = "px")
par("mfrow" = c(2,2))
par("mar" = c(2,4,2.5,2.5))

plot(data$DateTime, data$Global_active_power,type="l", col = 'black',xlab ='', ylab="Global Active Power (kilowatts)",cex.lab=0.8,cex.axis=0.8,xaxt="n")
axis.POSIXct(1, at=seq(min(data$DateTime), max(data$DateTime)+100, by="days"), format = "%a")

plot(data$DateTime, data$Voltage,type="l", col = 'black',xlab ='', ylab="Voltage",cex.lab=0.8,cex.axis=0.8,xaxt="n")
axis.POSIXct(1, at=seq(min(data$DateTime), max(data$DateTime)+100, by="days"), format = "%a")

plot(data$DateTime, data$Sub_metering_1,type="l", col = 'black',xlab ='', ylab="Global Active Power (kilowatts)",cex.lab=0.8,cex.axis=0.8, xaxt="n")

lines(data$DateTime, data$Sub_metering_2,type="l", col = 'red')
lines(data$DateTime, data$Sub_metering_3,type="l", col = 'blue')

axis.POSIXct(1, at=seq(min(data$DateTime), max(data$DateTime)+100, by="days"), format = "%a")

plot(data$DateTime, data$Global_reactive_power,type="l", col = 'black',xlab ='',cex.lab=0.8,cex.axis=0.8,xaxt="n")
axis.POSIXct(1, at=seq(min(data$DateTime), max(data$DateTime)+100, by="days"), format = "%a")
dev.off()
