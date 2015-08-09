# plot1.R
# created 8/2015
# by mapleset
# for the Exploratory Data Analysis class

ep <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = F)
ep$Date <- as.Date(ep$Date, format="%d/%m/%Y")

sub <- ep[(ep$Date >= as.Date("2007-02-01") & ep$Date <= as.Date("2007-02-02")),]
sub$Global_active_power <- as.numeric(sub$Global_active_power)

#plot 1
hist(sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# send the plot to a png file
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
