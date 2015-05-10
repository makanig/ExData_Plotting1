## plot 3
##
##

## Usage: 
## p <- getPowerData() 
## plot1(p$get())
## plot2(p$get())


plot3ToFile <- function(pData) {
  
  png(filename="plot3.png")
  message("Creating plot3 to file")
  plot3(pData)
  dev.off()
}
  
plot3 <- function(pData) {
  
  myTickData <- getWeekdayTicks()
  
  plot(pData$DateAndTime,pData$Sub_metering_1,type = "n", main = "", 
       xlab = "", ylab = "Energy Sub Metering", xaxt="n")
  
  axis(1,at=myTickData[[1]], labels=myTickData[[2]])
  
  lines(pData$DateAndTime,pData$Sub_metering_1,col="black", type="l", lty=1)
  lines(pData$DateAndTime,pData$Sub_metering_2,col="red", type="l", lty=1)
  lines(pData$DateAndTime,pData$Sub_metering_3,col="blue", type="l", lty=1)
  
  lVector <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend(x="topright", legend=lVector, lty=1, col=c("black","red","blue"), cex=0.5)  
}
