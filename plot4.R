## plot 4
##
##

## Usage: 
## p <- getPowerData() 
## plot1(p$get())
## plot4(p$get())
##

plot4ToFile <- function(pData) {
  
  png(filename="plot4.png")
  message("Creating plot4 to file")
  plot4(pData)
  dev.off()
}

plotVoltage <- function(pData) {
  myTickData <- getWeekdayTicks()
  
  plot(pData$DateAndTime,pData$Voltage, type = "n", main = "", 
       xlab = "", ylab = "Voltage", xaxt="n")
  
  axis(1,at=myTickData[[1]], labels=myTickData[[2]])
  lines(pData$DateAndTime,pData$Voltage)  
}

plotGlobalReactivePower <- function(pData) {
  myTickData <- getWeekdayTicks()
  
  plot(pData$DateAndTime,pData$Global_reactive_power, type = "n", main = "", 
       xlab = "", ylab = "Global_reactive_power", xaxt="n")
  
  axis(1,at=myTickData[[1]], labels=myTickData[[2]])
  lines(pData$DateAndTime,pData$Global_reactive_power)  
}




plot4 <- function(pData) {
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  plot2(pData)
  plotVoltage(pData)
  plot3(pData)
  plotGlobalReactivePower(pData)
}
  
  