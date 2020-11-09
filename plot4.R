dt<-read.table("household_power_consumption.txt",header = TRUE, sep = ";" ,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
dt$Date<-as.Date(dt$Date,'%d/%m/%Y')
dt<-subset(dt,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))
dt<-dt[complete.cases(dt),]
dateTime<-paste(dt$Date,dt$Time)
dateTime<setNames(dateTime,"DateTime")
dt<-dt[,!(names(dt) %in% c("Time",'Date'))]
dt<-cbind(dateTime,dt)
dt$dateTime<-as.POSIXct(dateTime)

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(dt,
{plot(Global_active_power~dateTime, type="l", ylab="Global Active Power", xlab="")
plot(Voltage~dateTime, type="l", ylab="Voltage",xlab="datetime")
plot(Sub_metering_1~dateTime,type="l",ylab = "Energy sub metering",xlab="")
lines(Sub_metering_2~dateTime,col="red")
lines(Sub_metering_3~dateTime,col="blue")
legend("topright",col=c('black','red','blue'),cex=0.9,lty=1, lwd=1, bty="n",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
plot(Global_reactive_power~dateTime, type="l",xlab="datetime")})


dev.copy(png,"plot4.png", width=480, height=480)
dev.off()