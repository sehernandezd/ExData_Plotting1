# If not set, setwd() to the directory containing the data file "household_power_consumption"
# setwd("coursera/Exploratory_Data_Analysis/data/")

# Import Dates of interest (by using the "sqldf" library)
library(sqldf)
hpc <- read.csv.sql(
    file="household_power_consumption.txt",
    header = TRUE,
    sep=";",
    stringsAsFactors = FALSE,
    sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'")

# prepare Date & Time
hpc.Date <- format ( strptime ( hpc[,1], "%d/%m/%Y" ) , usetz = FALSE )
hpc.DateTime <- paste ( hpc.Date, hpc[["Time"]] )
hpc.DateTime <- as.POSIXct(DateTime)

# plot histogram for "Energy sub metering"
plot ( hpc.DateTime , hpc[["Sub_metering_1"]], type = "l" , ylab = "Energy sub metering" , xlab = "" )
lines( hpc.DateTime , hpc[["Sub_metering_2"]], col = "red", type = "l" , ylab = "", xlab = "" )
lines( hpc.DateTime , hpc[["Sub_metering_3"]], col = "blue", type = "l" , ylab = "", xlab = "" )
legend ( "topright", legend = c ( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ( "black", "red", "blue" ) )


# optionally, for a high-resolution display, magnify some elements by using "cex"

# copy plot to a PNG file
dev.copy ( png, file = "plot3.png" )
