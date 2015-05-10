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
  
  ##return(cachedPowerData)
  
}


loadPowerData <- function() {
  
  
  powerData <- read.csv2("exdata-data-household_power_consumption/household_power_consumption.txt", nrows = -1, colClasses = "character", na.strings = "?")
  
  if (!nrow(powerData)) {
    error("No data read from file")
  }
  
  ## powerData2 <- powerData[powerData$Date == "1/2/2007" || powerData$Date == "2/2/2007",]
  
  powerData2 <- powerData[powerData$Date == "1/2/2007",]
  powerData3 <- powerData[powerData$Date == "2/2/2007",]
  
  pData <- rbind(powerData2,powerData3)
  ## pData <- powerData  ## uncomment afterwards
  
  dateList <- paste(pData$Date, pData$Time)
  
  
  ##dTime <- strptime("16/12/2006 17:40:00",format = "%d/%m/%Y %H:%M:%S")
  ##timeClass <- class(strptime("01/02/2007 17:40:00",format = "%d/%m/%Y %H:%M:%S"))
  
  ## my.XYZ$datetime<- as.POSIXct(myXYZ$datetime, format = "%Y-%m-%d %H:%M:%S")
  
  
  ## dateStructs <- vapply(dateList, strptime, format = "%d/%m/%Y %H:%M:%S")
  ##d <- matrix(data=dateStructs,ncol=1)
  
  ##colnames(d) <- "DateAndTime"
  
  ## pData2 <- cbind(pData,d, stringsAsFactors=FALSE)
  ##pData3 <- pData
  
  ## transform columns 3:9
  for (i in 3:9) { pData[,i] <- as.numeric(pData[,i])}
  
  # myColNames <- colnames(pData3[3:9])
  # 
  # for (myCol in myColNames) {
  #   print (paste("myCol:", myCol))
  #   pData3 <- transform(pData3,myCol = as.numeric(myCol))
  # }
  ##pData3 <- transform(pData,Global_active_power = as.numeric(Global_active_power))
  
  ##hist(pData3$Global_active_power, freq = TRUE, col = "red", main = "Global Active Power", 
  ##    xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  
  ##pData3 <- pData3[1:20,]
  
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
  ##plot(pDate3$DateAndTime,pData3$Global_active_power)
  
}

## return the weekday arguments for axis 
getWeekdayTicks <- function() {
  
  day1 <- as.POSIXct(strptime("1/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S"))
  day2 <- as.POSIXct(strptime("2/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S"))
  day3 <- as.POSIXct(strptime("3/2/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S"))

  weekDays <- weekdays(c(day1,day2,day3))
  
  retList <-list(c(day1,day2,day3), weekdays(c(day1,day2,day3)))
}
