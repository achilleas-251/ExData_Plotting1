library(tidyr)

X <- read.table('household_power_consumption.txt')

col_names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

X <- separate(X, V1, col_names, sep = ";")

X <- X[2:nrow(X),]

X <- subset(X, Date == "1/2/2007"| Date == "2/2/2007")

for (i in c(3:9)){X[,i] <- as.numeric(X[,i])}

png("plot3.png")
plot(c(1:nrow(X)), X$Sub_metering_1, type='l', axes=FALSE, xlab="", ylab="Energy sub metering")
lines(c(1:nrow(X)), X$Sub_metering_2, type='l', col="red")
lines(c(1:nrow(X)), X$Sub_metering_3, type='l', col="blue")
axis(2, c(0,10,20,30))
axis(1, at=c(0,1500,2880), labels=c('Thu','Fri','Sat'))
box()
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()
