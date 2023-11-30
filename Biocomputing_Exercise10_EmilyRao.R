###Biocomputing Tutorial Exercise 10
##Emily Rao

#go to directory
setwd("C://Users/emRao/Biocomputing-Ex-10")

#load packages
library(ggplot2)


##Question 1
#import data file
scores <- read.table("UWvMSU_1-22-13.txt", sep="\t", header=TRUE)

#set starting score to 0 and create vectors for cumulative scores
MSU <- 0
UW <- 0
UW_cumulative <- c()
MSU_cumulative <- c()

#create a loop that updates the scores with the cumulative
for (i in 1:nrow(scores)){
  if (scores$team[i]=="UW"){
    UW <- UW + scores$score[i]
    UW_cumulative <- c(UW_cumulative, UW)
    MSU_cumulative <- c(MSU_cumulative, MSU)
  }
  else{
    MSU <- MSU + scores$score[i]
    UW_cumulative <- c(UW_cumulative, UW)
    MSU_cumulative <- c(MSU_cumulative, MSU)
  }
}

#store cumulative scores in a dataframe
time <- scores$time
scores_cumulative <- data.frame(time, UW_cumulative, MSU_cumulative)

#generate plot of scores vs time
ggplot(scores_cumulative, aes(x=time)) +
  geom_line(aes(y=UW_cumulative, color="UW")) +
  geom_line(aes(y=MSU_cumulative, color="MSU")) +
  xlab("Time") +
  ylab("Score") +
  ggtitle("Game Summary")


##Question 2
#create variable that randomly generates one number between 1-100
generator = sample(1:100, 1)
print("I'm thinking of a number between 1-100...")

#create a loop to give feedback based on the user's input until user guesses 
#correct number OR until 10 tries have been used
for (i in 1:10){
  x = as.integer(readline("Guess a number: "))
  if (x > generator){
    print("Lower")
  }else if (x < generator){
    print("Higher")
  }else{
    print("Correct! :)")
    break
  }
  if (i==10){
    print("Game Over! You have run of out guesses.")
  }
}