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

## Plot with different groups
png(filename="./figure/plot3.png", width = 480, height = 480)
with(proj_data, plot(b,Sub_metering_1,type="l",ylab="Ozone", xlab=''))
with(proj_data, lines(b,Sub_metering_2,col="red"))
with(proj_data, lines(b,Sub_metering_3,col="blue"))
legend("topright", pch="_",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()