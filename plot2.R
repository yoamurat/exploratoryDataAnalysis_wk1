data <- read.csv("household_power_consumption.txt", sep=";")
sub1 <- data$Date == "1/2/2007"
sub2 <- data$Date == "2/2/2007"

dataseg1 <- subset(data, sub1)
seg2 <- subset(data, sub2)

data <- rbind(seg1,seg2)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))


data$Date <- paste(data$Date,data$Time)
data$Time <- NULL
data$Date <- strptime(data$Date, format="%d/%m/%Y %H:%M:%S")



par(mar=c(3.1,5.1,1.1,1.1))
plot(y=data$Global_active_power, x=data$Date, xlab=NULL, ylab ="Global Active Power (kilowatts)", col="white", xaxt="n")


date1 <- data$Date[1]
date3 <- date1 + 2*86400
axis(1, at= seq(date1, date3, by=86400), labels=c("Thu", "Fri", "Sat"), las=1)

lines(x=data$Date, y=data$Global_active_power)
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

