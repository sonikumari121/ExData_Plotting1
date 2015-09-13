# Plot 1
#COde for loading data
unzip("exdata-data-household_power_consumption.zip")
power_cons_data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("character","character","numeric", "numeric","numeric", "numeric", "character","character","character"))
power_cons_data$Time<-paste(power_cons_data$Date,power_cons_data$Time)
power_cons_data$Time<-strptime(power_cons_data$Time, "%d/%m/%Y %H:%M:%S")
power_cons_data$Date<-as.Date(power_cons_data$Date,"%d/%m/%Y")
new_power_cons_data<-subset(power_cons_data,power_cons_data$Date=="2007-02-01"| power_cons_data$Date=="2007-02-02")

#code for Plot2
png(file = "Plot1.png")
hist(new_power_cons_data$Global_active_power,  col="Red",main="Global Active power",xlab="Global Active Power(Kilowatts)")
dev.off()