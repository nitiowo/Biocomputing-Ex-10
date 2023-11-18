#Tutorial 12 Submission

#Exercise 1
#Import Data and Libraries
scores <- read.table("C:/Users/grace/Desktop/Biocomputing 2023/R/Tutorials/Biocomputing-Ex-10/UWvMSU_1-22-13.txt")
library(ggplot2)
library(cowplot)
#Generate dataframe for the cumulative scores
time <- c(0)
UWScore <- c(0)
MSUScore <- c(0)
UWCurrentScore <- 0
MSUCurrentScore <- 0
cumulativeScores <- data.frame(matrix(0,nrow=51,ncol=3))
colnames(cumulativeScores) <- c("Time","UWScore","MSUScore")
#For loop
for(i in 2:nrow(scores)){
  if(scores$V2[i]=="UW"){
    cumulativeScores$Time[i] <- scores$V1[i]
    cumulativeScores$UWScore[i] <- cumulativeScores$UWScore[i-1] + as.numeric(scores$V3[i])
    cumulativeScores$MSUScore[i] <- cumulativeScores$MSUScore[i-1]
  }else{
    cumulativeScores$Time[i] <- scores$V1[i]
    cumulativeScores$UWScore[i] <- cumulativeScores$UWScore[i-1]
    cumulativeScores$MSUScore[i] <- cumulativeScores$MSU[i-1] + as.numeric(scores$V3[i])
  }
}
#Make the graph
ggplot(data = cumulativeScores,
       aes(x=order(Time),y=UWScore)) +
  geom_point() +
  geom_line() +
  xlab("Time (minutes)") +
  ylab("Points") +
  theme_classic()

#Exercise 2