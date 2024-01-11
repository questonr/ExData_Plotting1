# STEP 1 - Get data

data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# STEP 2 - Subsetting the data

data <- subset(data_full, subset=(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))
rm(data_full)

# STEP 3 - Converting dates

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# STEP 4 - Generate the histogram

# Ensure Global_active_power is numeric and contains no NA values
data$Global_active_power <- as.numeric(data$Global_active_power)
data <- subset(data, !is.na(data$Global_active_power))

# Open PNG device
png("plot1.png", width=480, height=480)

# Create histogram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close PNG device
dev.off()
