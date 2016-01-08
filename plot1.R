# Creation of Plot 1

## Load data 
power <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

## We will only be using data from 2007-02-01 and 2007-02-02
power2 <- power[as.Date(power$Date,'%d/%m/%Y')=='2007-02-01' | as.Date(power$Date,'%d/%m/%Y')=='2007-02-02', ]

## Creating a new column "datetime"
power2$datetime <- strptime(paste(power2$Date,power2$Time,sep=" "),format='%d/%m/%Y %H:%M:%S')

## Plot 1
with(power2, hist(power2$Global_active_power, col='red',xlab='Global Active Power (kilowatts)', main='Global Active Power'))
dev.copy(png,file='plot1.png')
dev.off()
