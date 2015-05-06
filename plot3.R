library("lubridate")
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                   colClasses=c("myDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[(data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02")),]
dts <- ymd_hms(paste(data$Date, data$Time))

plot(x=dts, y=data$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
lines(x=dts, y=data$Sub_metering_2, col = "red")
lines(x=dts, y=data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()