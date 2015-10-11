#Reads the data in from its location
data<-read.table("C:/Users/RDUKTRADING/Documents/R/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Formats the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the data to get the required days
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Merges the time and date into one and then casts
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Sets all the fields to graph as numeric
APower <- as.numeric(data$Global_active_power)
RPower <- as.numeric(data$Global_reactive_power)
volts <- as.numeric(data$Voltage)
SubMeter1 <- as.numeric(data$Sub_metering_1)
SubMeter2 <- as.numeric(data$Sub_metering_2)
SubMeter3 <- as.numeric(data$Sub_metering_3)

#Creates the png without putting anything in it
png("plot4.png", width=480, height=480)

#Sets up the canvas with the four graphs in a two by two form
par(mfrow = c(2, 2)) 

#Plots the power graph first (Active power)
plot(data$Datetime, APower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plots the voltage graph next
plot(data$Datetime, volts, type="l", xlab="datetime", ylab="Voltage")

#Plots the Energy sub meter reading graph (similar to plot 3)
plot(data$Datetime, SubMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(data$Datetime, SubMeter2, type="l", col="red")
lines(data$Datetime, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Finally plots the Global reactive power graph
plot(data$Datetime, RPower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Turns off the graphs device
dev.off()