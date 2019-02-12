plot2 <- function() {
        
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
        png('plot2.png')
        
        ## Plot1, Hist freq
        xlab <- ""
        ylab <- "Global Active Power (kilowatts)"
        par(bg = "transparent")
        plot(FebData$Time[!is.na(FebData$Global_active_power)], FebData$Global_active_power[!is.na(FebData$Global_active_power)], xlab = xlab, ylab = ylab, type = "l")
        
        ## Close png device
        dev.off()
        
        print("Plotted")        
}
