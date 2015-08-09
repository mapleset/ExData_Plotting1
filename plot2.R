# plot2.R
# created 8/2015
# by mapleset
# for the Exploratory Data Analysis class

library(lubridate)

# read the semicolon delimited file as char vectors (not factors)
ep <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = F)
# formate the date column as date type
ep$Date <- as.Date(ep$Date, format="%d/%m/%Y")

# extract a subset of the data for the 2 days we're interested in
sub <- ep[(ep$Date >= as.Date("2007-02-01") & ep$Date <= as.Date("2007-02-02")),]
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$timestamp <- parse_date_time(paste(sub$Date, sub$Time), "%Y-%m-%d %H:%M:%S", truncate = 2)

# plot 2
plot(sub$timestamp, sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# send the plot to a png file
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()