# DATA LOADING AND CLEANING

data <- read.csv("household_power_consumption.txt", sep = ";",colClasses= 'character')
data[data == '?'] <- NA
data[ , c(3:9)] <- apply(data[ , c(3:9)], 2, function(x) as.numeric(x))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# PLOT NO 3
png('Plot 3.png',width = 480, height = 480,units = "px")
plot(data$DateTime, data$Sub_metering_1,type="l", col = 'black',xlab ='', ylab="Global Active Power (kilowatts)",xaxt="n")

lines(data$DateTime, data$Sub_metering_2,type="l", col = 'red')
lines(data$DateTime, data$Sub_metering_3,type="l", col = 'blue')

axis.POSIXct(1, at=seq(min(data$DateTime), max(data$DateTime)+100, by="days"), format = "%a")
legend(x = "topright", lty = c(4,6),  text.font = 1,
       col= c("black","red"),text.col = "black", 
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

