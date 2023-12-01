#Nicholas Buhay
#Exercise 10
#Problem 1: Generating a Wisconsin vs. Michigan State graph
setwd("/Users/nicholasbuhay/Desktop/Biocomputing/Exercise10/Biocomputing-Ex-10")
#Loading the data from the given file
gamesummary<-read.table("UWvMSU_1-22-13.txt",header=TRUE)
#creating vectors and cumulative score variables
UW<-0
MSU<-0
cumulativeUW<-numeric(length=nrow(gamesummary))
cumulativeMSU<-numeric(length=nrow(gamesummary))
#creating a for loop to store data in
for(i in 1:nrow(gamesummary)){{
  if(gamesummary$team[i]=="MSU"){
    MSU<-MSU+gamesummary$score[i]}
  else{
    UW<-UW+gamesummary$score[i]}
  cumulativeMSU<-MSU
  cumulativeUW<-UW
}}
#plotting graph
library(ggplot2)
library(cowplot)
gametimes<-gamesummary$time
plot(gametimes, cumulativeUW, type = "l", col="blue", ylim = c(0, max(cumulativeUW, cumulativeMSU)), xlab= "Time", ylab = "Score", main = "UW vs. MSU")
lines(gametimes, cumulativeMSU, col = "green")+
  legend = c("University of Wisconsin", "MSU"), col = c("blue", "green"), lty =1

#Problem 2: Guessing the number game
guessmynumber<-function() {
  random<-sample(1:100,1)
  guesslimit<-10
  for (attempt in 1:guesslimit){
    guess<-as.numeric(readline("Take a guess:"))
    if (guess==random){
      cat("Correct!")
      break}
    else {
      if (guess<random){
        cat("Higher")
      } else {
        cat("Lower")
      }
    }
    if (attempt==guesslimit){
      cat("Sorry, you have failed.")
    }
  }
}
guessmynumber()