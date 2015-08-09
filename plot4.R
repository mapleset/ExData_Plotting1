# plot4.R
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

# legend text / line colors
leg.text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
leg.color = c("black","red","blue")

#create 2x2 frame for 4 graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# create the 4 graphs
with(sub, {
  plot(timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(timestamp, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(timestamp, Sub_metering_1,type="l",col=leg.color[0], xlab="", ylab= "Energy sub metering")
  lines(timestamp, Sub_metering_2,col=leg.color[1])
  lines(timestamp, Sub_metering_3,col=leg.color[2])
  legend("topright", legend=leg.text, lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=leg.color)
  plot(timestamp, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  mtext("", outer=TRUE)
})
# send the plot to a png file
dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
