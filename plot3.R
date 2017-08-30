### Exploratory Data Analysis, Week 1, Course Project
# Script for plot3.png

# Set working directory to the directory where the data has been saved
setwd("./Data/")

# Load needed data into R (observations between 2017-02-01 and 2017-02-02), set column names and check for missing values
mydata <- read.table("./household_power_consumption.txt", sep = ";", skip=66637,nrows=2880)
colnames(mydata) <- colnames(read.table("./household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE))
sum(is.na(mydata)) # No NAs

# Merge data and time variable into one variable
datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
mydata <- cbind(datetime, mydata)

# Create plot 3
png("plot3.png", width = 480, height = 480)
plot(mydata$datetime, mydata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(mydata$datetime, mydata$Sub_metering_1, col = "black")
lines(mydata$datetime, mydata$Sub_metering_2, col = "red")
lines(mydata$datetime, mydata$Sub_metering_3, col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()