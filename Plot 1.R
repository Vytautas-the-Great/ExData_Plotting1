# DATA LOADING AND CLEANING

data <- read.csv("household_power_consumption.txt", sep = ";",colClasses= 'character')
data[data == '?'] <- NA
data[ , c(3:9)] <- apply(data[ , c(3:9)], 2, function(x) as.numeric(x))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# PLOT NO 1
png('Plot 1.png',width = 480, height = 480,units = "px")

par("mfrow" = c(1,1))
data <- subset(data, Date %in% c(as.Date('1/2/2007',format="%d/%m/%Y"),as.Date('2/2/2007',format="%d/%m/%Y")))
hist(data$Global_active_power, col = 'red', main = 'Global Active Power', xlab="Global Active Power (kilowatts)")
dev.off()