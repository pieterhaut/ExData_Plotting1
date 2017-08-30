### Exploratory Data Analysis, Week 1, Course Project
# Script for plot4.png

# Set working directory to the directory where the data has been saved
setwd("./Data/")

# Load needed data into R (observations between 2017-02-01 and 2017-02-02), set column names and check for missing values
mydata <- read.table("./household_power_consumption.txt", sep = ";", skip=66637,nrows=2880)
colnames(mydata) <- colnames(read.table("./household_power_consumption.txt", sep = ";", nrows = 1, header = TRUE))
sum(is.na(mydata)) # No NAs

# Merge data and time variable into one variable
datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
mydata <- cbind(datetime, mydata)

# Set mfrow, and plot each of the four graphs in plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

      # First graph
      plot(mydata$datetime, mydata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
      lines(mydata$datetime, mydata$Global_active_power)
      
      # Second graph
      plot(mydata$datetime, mydata$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
      lines(mydata$datetime, mydata$Voltage)
      
      # Third graph
      plot(mydata$datetime, mydata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
      lines(mydata$datetime, mydata$Sub_metering_1, col = "black")
      lines(mydata$datetime, mydata$Sub_metering_2, col = "red")
      lines(mydata$datetime, mydata$Sub_metering_3, col = "blue")
      legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.9) #bty = "n" removes legend border
      
      # Fourth graph
      plot(mydata$datetime, mydata$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
      lines(mydata$datetime, mydata$Global_reactive_power, lwd = 0.5)
      
dev.off()
      
      
      
      