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
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(df, {
    plot(Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
    lines(x = Sub_metering_2, col = "red")
    lines(x = Sub_metering_3, col = "blue")
})
axis(1, at = c(1, as.integer(nrow(df) / 2), nrow(df)), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()