download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./file.zip")
unzip("./file.zip")
df<-read.table("./household_power_consumption.txt",header = TRUE, sep =";", stringsAsFactors = FALSE, na.strings = "?")
dmy_hms<-paste(df$Date," ", df$Time)
df$dmy_hms<-strptime(dmy_hms, format = "%d/%m/%Y %H:%M:%S")
subdf<-df[strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")<df$dmy_hms & df$dmy_hms<strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"),]



png("./plot3.png", width = 480, height = 480, units = "px")
plot(subdf$Sub_metering_1, type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = "")
lines(subdf$Sub_metering_2, type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = "", col="red")
lines(subdf$Sub_metering_3, type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = "", col="blue")
labels<-c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
legend("topright",labels, lwd=1,col = c("black","red","blue"))
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri", "Sat"))
dev.off()


