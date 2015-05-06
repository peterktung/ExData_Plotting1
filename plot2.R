library("lubridate")
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                   colClasses=c("myDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[(data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02")),]
dts <- ymd_hms(paste(data$Date, data$Time))

plot(x=dts, y=data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.copy(png, file = "plot2.png")
dev.off()