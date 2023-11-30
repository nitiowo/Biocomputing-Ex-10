#John LeSage
#Biocomputing Exercise 10, 11/29/23

#Setting up the exercise
setwd("~/Desktop/Exercise_10")
#navigates R to the Exercise_10 directory where my files are stored
gameData <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")
#loads the UW vs MSU game into a data frame with columns for time, team, and points scored


#Question 1
#setting up data frames for question
header <- c("Time", "Points")
MSU_Points <- data.frame(matrix(ncol=2, nrow=nrow(gameData[gameData$team=="MSU",])))
colnames(MSU_Points) <- header
UW_Points <- data.frame(matrix(ncol=2, nrow=nrow(gameData[gameData$team=="UW",])))
colnames(MSU_Points) <- header
UW_Time <- 0
UW_Score <- 0
MSU_Time <- 0
MSU_Score <- 0
RowNumUW <- 0
RowNumMSU <- 0
#makes a data frame containing columns for time, UW score, and MSU score
#this will be filled by our for loop:

for(i in 1:nrow(gameData)){
  if(gameData$team[i] == "UW"){
    UW_Score <- UW_Score + gameData$score[i]
    UW_Time <- gameData$time[i]
    RowNumUW <- 
    


#Question 2: Guess a number
myNum <- as.numeric(sample(100,1))
for(i in 1:10){
  myGuess <- readline("Type your guess:")
  if(myGuess<myNum){
    print("higher")
  } else if(myGuess>myNum){
    print("lower")
  } else {
    print("That is correct!")
    break
  }}


