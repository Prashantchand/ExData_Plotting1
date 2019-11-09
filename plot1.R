filename<-"Power_DataSet.zip"
path<-getwd()
if(!file.exists(filename)){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,file.path(path,filename))
}
if(!file.exists("household_power_consumption")){
  unzip(filename)
}
library(data.table)
Powerdata<-read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses ="character",na.strings = "?")
data<-Powerdata[Powerdata$Date=="2/2/2007"|Powerdata$Date=="1/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)
hist(data$Global_active_power,xlab = "Global Active Power(kilowatts)",main ="Global Active Power",col = "red")
dev.copy(png,file="plot1.png")
dev.off()
