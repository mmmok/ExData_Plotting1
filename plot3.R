library(dplyr)
library(tidyr)

FILE_NAME = 'household_power_consumption.txt'

df = read.csv(FILE_NAME, sep = ';', na.strings = '?') %>%
    subset(Date %in% c('1/2/2007', '2/2/2007')) %>%
    unite(datetime_str, Date, Time, remove = FALSE) %>%
    transform(datetime = strptime(datetime_str, '%d/%m/%Y_%H:%M:%S'))

png('plot3.png')

plot(df$datetime, df$Sub_metering_1, type = 'l', xlab = '',
     ylab = 'Energy sub metering')
lines(df$datetime, df$Sub_metering_2, col = 'red')
lines(df$datetime, df$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2',
       'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)

dev.off()
