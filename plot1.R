##
# plot1.R -- Creates a histogram of Global_active_power
##

# Read the supplied Household Power Consumption dataset
hhPower <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

# Isolate data for only 1st and 2nd February 2007 (in dd/mm/yyyy format)
hhPower <- hhPower[((hhPower$Date == "1/2/2007") | (hhPower$Date == "2/2/2007")), ]

# Convert Date and Time columns to their respective formats
TZ <- "EDT"
hhPower$Time <- strptime(paste(hhPower$Date, hhPower$Time, sep=" "), 
                         "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(hhPower$Date, "%d/%m/%Y")

# Prepare output settings for a 480px by 480px PNG file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

# Set margins 
par(mar = c(4.1, 5.1, 1.1, 4.1))  # c(bottom, left, top, right)

# Generate histogram plot
hist(as.numeric(as.character(hhPower$Global_active_power)), 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     col = "red")

# Close output PNG device
dev.off()

