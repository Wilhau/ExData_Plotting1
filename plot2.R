## Load and filter data
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
plotdata <- subset(alldata, alldata$DateTime>="2007-02-01" & alldata$DateTime<"2007-02-03")

## Create and save plot
png("plot2.png", 480, 480)
with(plotdata, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
