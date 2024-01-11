# STEP 1 - Get data

data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# STEP 2 - Subset the data

data <- subset(data_full, subset=(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))
rm(data_full)

# STEP 3 - Convert dates

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# STEP 4 - Generate plot

png("plot2.png", height=480, width=480)
plot(data$Datetime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
