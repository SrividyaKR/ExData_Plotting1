#Plot1.R
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./file.zip")
unzip("./file.zip")
df<-read.table("./household_power_consumption.txt",header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?")
dmy_hms<-paste(df$Date," ", df$Time)
df$dmy_hms<-strptime(dmy_hms, format = "%d/%m/%Y %H:%M:%S")
subdf<-df[strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")<df$dmy_hms & df$dmy_hms<strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"),]

png("./plot1.png", width = 480, height = 480, units = "px")
hist(subdf$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

