getwd()
list.files()
data<- read.table('household_power_consumption.txt', header = T, sep=';')
datetime<- paste(data$Date, data$Time)
head(datetime)
datetime<- as.POSIXct(datetime, format= '%d/%m/%Y %H:%M:%S')
data$datetime<- datetime
names(data)
data<- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

plot(x=data$datetime, y=data$Sub_metering_1, type='l', ylab = 'Submetering')
lines(x=data$datetime, y=data$Sub_metering_2, col='Red')
lines(x=data$datetime, y=data$Sub_metering_3,  col= 'blue')
legend('topright', pch='____', col=c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png, 'plot3.png')
dev.off()
       