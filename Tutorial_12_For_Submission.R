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
    cumulativeScores$Time[i] <- as.numeric(scores$V1[i])
    cumulativeScores$UWScore[i] <- cumulativeScores$UWScore[i-1] + as.numeric(scores$V3[i])
    cumulativeScores$MSUScore[i] <- cumulativeScores$MSUScore[i-1]
  }else{
    cumulativeScores$Time[i] <- as.numeric(scores$V1[i])
    cumulativeScores$UWScore[i] <- cumulativeScores$UWScore[i-1]
    cumulativeScores$MSUScore[i] <- cumulativeScores$MSU[i-1] + as.numeric(scores$V3[i])
  }
}
#Make the graph
ggplot(data = cumulativeScores,
       aes(order(Time),UWScore,fill,color="UW Score")) +
  geom_line(data = cumulativeScores,
         aes(order(Time),MSUScore,color="MSU Score")) +
  geom_line() +
  xlab("Time (minutes)") +
  ylab("Points") +
  theme_classic()

#Exercise 2
number <- sample(c(1:100),1) #Generate the random number on [1,100]
for(i in 1:1000){
  guess <- as.numeric(readline(prompt="Guess a number: ")) #Obtain user input
  if(guess==number){
    print("Correct!")
    break #found in the for loop manual (from ?for, then press enter twice)
  }else if(guess<number){
    print("The number is higher than your guess.")
  }else{
    print("The number is lower than your guess.")
  }
}
