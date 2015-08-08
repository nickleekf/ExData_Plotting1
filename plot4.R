## Get 2 days data 1 Feb 2007 and 2 Feb 2007
filePath <- "./household_power_consumption.txt"
dataFull <- read.table(filePath,
                       header=TRUE, 
                       sep=";",
                       na.strings = "?",
                       stringsAsFactors = FALSE, 
                       dec=".")

dataTwoDays <- dataFull[dataFull$Date=="1/2/2007" | dataFull$Date=="2/2/2007",]

##Update 'dataTwoDays' dataframe & coerce data accordingly
dataTwoDays$Global_active_power <- as.numeric(dataTwoDays$Global_active_power)
dataTwoDays$DateTime <- strptime(paste(dataTwoDays$Date, dataTwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dataTwoDays$Sub_metering_1 <- as.numeric(dataTwoDays$Sub_metering_1)
dataTwoDays$Sub_metering_2 <- as.numeric(dataTwoDays$Sub_metering_2)
dataTwoDays$Sub_metering_3 <- as.numeric(dataTwoDays$Sub_metering_3)
dataTwoDays$Global_reactive_power <- as.numeric(dataTwoDays$Global_reactive_power)
dataTwoDays$Voltage <- as.numeric(dataTwoDays$Voltage)

## Create PNG plot device
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2)) 

## Plot Graph 1 - Global_active_power
plot(dataTwoDays$DateTime, dataTwoDays$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Plot Graph 2 - Voltage
plot(dataTwoDays$DateTime, dataTwoDays$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot Graph 3 - Energy Sub Metering
plot(dataTwoDays$DateTime, dataTwoDays$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dataTwoDays$DateTime, dataTwoDays$Sub_metering_2, type="l", col="red")
lines(dataTwoDays$DateTime, dataTwoDays$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2.5, 
       lty=1, 
       bty="o",
       col = c("black", "red", "blue") )

## Plot Graph 4 - Global_reactive_power
plot(dataTwoDays$DateTime, dataTwoDays$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## shuts down current device
dev.off()


