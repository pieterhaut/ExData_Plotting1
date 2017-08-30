### Exploratory Data Analysis, Week 1, Course Project
# Script for plot1.png

# Set working directory to the directory where the data has been saved
setwd("./Data/")

# Load needed data into R (observations between 2017-02-01 and 2017-02-02), set column names and check for missing values
mydata <- read.table("./household_power_consumption.txt", sep = ";", skip=66637,nrows=2880)
colnames(mydata) <- colnames(read.table("./household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE))
sum(is.na(mydata)) # No NAs

# Create plot 1
png("plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()