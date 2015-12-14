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

## Plot histogram of global active power
png(filename="./figure/plot1.png", width = 480, height = 480)
hist(as.numeric(proj_data$Global_active_power), xlab = "Global Active Power (kilowatts)", 
     main = paste("Global Active Power"), col="red")
dev.off()
