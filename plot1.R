##Load Data First
source("loadData.R")
dat <- powerDat()

##Open png file
png(file = "plot1.png", width = 480,height = 480)

#Make Plot
par(mfrow = c(1,1),bg=NA)
with(dat,hist(GAP,col = 'red', xlab = "Global Active Power (kilowatt)", 
              main =  "Global Active Power"))

##Close device
dev.off()

