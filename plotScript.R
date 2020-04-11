# plotScript.R
#
hhPower <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

hhPower <- hhPower[((hhPower$Date == "1/2/2007") | (hhPower$Date == "2/2/2007")), ]

tz <- "EDT"
hhPower$Time <- strptime(paste(hhPower$Date, hhPower$Time, sep=" "), 
                         "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(hhPower$Date, "%d/%m/%Y")

Global_ap <- as.numeric(hhPower$Global_active_power) / 1000
hist(Global_ap, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     col = "red")

