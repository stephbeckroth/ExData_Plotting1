# This R script was developed for Project 1 in the
# Exploratory Data Analysis Course through Coursera
# Author: Stephanie R. Beck Roth
# Date:   July 12, 2015
#
# Purpose:  This program will generate plots to
# examine energy usage on 2/1/2007 and 2/2/2007
# using the Electric Power Consumption Dataset
# available at UC Irvine Machine Learning Repository.

# File Containing Data stored to fileUrl
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Pixel Height and Width of Output
pixheight <- 480
pixwidth <- 480

# Sets Start and End Dates of Interest
startdate <- "1/2/2007"
enddate <- "2/2/2007"

# Make a Data directory if one doesn't exist
if (!file.exists("../Data"))
    dir.create("../Data")

# Stored File Name
fn <- "../Data/FHpowercons.zip" 

# Download file and store to table w/subset of table in datasub by dates
download.file(fileUrl, fn, method="curl")
dataDownloaded <- date()
mydata <- read.table(unzip(fn, exdir = "../Data"), header = TRUE,
                   na.strings="?", sep = ";", stringsAsFactors = FALSE)
datasub <- subset(mydata, Date==startdate | Date==enddate)

# Combine Date and Time and store to a new variable
newdate <- strptime(paste(datasub$Date, datasub$Time, sep = " "), 
                    format="%d/%m/%Y %H:%M:%S", tz="")

#Make Plot 1
par(mar=c(4,4,2,2),bg="transparent")
png(filename = "plot1.png", width = 480, height = 480,
    units = "px")
hist(datasub$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", plot=TRUE)
dev.off()