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
png("plot2.png",width = 480,height = 480)
plot(data$datetime,data$Global_active_power,xlab = "",
     ylab="Global Active Power(kilowatts)",type = "l")
dev.off()     


