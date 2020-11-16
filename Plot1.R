library(sqldf)
hpc <- read.csv.sql(
    file="household_power_consumption.txt",
    header = TRUE,
    sep=";",
    stringsAsFactors = FALSE,
    sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'")

# plot histogram for "Global Active Power"
hist( hpc[["Global_active_power"]], main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red" )

# optionally, for a high-resolution display, magnify some elements by using "cex"
#hist( hpc[["Global_active_power"]], main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red" , cex.lab = 1.4, cex.main = 1.7, cex.axis = 1.4  )

# copy plot to a PNG file
dev.copy ( png, file = "plot1.png" )
