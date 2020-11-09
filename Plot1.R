dt<-read.table("household_power_consumption.txt",header = TRUE, sep = ";" ,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
dt$Date<-as.Date(dt$Date,'%d/%m/%Y')
dt<-subset(dt,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))
dt<-dt[complete.cases(dt),]
dateTime<-paste(dt$Date,dt$Time)
dateTime<setNames(dateTime,"DateTime")
dt<-dt[,!(names(dt) %in% c("Time",'Date'))]
dt<-cbind(dateTime,dt)
dt$dateTime<-as.POSIXct(dateTime)

hist(dt$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()