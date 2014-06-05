#read all data in
dat <- read.table("./data/household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dat["Datetime"] <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
dat["DateC"] <- as.Date(dat$Date, format="%d/%m/%Y")
#get subset for only 2/1/2007 - 2/2/2007
sub <- dat[dat$DateC %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')),]


# save plot to file
par(mfrow=c(1,1))
plot(sub$Datetime, sub$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(sub$Datetime, sub$Global_active_power)

dev.copy(png, "plot2.png")
dev.off()