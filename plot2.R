dat <- read.csv2("exdata_data_household_power_consumption/household_power_consumption.txt",
                 skip=66636,nrows=2880,
                 colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                "numeric","numeric","numeric"),dec=".")
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dat <- transform(dat, Date=strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
png(file="plot2.png")
with(dat, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()