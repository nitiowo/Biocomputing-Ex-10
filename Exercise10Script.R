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
plot(gamesummary$time, cumulativeUW, type = "l", col = "red", ylim = c(0, max(cumulativeUW, cumulativeMSU)), xlab = "Time", ylab = "Score", main = "Wisconsin vs MSU")
lines(gamesummary$time, cumulativeMSU, col = "darkgreen")
legend("bottomright", legend = c("University of Wisconsin", "MSU"), col = c("red", "darkgreen"), lty =1)