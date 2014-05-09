## plot1.R - Reads data from household_power_consumption.txt in the working directory and creates a plot, which is then written into plot1.png

## read data from source 
household_power <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
household_power$Date <- as.Date(household_power$Date, "%d/%m/%Y")
## subset data for required date
household_power_sub <- household_power[(household_power$Date >= "2007-02-01" & household_power$Date <= "2007-02-02"),]
## add date component to time
household_power_sub$Time <- strptime(paste(household_power_sub$Date ,household_power_sub$Time), "%Y-%m-%d %H:%M:%S")
## Create plot1.png
png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(household_power_sub$Global_active_power, col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()