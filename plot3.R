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
dataTwoDays$DateTime <- strptime(paste(dataTwoDays$Date, dataTwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Get subMetering1,2 and 3 and coerce into numeric data
dataTwoDays$Sub_metering_1 <- as.numeric(dataTwoDays$Sub_metering_1)
dataTwoDays$Sub_metering_2 <- as.numeric(dataTwoDays$Sub_metering_2)
dataTwoDays$Sub_metering_3 <- as.numeric(dataTwoDays$Sub_metering_3)

## Create PNG plot device
png(filename = "plot3.png",width = 480, height = 480)

## Plot onto existing plot device
plot(dataTwoDays$DateTime, 
     dataTwoDays$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(dataTwoDays$DateTime, dataTwoDays$Sub_metering_2, col="red")
lines(dataTwoDays$DateTime, dataTwoDays$Sub_metering_3, col="blue")

## Create a legend on the topright of chart
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2.5, 
       lty=1, 
       col = c("black", "red", "blue") )

## shuts down current device
dev.off()