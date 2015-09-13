#plot 3

#COde for loading data
unzip("exdata-data-household_power_consumption.zip")
power_cons_data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("character","character","numeric", "numeric","numeric", "numeric", "character","character","character"))
power_cons_data$Time<-paste(power_cons_data$Date,power_cons_data$Time)
power_cons_data$Time<-strptime(power_cons_data$Time, "%d/%m/%Y %H:%M:%S")
power_cons_data$Date<-as.Date(power_cons_data$Date,"%d/%m/%Y")
new_power_cons_data<-subset(power_cons_data,power_cons_data$Date=="2007-02-01"| power_cons_data$Date=="2007-02-02")

#code for Plot3


png(file = "Plot3.png")
par(mar=c(6,4,2,2))
plot (new_power_cons_data$Time, new_power_cons_data$Sub_metering_1, type="n",xlab="",ylab="",ylim=c(0,40))
title(ylab="Energy sub metering")
lines(new_power_cons_data$Time,new_power_cons_data$Sub_metering_1, type="l",  col="black")
lines(new_power_cons_data$Time,new_power_cons_data$Sub_metering_2, type="l",  col="red")
lines(new_power_cons_data$Time,new_power_cons_data$Sub_metering_3, type="l",  col="blue")
legend("topright",c("Sun_metering_1","Sun_metering_2","Sun_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=2,cex=1)
dev.off()