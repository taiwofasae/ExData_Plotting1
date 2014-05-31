dat <- read.csv2("exdata_data_household_power_consumption/household_power_consumption.txt",
                 skip=66636,nrows=2880,
                 colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                "numeric","numeric","numeric"),dec=".")
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dat <- transform(dat, datetime=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
png(file="plot4.png")
par(mfcol= c(2,2))
with(dat, {
        plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(datetime, Sub_metering_2, col="red")
        lines(datetime, Sub_metering_3, col="blue")
        legend("topright", lwd=1, col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(datetime, Voltage, type="l")
        plot(datetime, Global_reactive_power, type="l")
})
dev.off()