library(tidyr)

X <- read.table('household_power_consumption.txt')

col_names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

X <- separate(X, V1, col_names, sep = ";")

X <- X[2:nrow(X),]

X <- subset(X, Date == "1/2/2007"| Date == "2/2/2007")

for (i in c(3:9)){X[,i] <- as.numeric(X[,i])}

png("plot1.png")
hist(X$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
