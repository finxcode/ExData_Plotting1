powerDat <- function(){
  ## Load package dplyr for data wrangling
  library(dplyr)
  
  ## Load Data from txt file which is manully unzipped, set value "?" to NA
  powerDat <- read.table("household_power_consumption.txt",header = TRUE,sep = ';'
                        ,na.strings = '?')
  
  ##First, select observations with date "1/2/2007"&"2/2/2007"; second, create a new column 'datetime' 
  ##which merges colunm Date & Time;third, remove column Date and column Time and rearrange the columns
  ##Last, rename the columns make them easy to use without loosing too much understandbility.
  powerDat <- powerDat %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    mutate(datetime = paste(Date, Time, sep = ' ')) %>%
    select(-c(Date, Time)) %>%
    select(datetime,1:7) %>%
    rename(GAP = Global_active_power, GRP = Global_reactive_power, GI = Global_intensity,
           SubM1 = Sub_metering_1, SubM2 = Sub_metering_2,SubM3 = Sub_metering_3)
  
  ##parse column datetime to format Datetime, and plug a new column named newdate, 
  ##then remove the original column datetime  
  powerDat$newdate = strptime(powerDat$datetime, "%d/%m/%Y %H:%M:%S")
  powerDat <- powerDat %>%
    select(newdate,2:8)
  
  return(powerDat)
}
