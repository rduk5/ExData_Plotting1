
#Reads the data in from its location
data<-read.table("C:/Users/RDUKTRADING/Documents/R/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Formats the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset the data to get the required days
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Ensures the variable (Global_active_power) is numeric for plotting
Power <- as.numeric(data$Global_active_power)

#Creates the png without putting anything in it
png("plot1.png", width=480, height=480)

#Plots the data as a histogram
hist(Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Turns off the graphic device
dev.off()