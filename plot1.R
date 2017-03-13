data <- read.csv("household_power_consumption.txt", sep=";")
sub1 <- data$Date == "1/2/2007"
sub2 <- data$Date == "2/2/2007"


dataseg1 <- subset(data, sub1)
seg2 <- subset(data, sub2)

data <- rbind(seg1,seg2)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", yaxt="n")
axis(2, at= seq(0,1200, by=200), las=2)

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
