#John LeSage
#Biocomputing Exercise 10, 11/29/23

#Setting up the exercise
setwd("~/Desktop/Exercise_10")
#navigates R to the Exercise_10 directory where my files are stored
gameData <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")
#loads the UW vs MSU game into a data frame with columns for time, team, and points scored
library(ggplot2)
library(cowplot)


#Question 1
#setting up data frames for question
header <- c("Time", "Points")
MSU_Points <- data.frame(matrix(ncol=2, nrow=nrow(gameData[gameData$team=="MSU",])))
colnames(MSU_Points) <- header
UW_Points <- data.frame(matrix(ncol=2, nrow=nrow(gameData[gameData$team=="UW",])))
colnames(UW_Points) <- header
UW_Time <- 0
UW_Score <- 0
MSU_Time <- 0
MSU_Score <- 0
RowNumUW <- 0
RowNumMSU <- 0


#Making the for loop
for(i in 1:nrow(gameData)){
  if(gameData$team[i] == "UW"){
    UW_Score <- UW_Score + gameData$score[i]
    UW_Time <- gameData$time[i]
    RowNumUW <- RowNumUW + 1
    UW_Points$Points[RowNumUW] <- UW_Score
    UW_Points$Time[RowNumUW] <- UW_Time
  }else{
    MSU_Score <- MSU_Score + gameData$score[i]
    MSU_Time <- gameData$time[i]
    RowNumMSU <- RowNumMSU + 1
    MSU_Points$Points[RowNumMSU] <- MSU_Score
    MSU_Points$Time[RowNumMSU] <- MSU_Time
  }}
    
#create graph to visually show data
ggplot()+
  geom_line(data=UW_Points, aes(x=Time, y=Points), color="maroon") +
  geom_line(data=MSU_Points, aes(x=Time, y=Points), color="forestgreen") +
 xlab("Time elapsed in game") + ylab("Points scored") + ggtitle("UW vs MSU, 1/22/13")
      


#Question 2: Guess a number
myNum <- as.numeric(sample(100,1))
#computer randomly chooses 1 integer between 0-100
for(i in 1:10){
  myGuess <- readline("Type your guess:") #stores user input as a variable
  if(myGuess<myNum){
    print("higher")
  } else if(myGuess>myNum){
    print("lower")
  } else {
    print("That is correct!")
    break
  }}


