plot4 <- function() {
        
        ## Read part of the original dataset that including Feb. 1st and Feb. 2nd 
        wd <- getwd()
        filedir <- paste(wd, "household_power_consumption.txt", sep = "/")
        FebData <- read.csv(filedir, sep=";", na.strings="?", stringsAsFactors=FALSE, skip = 66636, nrows = 2880)
        head <- read.csv(filedir, sep=";", na.strings="?", stringsAsFactors=FALSE, skip = 0, nrows = 1, header = FALSE)
        names(FebData) <- head
        
        ## Change the format of Date and Time
        FebData$Time <- paste(FebData$Date, FebData$Time, sep = " ")
        FebData$Time <- strptime(FebData$Time, "%d/%m/%Y %H:%M:%S")
        
        ## Open a png graphic device
        png('plot4.png')
        
        ## Define layout and background
        par(mfcol = c(2,2), bg = "transparent")
        
        ## Plot1, Hist freq
        hist(FebData$Global_active_power, freq = TRUE, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
        plot(FebData$Time, FebData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
                lines(FebData$Time, FebData$Sub_metering_2,type = "l", col = "red")
                lines(FebData$Time, FebData$Sub_metering_3,type = "l", col = "blue")
                legend("topright", lty = 1, col = c("black","red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(FebData$Time, FebData$Voltage, xlab = "daytime", ylab = "voltage", type = "l")
        plot(FebData$Time, FebData$Global_reactive_power, xlab = "daytime", ylab = "Global_reactive_power", type = "l")
        
        ## Close png device
        dev.off()
        
        print("Plotted")        
}
