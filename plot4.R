data <- read.csv("household_power_consumption.txt", sep=";")
sub1 <- data$Date == "1/2/2007"
sub2 <- data$Date == "2/2/2007"

dataseg1 <- subset(data, sub1)
seg2 <- subset(data, sub2)

data <- rbind(seg1,seg2)

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$Date <- paste(data$Date,data$Time)
data$Time <- NULL
data$Date <- strptime(data$Date, format="%d/%m/%Y %H:%M:%S")





par( mfrow = c(2,2),mar=c(4.1,4.1,1.1,1.1))

##Global Active Power

plot(y=data$Global_active_power, x=data$Date, xlab="", ylab ="Global Active Power", col="white", xaxt="n")


date1 <- data$Date[1]
date3 <- date1 + 2*86400
axis(1, at= seq(date1, date3, by=86400), labels=c("Thu", "Fri", "Sat"), las=1)

lines(x=data$Date, y=data$Global_active_power)


##Voltage
plot(y=data$Voltage, x=data$Date, ylab ="Voltage", xlab="datetime", col="white", xaxt="n")


date1 <- data$Date[1]
date3 <- date1 + 2*86400
axis(1, at= seq(date1, date3, by=86400), labels=c("Thu", "Fri", "Sat"), las=1)

lines(x=data$Date, y=data$Voltage)



##Energy sub metering
plot(y=data$Sub_metering_2, x=data$Date, ylab ="Energy sub metering", col="white", yaxt="n",xlab="", xaxt="n", ylim=c(0,38))
lines(x=data$Date, y=data$Sub_metering_1, col="black")
lines(x=data$Date, y=data$Sub_metering_2, col="red")
lines(x=data$Date, y=data$Sub_metering_3, col="blue")

date1 <- data$Date[1]
date3 <- date1 + 2*86400
axis(1, at= seq(date1, date3, by=86400), labels=c("Thu", "Fri", "Sat"), las=1)

axis(2, at= seq(0,30, by=10), las=1)


legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , bty='n',lty=1, col=c('black', 'blue', 'red'), cex=.75)

lines(x=data$Date, y=data$Global_active_power)

##Global Active Power

plot(y=data$Global_reactive_power, x=data$Date, xlab="datetime", ylab ="Global_reactive_power", col="white", xaxt="n", yaxt="n")


date1 <- data$Date[1]
date3 <- date1 + 2*86400
axis(1, at= seq(date1, date3, by=86400), labels=c("Thu", "Fri", "Sat"), las=1)

lines(x=data$Date, y=data$Global_reactive_power)

axis(2, at= seq(0.0,0.5, by=0.1), las=1)


dev.copy(png, "plot4.png", width=480, height=480)
dev.off()

