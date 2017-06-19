##Load Data First
source("loadData.R")
dat <- powerDat()

##Open png file
png(file = "plot2.png", width = 480,height = 480)

#Make Plot
par(mfrow = c(1,1),bg=NA)
with(dat,plot(newdate, GAP,type = 'l',ylab = 'Global Active Power (kilowatt)',xlab = ''))

##Close device
dev.off()
