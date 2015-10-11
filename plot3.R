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
SubMeter1 <- as.numeric(data$Sub_metering_1)
SubMeter2 <- as.numeric(data$Sub_metering_2)
SubMeter3 <- as.numeric(data$Sub_metering_3)

#Creates the png without putting anything in it
png("plot3.png", width=480, height=480)

#Plots the data
plot(data$Datetime, SubMeter1, type="l", ylab="Energy Submetering", xlab="")
#Adds the next series
lines(data$Datetime, SubMeter2, type="l", col="red")
#Adds the last series
lines(data$Datetime, SubMeter3, type="l", col="blue")
#Adds the legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Turns off the graphics device
dev.off()