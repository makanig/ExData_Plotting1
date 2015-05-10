## plot 2
##
##

## Usage: 
## p <- getPowerData() 
## plot1(p$get())
## plot2ToFile(p$get())
## plot2(p$get())

plot2ToFile <- function(pData) {
  
  png(filename="plot2.png")
  message("Creating plot2 to file")
  plot2(pData)
  dev.off()
}


plot2 <- function(pData) {
  
  myTickData <- getWeekdayTicks()
  
  plot(pData$DateAndTime,pData$Global_active_power, type = "n", main = "", 
       xlab = "", ylab = "Global Active Power(kilowatts)", xaxt="n")

  axis(1,at=myTickData[[1]], labels=myTickData[[2]])
  lines(pData$DateAndTime,pData$Global_active_power)
}