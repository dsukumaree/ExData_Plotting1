## plot4.R - Reads data from household_power_consumption.txt in the working directory and creates a plot, which is then written into plot4.png

## read data from source 
household_power <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
household_power$Date <- as.Date(household_power$Date, "%d/%m/%Y")
## subset data for required date
household_power_sub <- household_power[(household_power$Date >= "2007-02-01" & household_power$Date <= "2007-02-02"),]
## add date component to time
household_power_sub$Time <- strptime(paste(household_power_sub$Date ,household_power_sub$Time), "%Y-%m-%d %H:%M:%S")
## Create plot4.png
png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2, 2), mar = c(6, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(household_power_sub$Time, household_power_sub$Global_active_power, type = "l", ylab = "Global Active Power", xlab="" )
plot(household_power_sub$Time, household_power_sub$Voltage, type = "l", ylab = "Voltage", xlab="datetime" )
plot(household_power_sub$Time, household_power_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="" )
points(household_power_sub$Time,household_power_sub$Sub_metering_2, col="red", type = "l")
points(household_power_sub$Time,household_power_sub$Sub_metering_3, col="blue", type = "l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
plot(household_power_sub$Time, household_power_sub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime" )
dev.off()
