setwd('C:/Users/n.mahy/AppData/Local/Programs/Python/Python36/Data analyse/Coursera')

df <- read.csv('household_power_consumption.txt', sep=';', 
colClasses=c('character','character','double','double','double','double','double','double','double'),
na.strings=c('?'))

df$Date_format <- strptime(df$Date, "%d/%m/%Y")
df$Time_format <- strptime(df$Time, "%H:%M:%OS")
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df_subset <- subset(df, Date_format == '2007-02-01 CET' | Date_format == '2007-02-02 CET')

par(mfrow=c(2,2))

plot(df_subset$datetime, df_subset$Global_active_power, type = "l", lty = 1, xlab='', ylab='Global Active Power')
plot(df_subset$datetime, df_subset$Voltage, type = "l", lty = 1, xlab='', ylab='Voltage')

plot(df_subset$datetime, df_subset$Sub_metering_1, type = "l", lty = 1, xlab='', ylab='Energy Sub Metering',col='black', lwd=2)
lines(df_subset$datetime,df_subset$Sub_metering_2,col='red')
lines(df_subset$datetime,df_subset$Sub_metering_3,col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black','blue','red'), lty=1, lwd=2)

plot(df_subset$datetime, df_subset$Global_reactive_power, type = "l", lty = 1, xlab='datetime', ylab='Global_reactive_power')

dev.copy(png,'plot4.png', width=480, height=480)

dev.off()
