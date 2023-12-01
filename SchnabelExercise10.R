#Schnabel Biocomputing Exercise 10

setwd("~/Desktop/IntrotoBiocomputing/BiocomputingEx10-main") 

#load necessary packages
library(ggplot2)
library(cowplot)

#Question 1. Generate a line graph depicting the cumulative 
#score for each team as a function of time in the game (see below).

#read in data 
gamedata<- read.table("UWvMSU_1-22-13.txt",header = TRUE)

#set up data frames 
columns<-c("Time","Points") 
UW<- data.frame(matrix(nrow=nrow(gamedata[gamedata$team =='UW',]), ncol=2)) #this creates an empty data frame with 
#2 columns, and rows for the number of times that UW scores 
colnames(UW)<-columns #to create the column names for the data frame
MSU<- data.frame(matrix(nrow=nrow(gamedata[gamedata$team =='MSU',]), ncol=2)) #this creates an empty data frame with 
#2 columns, and rows for the number of times that MSU scores 
colnames(MSU)<-columns #to create the column names for the data frame

#creating the variables for the for loop 
UW_Time<-0
UW_Score<-0
MSU_Time<-0
MSU_Score<-0
RowUW<-0
RowMSU<-0

#for loop to add cumulative score for each team over time 
for (i in 1:nrow(gamedata)){
  if(gamedata$team[i]=="UW"){
    UW_Time<-gamedata$time[i]
    UW_Score<-UW_Score + gamedata$score[i]
  RowUW<-RowUW+1
  UW$Time[RowUW]<-UW_Time
  UW$Points[RowUW]<-UW_Score
}else{
  MSU_Time<-gamedata$time[i]
  MSU_Score<-MSU_Score + gamedata$score[i]
  RowMSU<-RowMSU+1
  MSU$Time[RowMSU]<-MSU_Time
  MSU$Points[RowMSU]<-MSU_Score
}
}

#generate graph to depict cumulative score of each team as a function of time
cumulative_score<-ggplot()+
  geom_line(data=MSU, aes(x=Time,y=Points), color="Dark Green")+
  geom_line(data=UW, aes(x=Time,y=Points), color="Red")+
  ylab("Points scored") +
  theme_classic()
  ggtitle("UW vs MSU")
  
  #display graph
  cumulative_score

#Question 2 Generates "Guess my number" game 
  #computer generates a random number between 1 and 100
  thenumber<-as.integer(sample(1:100,1))
  #construct for loop that allows ten guesses 
  for (i in 1:10){
    guess<-readline("Type a number ")
    if (guess<thenumber){
      print("Higher")
    } else if (guess>thenumber){
      print("Lower")
    }else {
      print("Correct!")
      break #game ends, as user has correctly guessed the number
    }
    }
  

  
