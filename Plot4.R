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

# Matrix 2 by 2
par(mfrow = c ( 2, 2) )

# Plot 2
plot ( hpc.DateTime , hpc[["Global_active_power"]] , type = "l" , ylab = "Global Active Power" , xlab = "")

# Voltage
plot ( hpc.DateTime , hpc[["Voltage"]] , type = "l" , ylab = "Voltage", xlab = "Date & Time")

# Plot 3 -- without border in legend!
plot ( hpc.DateTime , hpc[["Sub_metering_1"]], type = "l" , ylab = "Energy sub metering" , xlab = "" )
lines( hpc.DateTime , hpc[["Sub_metering_2"]], col = "red", type = "l" , ylab = "", xlab = "" )
lines( hpc.DateTime , hpc[["Sub_metering_3"]], col = "blue", type = "l" , ylab = "", xlab = "" )
legend ( "topright", legend = c ( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ( "black", "red", "blue" ), box.lty = 0 )

# Reactive Power
plot ( hpc.DateTime , hpc[["Global_reactive_power"]] , type = "l" , ylab = "Global Reactive Power", xlab = "Date & Time" )
