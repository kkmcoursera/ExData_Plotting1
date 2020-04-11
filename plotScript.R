# plotScript.R
#
hhPower <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

hhPower <- hhPower[((hhPower$Date == "1/2/2007") | (hhPower$Date == "2/2/2007")), ]

tz <- "EDT"
hhPower$Time <- strptime(paste(hhPower$Date, hhPower$Time, sep=" "), 
                         "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(hhPower$Date, "%d/%m/%Y")

hist(as.numeric(hhPower$Global_active_power), 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     col = "red")

par(mar = c(3.1, 4.1, 1.1, 2.1))
plot(hhPower$Time, as.numeric(hhPower$Global_active_power), 
     type = "o", pch = 46,
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(hhPower$Time, hhPower$Sub_metering_1, type = "o", pch = 46,
     ylab = "Energy Sub Metering", xlab = "")
points(hhPower$Time, hhPower$Sub_metering_2, type = "o", pch = 46, col = "red")
points(hhPower$Time, hhPower$Sub_metering_3, type = "o", pch = 46, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = 46, lwd = 2)

par(mar = c(4.1, 5.1, 1.1, 2.1), mfcol = c(2, 2))

plot(hhPower$Time, Gap_KW, type = "o", pch = 46,
     ylab = "Global Active Power", xlab = "")

plot(hhPower$Time, hhPower$Sub_metering_1, type = "o", pch = 46,
        ylab = "Energy Sub Metering", xlab = "")
points(hhPower$Time, hhPower$Sub_metering_2, type = "o", pch = 46, col = "red")
points(hhPower$Time, hhPower$Sub_metering_3, type = "o", pch = 46, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), pch = 46, lwd = 2, cex = 0.75)

plot(hhPower$Time, hhPower$Voltage, type = "o", pch = 46,
     ylab = "Voltage", xlab = "datetime")

plot(hhPower$Time, hhPower$Global_reactive_power, type = "o", pch = 46,
     ylab = "Global_reactive_power", xlab = "datetime")
