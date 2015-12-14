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

## Plot time vs. global active power
png(filename="./figure/plot2.png", width = 480, height = 480)
plot(b, as.numeric(proj_data$Global_active_power), type="l",
     ylab="Global Action Power (kilowatts)", xlab='')
dev.off()
