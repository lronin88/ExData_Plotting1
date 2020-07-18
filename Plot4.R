## Coursera  - R - Exploratory Data Analysis - Assignment Week 1
## lronin88
## July 2020
## ////////////////////////////////////////
## ////////////////////////////////////////
library(plyr)
library("data.table")
## Download and unzip data
setwd("~/R_Coursera/ExData_Plotting1")
DataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DataFilename <- "MyData.zip"
download.file(url = DataUrl,destfile=DataFilename)
unzip(zipfile = DataFilename, exdir = "./mydata")
## Read all data
Raw_data<-data.table::fread("mydata/household_power_consumption.txt")
##head(Raw_data)
Raw_data$Date<-as.Date(Raw_data$Date,format ="%d/%m/%Y")
head(Raw_data)
class(Raw_data$Time)
Raw_data$Time<-format(strptime(Raw_data$Time,format="%H:%M:%S"),"%H:%M:%S")
head(Raw_data)
## Use only data from the dates 2007-02-01 and 2007-02-02
SelData<-subset(Raw_data, Date=="2007-02-01"|Date=="2007-02-02", drop=FALSE)
head(SelData)
## Plot third graph and save it as a png file called plot3.png
png("plot4.png", 480, 480)
par(mfcol=c(2,2),mai = c(0.5,0.5,0.5,0.5),cex=0.5)
#plot (a)
with(SelData,plot(Global_active_power,type="l",xaxt='n',xlab="",ylab="Global Active Power (kilowatts)"))
axis(1,at=c(1,nrow(SelData)/2,nrow(SelData)),labels=c('Thu','Fri','Sat'))
#plot (b)
with(SelData,plot(Sub_metering_1,type="l",xaxt='n',xlab="",ylab="Energy sub metering"))
with(SelData,lines(Sub_metering_2,type='l',col='red'))
with(SelData,lines(Sub_metering_3,type='l',col='blue'))
legend("topright",col=c('black','red','blue'),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),lty=1,bty="n")
axis(1,at=c(1,nrow(SelData)/2,nrow(SelData)),labels=c('Thu','Fri','Sat'))
#plot (c)
with(SelData,plot(Voltage,type="l",xaxt='n',xlab='datetime',ylab="Voltage"))
axis(1,at=c(1,nrow(SelData)/2,nrow(SelData)),labels=c('Thu','Fri','Sat'))
#plot (d)
with(SelData,plot(Global_reactive_power,type="l",xaxt='n',xlab='datetime'))
axis(1,at=c(1,nrow(SelData)/2,nrow(SelData)),labels=c('Thu','Fri','Sat'))
dev.off()
