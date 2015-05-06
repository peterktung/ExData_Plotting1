setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                   colClasses=c("myDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[(data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02")),]

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

