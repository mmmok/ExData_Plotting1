library(dplyr)
library(tidyr)

FILE_NAME = 'household_power_consumption.txt'

df = read.csv(FILE_NAME, sep = ';', na.strings = '?') %>%
    subset(Date %in% c('1/2/2007', '2/2/2007')) %>%
    unite(datetime_str, Date, Time, remove = FALSE) %>%
    transform(datetime = strptime(datetime_str, '%d/%m/%Y_%H:%M:%S'))

png('plot2.png')

plot(df$datetime, df$Global_active_power, type = 'l', xlab = '',
     ylab = 'Global Active Power (kilowatts)')

dev.off()
