plot1 <- function() {
        
        ## Read part of the original dataset that including Feb. 1st and Feb. 2nd 
        wd <- getwd()
        filedir <- paste(wd, "household_power_consumption.txt", sep = "/")
        FebData <- read.csv(filedir, sep=";", na.strings="?", stringsAsFactors=FALSE, skip = 66636, nrows = 2880)
        head <- read.csv(filedir, sep=";", na.strings="?", stringsAsFactors=FALSE, skip = 0, nrows = 1, header = FALSE)
        names(FebData) <- head
        
        ## Change the format of Date and Time
        as.Date(FebData$Date, format = "%d/%m/%Y")
        FebData$Time <- paste(FebData$Date, FebData$Time, sep = " ")
        strptime(FebData$Time, "%d/%m/%Y %H:%M:%S")
        
        ## Open a png graphic device
        png('plot1.png')
        
        ## Plot1, Hist freq
        par(bg = "transparent")
        hist(FebData$Global_active_power, freq = TRUE, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
        
        ## Close png device
        dev.off()
        
        print("Plotted")        
}
