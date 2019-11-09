filename<-"Power_DataSet.zip"
path<-getwd()
if(!file.exists(filename)){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,file.path(path,filename))
}
if(!file.exists("household_power_consumption")){
  unzip(filename)
}
library(dplyr)
Powerdata<-read.csv("household.txt",sep=";",header=TRUE,na.strings = "?")
data<-Powerdata[Powerdata$Date=="2/2/2007"|Powerdata$Date=="1/2/2007",]
data<-mutate(data,datetime=as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))
png("plot4.png",width = 480,height = 480)
par(mfcol=c(2,2))
#first plot
plot(data$datetime,data$Global_active_power,xlab = "", ylab="Global Active Power",type = "l")
#second plot
plot(data$datetime,data$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
points(data$datetime,data$Sub_metering_2,col="red",type = "l")
points(data$datetime,data$Sub_metering_3,col="blue",type = "l")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#third plot
plot(data$datetime,data$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
#fourth plot
plot(data$datetime,data$Global_reactive_power,xlab = "datetime",ylab = "Global Reactive Power",type = "l")
#turning off the png graphic device
dev.off()
