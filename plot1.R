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

# draw plot1:
png("plot1.png", width = 480, height = 480)
hist(data_temp$Global_active_power, main="Global Active Power",col='red', ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
