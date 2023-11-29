#John LeSage
#Biocomputing Exercise 10, 11/29/23

#Setting up the exercise
setwd("~/Desktop/Exercise_10")
#navigates R to the Exercise_10 directory where my files are stored
gameData <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")
#loads the UW vs MSU game into a data frame with columns for time, team, and points scored


#Question 1
gameFlow <- data.frame(Time=gameData$time, UW_Score=0, MSU_Score=0)
#makes a data frame containing columns for time, UW score, and MSU score
#this will be filled by our for loop:


#Question 2: Guess a number
myNum <- as.numeric(sample(100,1))
for(i in 1:10){
  myGuess <- readline("Type your guess:")
  if(myGuess<myNum){
    print("Too low, try again")
  } else if(myGuess>myNum){
    print("Too high, try again")
  } else {
    print("That is correct!")
    break
  }}



