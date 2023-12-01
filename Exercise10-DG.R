#Github sbumission for Exercise 10 for Daniel Gatewood


rm(list=ls())
library(ggplot2)

#1: Using the score-by-score information from this game summarized in “UWvMSU_1-22-13.txt” generate a graph similar to the one I show above. Don’t worry about how pretty your graph is. Focus more on the control structures required in your script used to generate the plot.
#A couple tips on this one:
#You’ll want to generate a dataframe with a cumulative score for each team whenever either team scores.

scores<-read.table("/Users/daniel/Desktop/Biocomputing-Ex-10/UWvMSU_1-22-13.txt",header=TRUE,sep="\t")
UW<-scores[scores$team=="UW",]
MSU<-scores[scores$team=="MSU",]

for( i in 2:nrow(UW)){
  UW[i,3]<-UW[i-1,3]+UW[i,3]
}
for( i in 2:nrow(MSU)){
  MSU[i,3]<-MSU[i-1,3]+MSU[i,3]
}

ggplot()+
  geom_step(mapping=aes(y=score,x=time),colour="red",data=UW)+
  geom_step(mapping=aes(y=score,x=time),colour="darkgreen",data=MSU)+
  theme_classic()

#2:
secretnumber<-sample(1:100,1)
for(i in 1:10){
  guess<-as.numeric(readline())
  if(guess==secretnumber){
    print("Correct!")
    break
  }else if(guess>secretnumber){
    print("Lower")
    }else{print("Higher")}
}



