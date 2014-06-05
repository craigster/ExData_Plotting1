#read all data in
dat <- read.table("./data/household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dat["Datetime"] <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
dat["DateC"] <- as.Date(dat$Date, format="%d/%m/%Y")
#get subset for only 2/1/2007 - 2/2/2007
sub <- dat[dat$DateC %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')),]


# save plot to file
# originally i was copying to png, but that caused the legend to clip, writing
# directly to the file fixed that (thanks post in the Russian Group forum!)
par(mfrow=c(1,1))
png(file="plot3.png", height=480, width=480)

plot(sub$Datetime, sub$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(sub$Datetime, sub$Sub_metering_1)
lines(sub$Datetime, sub$Sub_metering_2, col="Red")
lines(sub$Datetime, sub$Sub_metering_3, col="Blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("Black","Red","Blue"), lwd=2)

dev.off()