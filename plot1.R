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

## convert Gobal Active Power to numeric
subData$Global_active_power <- as.numeric(subData$Global_active_power)

## plot in PNG device
png("plot1.png", width=480, height=480)
hist(subData$Global_active_power,
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
