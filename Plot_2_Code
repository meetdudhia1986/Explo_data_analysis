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

#creating plot-2
plot(subset$Datetime ,subset$Global_active_power, 
type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#creating local png copy
dev.copy(png,file="plot2.png")
dev.off()

