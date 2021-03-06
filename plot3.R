# Creation of Plot 3

## Load data 
power <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

## We will only be using data from 2007-02-01 and 2007-02-02
power2 <- power[as.Date(power$Date,'%d/%m/%Y')=='2007-02-01' | as.Date(power$Date,'%d/%m/%Y')=='2007-02-02', ]

## Creating a new column "datetime"
power2$datetime <- strptime(paste(power2$Date,power2$Time,sep=" "),format='%d/%m/%Y %H:%M:%S')

## Plot 3
with(power2, { 
        plot(datetime,Sub_metering_1,type='l', ylab='Energy sub metering',xlab='')
        lines(datetime,Sub_metering_2,type='l',col='red')
        lines(datetime,Sub_metering_3,type='l',col='blue')
})
legend('topright',cex=0.7,col=c('black','red','blue'),lty=1,lwd=2,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.copy(png,file='plot3.png',width=480,height=480)
dev.off()
