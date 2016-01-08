# Creation of Plot 2

## Load data 
power <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

## We will only be using data from 2007-02-01 and 2007-02-02
power2 <- power[as.Date(power$Date,'%d/%m/%Y')=='2007-02-01' | as.Date(power$Date,'%d/%m/%Y')=='2007-02-02', ]

## Creating a new column "datetime"
power2$datetime <- strptime(paste(power2$Date,power2$Time,sep=" "),format='%d/%m/%Y %H:%M:%S')

## Plot 2
with(power2,plot(datetime,Global_active_power,type='l',lwd=1, ylab='Global Active Power (kilowatts)',xlab=''))
dev.copy(png,file='plot2.png')
dev.off()