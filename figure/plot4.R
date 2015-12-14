## Set path and read in data
setwd("/Users/sshen/Courses/ex_data/ExData_Plotting1")
hpc <- read.csv("./household_power_consumption.txt", sep=";",as.is=T)

## Date value
date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Date <- date

## Subset
set1 <- subset(hpc, Date==as.Date("2007-02-01"))
set2 <- subset(hpc, Date==as.Date("2007-02-02"))
proj_data <- rbind(set1, set2)

## Time formatting
a <- paste(proj_data$Date, proj_data$Time)
b <- strptime(a, "%Y-%m-%d %H:%M:%S")

## Set 2x2 figures
png(filename="./figure/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(b, as.numeric(proj_data$Global_active_power), type="l",
     ylab="Global Action Power (kilowatts)", xlab='')
plot(b,as.numeric(proj_data$Voltage), ylab="Voltage",type="l", xlab="datetime")
with(proj_data, plot(b,Sub_metering_1,type="l",ylab="Ozone", xlab=''))
with(proj_data, lines(b,Sub_metering_2,col="red"))
with(proj_data, lines(b,Sub_metering_3,col="blue"))
legend("topright", pch="_",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(b, as.numeric(proj_data$Global_reactive_power), type="l", xlab='', ylab="Global_reactive_power")
dev.off()