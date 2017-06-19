##Load Data First
source("loadData.R")
dat <- powerDat()

##Open png file
png(file = "plot4.png", width = 480,height = 480)

#Make Plot
par(mfrow = c(2,2),bg=NA)
with(dat,plot(newdate, GAP,type = 'l',ylab = 'Global Active Power',xlab = ''))
with(dat,plot(newdate, Voltage,type = 'l',ylab = 'Voltage',xlab = 'datetime'))

with(dat,plot(newdate,SubM1,type = 'l',ylab = 'Energy Sub Metering',xlab = ''))
with(dat,lines(newdate,SubM2,type = 'l',col = 'red'))
with(dat,lines(newdate,SubM3,type = 'l',col = 'blue'))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = 1, lwd = 1,
       text.col=c("black","red","blue"),cex = 0.75,bty = 'n')

with(dat,plot(newdate, GRP,type = 'l',ylab = 'Global_ractive_power',xlab = 'datetime'))

##Close device
dev.off()
