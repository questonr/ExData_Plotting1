# STEP 1 - Get data

data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# STEP 2 - Subsetting the data

data <- subset(data_full, subset=(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))
rm(data_full)

# STEP 3 - Converting dates

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# STEP 4 - Generate the plot

png("plot3.png", height=480, width=480)
with(data, {
  plot(Datetime, Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Datetime, Sub_metering_2, col='Red')
  lines(Datetime, Sub_metering_3, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()