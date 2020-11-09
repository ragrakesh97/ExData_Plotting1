dt<-read.table("household_power_consumption.txt",header = TRUE, sep = ";" ,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
dt$Date<-as.Date(dt$Date,'%d/%m/%Y')
dt<-subset(dt,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))
dt<-dt[complete.cases(dt),]
dateTime<-paste(dt$Date,dt$Time)
dateTime<setNames(dateTime,"DateTime")
dt<-dt[,!(names(dt) %in% c("Time",'Date'))]
dt<-cbind(dateTime,dt)
dt$dateTime<-as.POSIXct(dateTime)

with(dt,{plot(Sub_metering_1~dt$dateTime,type="l",ylab = "Energy sub metering",xlab="")
lines(Sub_metering_2~dateTime,col="red")
lines(Sub_metering_3~dateTime,col="blue")
})
legend("topright",col=c('black','red','blue'),lwd=1,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()