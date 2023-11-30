#Exercise 10 - Carmela D'Antuono
setwd("~/Desktop/Biocomputing-Ex-10")
library(ggplot2)

#Question 1 - graph of cumulative scores for each team as a function of time
scores <- read.csv("UWvMSU_1-22-13.csv")
#generate data frame with cumulative score for each team whenever they score
#make empty data frame for the time and total for both teams, pre allocation
titles <- c("time", "total")
dfUW <- data.frame(matrix(ncol=2,nrow=23))
colnames(dfUW) <- titles
dfMSU <- data.frame(matrix(ncol=2,nrow=27))
colnames(dfMSU) <- titles
#make empty variables for the total time and total points for each team
timeUW <- 0 
totalUW <- 0
totalMSU <- 0
timeMSU <- 0
#make empty variables to keep track of where we're adding data to data frames
rowUW <- 0
rowMSU <- 0
#for loop for cumulative score 
for(i in 1:nrow(scores)){
  if(scores$team[i] == "UW"){ #if team is UW add to totalUW and add time to timeUW
   totalUW <- totalUW + scores$score[i] #add to get new cumulative score
   timeUW <- scores$time[i] #insert new time
   rowUW <- rowUW + 1 #signal what row of the data frame to edit
   dfUW$time[rowUW] <- timeUW #edit the data frame for UW 
   dfUW$total[rowUW] <- totalUW
  }else{ #else add to totalMSU and add time to timeMSU
    totalMSU <- totalMSU + scores$score[i] #add to get new cumulative score
    timeMSU <- scores$time[i] #insert new time
    rowMSU <- rowMSU + 1 #signal what row of the data frame to edit 
    dfMSU$time[rowMSU] <- timeMSU #edit the data frame for MSU
    dfMSU$total[rowMSU] <- totalMSU
  }
}
#make the graph - shows that MSU won 49-47
ggplot() +
  geom_line(data = dfMSU, aes(x = time, y = total), color = "green") +
  geom_line(data = dfUW, aes(x = time, y = total), color = "red") + 
  ggtitle("Cumulative Score for Each Team as a Function of Time") +
  theme(plot.title = element_text(size=8))

#Question 2 - "guess my number" game
print("I'm thinking of a number 1-100")
#computer generates a random number between 1 and 100
goalNumber <- as.numeric(sample(100,1)) 
#for loop to make the game run 10 times
for(i in 1:10){
  guess <- readline(prompt = "Guess:") #player is prompted to guess the number
  if(guess < goalNumber){
    print("lower") #responds lower if the guess is too low 
  }else if(guess > goalNumber){
    print("higher") #responds higher if the guess is too high
  }else{
    print("Correct") #response correct if the guess is correct
    break #ends the game if the guess is correct
  }
}
  
