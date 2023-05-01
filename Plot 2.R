# DATA LOADING AND CLEANING

data <- read.csv("household_power_consumption.txt", sep = ";",colClasses= 'character')
data[data == '?'] <- NA
data[ , c(3:9)] <- apply(data[ , c(3:9)], 2, function(x) as.numeric(x))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# PLOT NO 2
png('Plot 2.png',width = 480, height = 480,units = "px")
plot(data$DateTime, data$Global_active_power,type="l", col = 'black',xlab ='', ylab="Global Active Power (kilowatts)",xaxt="n")
axis.POSIXct(1, at=seq(min(data$DateTime), max(data$DateTime)+100, by="days"), format = "%a")
dev.off()