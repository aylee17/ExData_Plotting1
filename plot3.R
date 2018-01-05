# Download the file
if(!file.exists("household_power_consumption.txt")) {
        fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileurl, "HouseholdData.zip")
}

# Unzip the file
unzip("HouseholdData.zip")

# Read the data, convert time and dates
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings= "?")

# Subset data for dates between 2007-02-01 and 2007-02-02
feb <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
datetime <- as.POSIXct(strptime(paste(feb$Date, feb$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

# Plot data and create png
png("plot3.png", width=480, height=480)
plot(datetime, feb$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, feb$Sub_metering_2, col="red")
lines(datetime, feb$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), cex=0.8)
dev.off()