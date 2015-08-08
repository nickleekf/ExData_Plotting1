## Get 2 days data 1 Feb 2007 and 2 Feb 2007
filePath <- "./household_power_consumption.txt"
dataFull <- read.table(filePath,
                   header=TRUE, 
                   sep=";",
                   na.strings = "?",
                   stringsAsFactors = FALSE, 
                   dec=".")

dataTwoDays <- dataFull[dataFull$Date=="1/2/2007" | dataFull$Date=="2/2/2007",]

## Get globalActivePower numeric data
dataTwoDays$Global_active_power <- as.numeric(dataTwoDays$Global_active_power)

## Create PNG plot device
png(filename = "plot1.png",width = 480, height = 480)

## create histogram and plots on PNG device
hist(dataTwoDays$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## shuts down current device
dev.off()