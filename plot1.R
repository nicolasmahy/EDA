setwd('C:/Users/n.mahy/AppData/Local/Programs/Python/Python36/Data analyse/Coursera')

df <- read.csv('household_power_consumption.txt', sep=';', 
colClasses=c('character','character','double','double','double','double','double','double','double'),
na.strings=c('?'))

df$Date_format <- strptime(df$Date, "%d/%m/%Y")

df_subset <- subset(df, Date_format == '2007-02-01 CET' | Date_format == '2007-02-02 CET')

head(df_subset)

hist(df_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", breaks=15)

dev.copy(png,'plot1.png', width=480, height=480)

dev.off()
