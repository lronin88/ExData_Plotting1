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
## Plot first graph and save it as a png file called plot1.png
png("plot1.png", 480, 480)
hist(as.numeric(SelData$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
