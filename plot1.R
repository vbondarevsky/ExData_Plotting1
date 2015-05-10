#assume the database file located at working directory

colNames = c("Date", "Time", "Global_active_power", "Global_reactive_power",
             "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
             "Sub_metering_3")
colClasses = c("character", "character", rep("numeric", 7) )

#read file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                 col.names = colNames, colClasses = colClasses, na.strings = "?")

#convert to Date type, then filter
df$Date = as.Date(df$Date, format = "%d/%m/%Y")
df = df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

#plot and save graph
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()