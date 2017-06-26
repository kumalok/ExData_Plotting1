#Course Directory
dir_local <- "exp_data_analysis_project1"
if(!file.exists(dir_local)){
	dir.create(dir_local)
}

#Set working directory
setwd(dir_local)

#download and extract data in working directory
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination_file <- "dataset.zip"
download.file(data_url, destfile = destination_file)
unzip(destination_file)

#load data
data <- read.table('household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")


# fetch data related to two days, using subset function - ?subset
data_temp <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# Convert class of Date variable from character to Date: 
data_temp$Date <- as.Date(data_temp$Date, format = "%d/%m/%Y")


# Combine Date and Time column and adding a new column named "DateTime":
data_temp$DateTime <- as.POSIXct(paste(data_temp$Date, data_temp$Time))
# draw plot3:
png("plot3.png", width = 480, height = 480)
plot(data_temp$DateTime, data_temp$Sub_metering_1, type="l",  ylab= "Energy sub metering", xlab="")
lines(data_temp$DateTime, data_temp$Sub_metering_2, type="l",  col="red")
lines(data_temp$DateTime, data_temp$Sub_metering_3, type="l",  col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
