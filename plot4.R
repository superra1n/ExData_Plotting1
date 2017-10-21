#setup parameter
fileURL <- "./household_power_consumption.txt"

## read file
data <- read.table(fileURL, 
                   sep = ";",
                   dec = ".",
                   na.strings = "?",
                   header = TRUE,
                   stringsAsFactors = FALSE)

## retrieve observation data on 2/1 and 2/2 of 2007
subData <- subset(data, Date == "1/2/2007" |  Date == "2/2/2007")

## convert $Date and $Time from char to date and time
x <- paste(subData$Date, subData$Time, sep = "")
dateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## plot in PNG device
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))  #setup 4x4 plot matrix

## first plot
plot(dateTime,subData$Global_active_power,
     type="l",
     xlab ="",
     ylab="Global Active Power (kilowatts)")

## second plot
plot(dateTime,subData$Sub_metering_1,
     type="l",
     xlab ="",
     ylab="Energy sub metering")
lines(dateTime,subData$Sub_metering_2,
      type="l",
      col="red")
lines(dateTime,subData$Sub_metering_3,
      type="l",
      col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       col = c("black", "red", "blue")
       )

## third plot
plot(dateTime, subData$Voltage,
     type="l",
     ylab="Votage")

## fourth plot
plot(dateTime, subData$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power")

dev.off()
