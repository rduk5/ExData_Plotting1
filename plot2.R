#Reads the data in from its location
data<-read.table("C:/Users/RDUKTRADING/Documents/R/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Formats the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the data to get the required days
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Merges the time and date into one and then casts
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Creates the png without putting anything in it
png("plot2.png", width=480, height=480)

#Plots the data
plot(data$Datetime,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

#Turns off the graphics device
dev.off()