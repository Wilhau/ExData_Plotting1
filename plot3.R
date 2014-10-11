## Load and filter data
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time), format="%d/%m/%Y %H:%M:%S")
plotdata <- subset(alldata, alldata$DateTime>="2007-02-01" & alldata$DateTime<"2007-02-03")

## Create and save plot
png("plot3.png", 480, 480)
with(plotdata, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub meeting", xlab=""))
with(plotdata, lines(DateTime, Sub_metering_2, col="red"))
with(plotdata, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"))
dev.off()
