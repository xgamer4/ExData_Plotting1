setwd("/home/greg/Documents/MOOC/Coursera/EDA/ExData_Plotting1.git/trunk")
power <- read.csv('household_power_consumption.txt', sep=";", stringsAsFactors=FALSE)
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- subset(power, power$Date >= '2007-02-01' & power$Date <= '2007-02-02')
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)


png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(power$DateTime, power$Global_active_power, pch='.', ylab="Global Active Power (kilowatts)", main="", xlab="", type="l")

plot(power$DateTime, power$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(power$DateTime, power$Sub_metering_1, type="l",  ylab="Energy sub metering", xlab="")
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


plot(power$DateTime, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()