setwd('C:/Users/n.mahy/AppData/Local/Programs/Python/Python36/Data analyse/Coursera')

df <- read.csv('household_power_consumption.txt', sep=';', 
colClasses=c('character','character','double','double','double','double','double','double','double'),
na.strings=c('?'))

df$Date_format <- strptime(df$Date, "%d/%m/%Y")
df$Time_format <- strptime(df$Time, "%H:%M:%OS")
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

df_subset <- subset(df, Date_format == '2007-02-01 CET' | Date_format == '2007-02-02 CET')

plot(df_subset$datetime, df_subset$Global_active_power, type = "l", lty = 1, xlab='', ylab='Global Active Power (kilowatts)')

dev.copy(png,'plot2.png', width=480, height=480)
dev.off()
