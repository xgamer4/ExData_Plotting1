setwd("/home/greg/Documents/MOOC/Coursera/EDA/ExData_Plotting1.git/trunk")
power <- read.csv('household_power_consumption.txt', sep=";", stringsAsFactors=FALSE)
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- subset(power, power$Date >= '2007-02-01' & power$Date <= '2007-02-02')
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)


png(filename = "plot2.png")
plot(power$DateTime, power$Global_active_power, pch='.', ylab="Global Active Power (kilowatts)", main="", xlab="", type="l")
dev.off()