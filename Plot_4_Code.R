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

#converting date variable into date type
subset$Date <- as.Date(subset$Date,format = "%d/%m/%Y")

#creating new combine column of data & time
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2,2))

with(subset, {
	plot(Datetime,Global_active_power, type = "l", 
	ylab = "Global Active Power", xlab = "")

	plot(Datetime,Voltage, type = "l", 
	ylab = "Voltage", xlab = "datetime")

	plot(Datetime,Sub_metering_1, type = "l", 
	ylab = "Energy sub metering",xlab = "")
	
	lines(Sub_metering_2 ~ Datetime, col = 'Red')
	lines(Sub_metering_3 ~ Datetime, col = 'Blue')
	legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
             bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

	plot(Datetime,Global_reactive_power, type = "l", 
	ylab = "Global_rective_power", xlab = "datetime")
})

#creating local png copy
dev.copy(png,file="plot4.png")
dev.off()
