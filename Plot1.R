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

## Plot 1
# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/Plot1.png', width=480, height=480, units='px')
# plot figure 1
with(subSetplotData,hist(Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red'))
# close device
dev.off()
