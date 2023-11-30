setwd("/Users/vivianyang/Desktop/Biocomputing")
library(ggplot2)
library(cowplot)
score <- read.table("UWvMSU_1-22-13.txt", header=TRUE,stringsAsFactors = FALSE)

UW <- score[score$team == "UW", ]
MSU <- score[score$team == "MSU", ]
UW$UW_cumulative <- NA
MSU$MSU_cumulative <- NA

UW[1,4] <- UW[1,3]
MSU[1,4] <- MSU[1,3]

for (i in 2:nrow(UW)) {
  UW[i,4] <- UW[i-1,4] + UW[i,3]
  i <- i+1
}

for (j in 2:nrow(MSU)) {
  MSU[j,4] <- MSU[j-1,4] + MSU[j,3]
  j <- j+1
}

ggplot() +  geom_line(data = UW, aes(x = time, y = UW_cumulative), color = 'blue') +  
  geom_line(data = MSU, aes(x = time, y = MSU_cumulative), color = 'red') +
  xlab("time(min)") +
  ylab("score") +  
  theme_classic()



