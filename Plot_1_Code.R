#reading full data
my_data <- read.csv("household_power_consumption.txt",sep=";",header=T)

#creating subset data
subset <-subset(my_data,my_data$Date =="1/2/2007" | my_data$Date =="2/2/2007")

#converting variable into numeric
subset$Global_active_power <- as.numeric((as.character(subset$Global_active_power)))
subset$Global_reactive_power<- as.numeric((as.character(subset$Global_reactive_power)))
subset$Voltage<- as.numeric((as.character(subset$Voltage)))
subset$Sub_metering_1<- as.numeric((as.character(subset$Sub_metering_1)))
subset$Sub_metering_2<- as.numeric((as.character(subset$Sub_metering_2)))

#creating plot-1
hist(subset$Global_active_power, col="Red",
	  xlab="Global Active Power (kilowatts)",
	  main="Global Active Power")

#creating local png copy of plot-1
dev.copy(png,file="plot1.png")
dev.off()

