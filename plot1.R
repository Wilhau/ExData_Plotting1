## Load and filter data
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
plotdata <- subset(alldata, alldata$DateTime>="2007-02-01" & alldata$DateTime<"2007-02-03")

## Create and save plot
png("plot1.png", 480, 480)
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
