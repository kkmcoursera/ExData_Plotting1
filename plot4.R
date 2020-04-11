##
# plot4.R -- Creates a set of four plots
##

# Read the supplied Household Power Consumption dataset
hhPower <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# Isolate data for only 1st and 2nd February 2007 (in dd/mm/yyyy format)
hhPower <- hhPower[((hhPower$Date == "1/2/2007") | (hhPower$Date == "2/2/2007")), ]

# Convert Date and Time columns to their respective formats
tz <- "EDT"
hhPower$Time <- strptime(paste(hhPower$Date, hhPower$Time, sep=" "), 
                         "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(hhPower$Date, "%d/%m/%Y")

# Prepare output settings for a 480px by 480px PNG file
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

# Set margins and 2 by 2 matrix for the four individual plots
par(mar = c(4.1, 4.1, 4.1, 1.1), mfcol = c(2, 2))  # c(bottom, left, top, right)

# Generate plot of Global_active_power (upper left)
plot(hhPower$Time, as.numeric(as.character(hhPower$Global_active_power)), 
     type = "o", pch = 46,
     ylab = "Global Active Power", xlab = "")

# Generate plot of three Sub_metering_ values (lower left)
plot(hhPower$Time, as.numeric(as.character(hhPower$Sub_metering_1)), 
        type = "o", pch = 46,
        ylab = "Energy sub metering", xlab = "")
points(hhPower$Time, as.numeric(as.character(hhPower$Sub_metering_2)), 
       type = "o", pch = 46, col = "red")
points(hhPower$Time, as.numeric(as.character(hhPower$Sub_metering_3)), 
       type = "o", pch = 46, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), pch = 46, bty = "n",
        lwd = 2, cex = 1)

# Generate plot of Voltage (upper right)
plot(hhPower$Time, as.numeric(as.character(hhPower$Voltage)), 
     type = "o", pch = 46,
     ylab = "Voltage", xlab = "datetime")

# Generate plot of Global_reactive_power (lower right)
plot(hhPower$Time, as.numeric(as.character(hhPower$Global_reactive_power)), 
     type = "o", pch = 46,
     ylab = "Global_reactive_power", xlab = "datetime")

# Close output PNG device
dev.off()
