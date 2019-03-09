library(tidyr)

X <- read.table('household_power_consumption.txt')

col_names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

X <- separate(X, V1, col_names, sep = ";")

X <- X[2:nrow(X),]

X <- subset(X, Date == "1/2/2007"| Date == "2/2/2007")

for (i in c(3:9)){X[,i] <- as.numeric(X[,i])}

png("plot2.png")
plot(c(1:nrow(X)), X$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", axes=FALSE)
axis(2, c(0,2,4,6,8))
axis(1, at=c(0,1500,2880), labels=c('Thu','Fri','Sat'))
box()
dev.off()
