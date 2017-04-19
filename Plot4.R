## Download and unzip the data file
setwd('C:/Users/xxxxxx/Desktop/ExData_Plotting1')
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

## read data into R
datafile <- file('./data/household_power_consumption.txt')
plotData <- read.table(datafile, header=TRUE, sep=";", na.strings="?")
subSetplotData <- plotData[plotData$Date %in% c("1/2/2007", "2/2/2007"),]

## Plot 4
# Setup Strings
DateTime <- strptime(paste(subSetplotData$Date, subSetplotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subSetplotData$Global_active_power)
GlobalReactivePower <- as.numeric(subSetplotData$Global_reactive_power)
Voltage <- as.numeric(subSetplotData$Voltage)

subMetering1 <- as.numeric(subSetplotData$Sub_metering_1)
subMetering2 <- as.numeric(subSetplotData$Sub_metering_2)
subMetering3 <- as.numeric(subSetplotData$Sub_metering_3)


# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/Plot4.png', width=480, height=480, units='px')
# plot figure 4
par(mfrow = c(2,2))
plot(DateTime, GlobalActivePower, xlab='', ylab='Global Active Power', type='l', cex=0.2)
plot(DateTime, Voltage, xlab='datetime', ylab='Voltage', type='l')

plot(DateTime, subMetering1, xlab='', ylab='Energy sub metering', type='l')
lines(DateTime, subMetering2, type='l', col='red')
lines(DateTime, subMetering3, type='l', col='blue')
legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty =, lwd=2.5, bty='o')

plot(DateTime, GlobalReactivePower, xlab='datetime', ylab='Global_reactive_power', type='l')

# close device
dev.off()
