## Exploratory Data Analysis - Project 1



getPowerData <- function() {
  
  cachedPowerData <- NULL  ## stored inverse
  set <- function(powerData) {
    cachedPowerData <<- powerData
  }
  get <- function() {
    if(!is.null(cachedPowerData)) {
      message("getting cached data")
      return(cachedPowerData)
    }
    cachedPowerData <<- loadPowerData()
  }
  
  list(set = set, get = get)
  
}


loadPowerData <- function() {
  
  
  powerData <- read.csv2("exdata-data-household_power_consumption/household_power_consumption.txt", nrows = -1, colClasses = "character", na.strings = "?")
  
  if (!nrow(powerData)) {
    error("No data read from file")
  }
  
  ## need to combine this in one line

  powerData2 <- powerData[powerData$Date == "1/2/2007",]
  powerData3 <- powerData[powerData$Date == "2/2/2007",]
  
  pData <- rbind(powerData2,powerData3)
  
  
  dateList <- paste(pData$Date, pData$Time)
  
  
  ## transform columns 3:9
  for (i in 3:9) { pData[,i] <- as.numeric(pData[,i])}
  
  dateList <- paste(pData$Date, pData$Time)
  dateList <- matrix(dateList, ncol=1)
  colnames(dateList) <- "DateAndTime"
  
  cTimeToPlot <- c()
  
  for (d in dateList) {
    ##print (paste("d:", d))
    t <- as.POSIXct(strptime(d, format = "%d/%m/%Y %H:%M:%S"))
    ##print (paste("t:", t))
    cTimeToPlot <- c(cTimeToPlot,t)
    
  }
  dateList <- matrix(cTimeToPlot, ncol=1)
  colnames(dateList) <- "DateAndTime"
  pData <- cbind(pData, dateList)
  pData
}

## return the weekday arguments for axis 
getWeekdayTicks <- function() {
  
  day1 <- as.POSIXct(strptime("1/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S"))
  day2 <- as.POSIXct(strptime("2/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S"))
  day3 <- as.POSIXct(strptime("3/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S"))

  weekDays <- weekdays(c(day1,day2,day3))
  
  retList <-list(c(day1,day2,day3), weekdays(c(day1,day2,day3)))
}
