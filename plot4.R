library(tidyr)

X <- read.table('household_power_consumption.txt')

col_names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

X <- separate(X, V1, col_names, sep = ";")

X <- X[2:nrow(X),]

X <- subset(X, Date == "1/2/2007"| Date == "2/2/2007")

for (i in c(3:9)){X[,i] <- as.numeric(X[,i])}

png("plot4.png")
par(mfrow=c(2,2))
plot(c(1:nrow(X)), X$Global_active_power, type="l", xlab="", ylab="Global Active Power", axes=FALSE, cex.lab=0.8)
axis(2, c(0,2,4,6,8), cex.axis=0.8)
axis(1, at=c(0,1500,2880), labels=c('Thu','Fri','Sat'), cex.axis=0.8)
box()
plot(c(1:nrow(X)), X$Voltage, type="l", xlab="datetime", ylab="Voltage", axes=FALSE, cex.lab=0.8)
axis(2, c(234,238,242,246), cex.axis=0.8)
axis(1, at=c(0,1500,2880), labels=c('Thu','Fri','Sat'), cex.axis=0.8)
box()
plot(c(1:nrow(X)), X$Sub_metering_1, type='l', axes=FALSE, xlab="", ylab="Energy sub metering", cex.lab=0.8)
lines(c(1:nrow(X)), X$Sub_metering_2, type='l', col="red")
lines(c(1:nrow(X)), X$Sub_metering_3, type='l', col="blue")
axis(2, c(0,10,20,30), cex.axis=0.8)
axis(1, at=c(0,1500,2880), labels=c('Thu','Fri','Sat'), cex.axis=0.8)
box()
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.7, box.lty=0)
plot(c(1:nrow(X)), X$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", axes=FALSE, cex.lab=0.8)
axis(2, c(0.0,0.1,0.2,0.3,0.4,0.5), cex.axis=0.8)
axis(1, at=c(0,1500,2880), labels=c('Thu','Fri','Sat'), cex.axis=0.8)
box()
dev.off()
