# Caroline Daniher Exercise 10
setwd("~/Desktop/R Biocomputing/Biocomputing-Ex-10")

# Number 1
library(ggplot2)
score<-read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)
# In the code below, I have set MSU and UW points both to 0 to start off the game. 
# I have also created two empty vectors for MSU and UW to show the score across time.
MSU_total<-c()
UW_total<-c()
MSU_points<-0
UW_points<-0

# in the for loop, I run through each time stamp given in the data.
# I first ask if the team that scored at a specific time was UW. If it is, I add the points to the total in 
# UW_points as well as show the current score in UW_total. If UW did not score, I add the points for MSU. No matter what time scored, 
# I continue to keep track of the current score for both teams in UW_total and MSU_total.
for(i in 1:nrow(score)){
  if(score$team[i]=="UW"){
    UW_points<-UW_points+score$score[i]
    MSU_total<-c(MSU_total,MSU_points)
    UW_total<-c(UW_total,UW_points)
  }else{
    MSU_points<-MSU_points+score$score[i]
    MSU_total<-c(MSU_total,MSU_points)
    UW_total<-c(UW_total,UW_points)
  }
}
time<-score$time
# I combine all the accumulated score data in total_score
total_score<-data.frame(Time=time,UW=UW_total,MSU=MSU_total)

# I plot the two lines for MSU and UW on a graph with time as the x-axis and the accumulated points on the y-axis.
ggplot(total_score, aes(x = Time)) +
  geom_line(aes(y = UW, color = "UW")) +
  geom_line(aes(y = MSU, color = "MSU")) +
  xlab('Time') + ylab('Points') + ggtitle('Game Score Summary') + theme_classic() 

# Number 2 

# create a custom function that pulls a random variable using sample
# as you continue to guess, the function evaluates whether your guess is higher, lower, or equal to the random number.
# the function will give an appropriate response to each scenario. If you are out of guesses, the code will tell you so and the game ends.
# TO PLAY THE GAME, TYPE "guess_game()"
guess_game<-function(){
  attempts<-10
  random_number<-sample((1:100),1)
  print("I'm thinking of a number 1-100...")
  for (i in 1:attempts) {
  guess<-readline("Guess: ")
  if (guess==random_number) {
    return("Correct!")
  } else if (guess>random_number) {
    print("Lower")
  } else {
    print("Higher")
  }
}
print("Sorry, you tried all ten attempts. The game has ended.")
}
  