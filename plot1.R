# file date format is dd/mm/yyyy, create converter for this date format
setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
#read all data in
dat <- read.table("./data/household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#get subset for only 2/1/2007 - 2/2/2007
sub <- dat[dat$Date %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')),]

par(mfrow=c(1,1))
hist(sub$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# save plot to file
dev.copy(png, "plot1.png")
dev.off()