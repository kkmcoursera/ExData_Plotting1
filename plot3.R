##
# plot3.R -- Creates a plot of three Energy Submetering values
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
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

# Set margins 
par(mar = c(5.1, 4.1, 3.1, 1.1))  # c(bottom, left, top, right)

# Generate plot for multiple sets of Sub_metering_ values
plot(hhPower$Time, as.numeric(as.character(hhPower$Sub_metering_1)), 
     type = "o", pch = 46, ylab = "Energy sub metering", xlab = "")
points(hhPower$Time, as.numeric(as.character(hhPower$Sub_metering_2)), 
       type = "o", pch = 46, col = "red")
points(hhPower$Time, as.numeric(as.character(hhPower$Sub_metering_3)), 
       type = "o", pch = 46, col = "blue")

# Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = 46, lwd = 2)

# Close output PNG device
dev.off()
