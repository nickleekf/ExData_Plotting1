## Get 2 days data 1 Feb 2007 and 2 Feb 2007
filePath <- "./household_power_consumption.txt"
dataFull <- read.table(filePath,
                       header=TRUE, 
                       sep=";",
                       na.strings = "?",
                       stringsAsFactors = FALSE, 
                       dec=".")

dataTwoDays <- dataFull[dataFull$Date=="1/2/2007" | dataFull$Date=="2/2/2007",]

## Get globalActivePower and coerce into numeric data
dataTwoDays$Global_active_power <- as.numeric(dataTwoDays$Global_active_power)

## Create a new datetime column called DateTime. Store date and time together
dataTwoDays$DateTime <- strptime(paste(dataTwoDays$Date, 
                                       dataTwoDays$Time, 
                                       sep=" "), "%d/%m/%Y %H:%M:%S")
  
## Create PNG plot device
png(filename = "plot2.png",width = 480, height = 480)

## Plot onto existing plot device
plot(x=dataTwoDays$DateTime, 
     y=dataTwoDays$Global_active_power, 
     col="black", 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

## shuts down current device
dev.off()