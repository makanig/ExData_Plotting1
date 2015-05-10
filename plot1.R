## plot 1
##
##

## Usage: 
## p <- getPowerData() 
## plot1(p$get())
## plot2(p$get())

plot1ToFile <- function(pData) {
  
  png(filename="plot1.png")
  message("Creating plot1 to file")
  plot1(pData)
  dev.off()
}


plot1 <- function(pData) {

  hist(pData$Global_active_power, freq = TRUE, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
}