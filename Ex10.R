# Exercise 10

#Question1

setwd("C:/Users/cdmix/Desktop/Biocomputing/Biocomputing-Ex-10/")
library(ggplot2)

#Problem 1
##read in the .txt file with the data
game <- read.table("UWvMSU_1-22-13.txt",header=TRUE)
##create empty matrices for each team's running total as time progresses
uw <- data.frame(time=0,team=0,score=0)
msu <- data.frame(time=0,team=0,score=0)
##create a for loop that creates a dataframe with a cumulative score for each team whenever either team scores
for(i in 1:nrow(game)){
  if(game$team[i]=="UW"){
    uw[i,] <- game[i,]
    msu[i,] <- c(0,0,0)
  }else{
    msu[i,] <- game[i,]
    uw[i,] <- c(0,0,0)
  }
}
##create a cumulative score dataset for each team
uwscore <- numeric(length(uw))
msuscore <- numeric(length(msu))

for(i in 1:length(msu$score)){
  msuscore[i] <- sum(msu$score[1:i])
}

for(i in 1:length(uw$score)){
  uwscore[i] <- sum(uw$score[1:i])
}

##combine with times
score <- data.frame(game$time,uwscore,msuscore)
##add zero to the beginning of the scores
init <- c(0,0,0)
score <- rbind(init,score)
##plot each dataset
ggplot(score,aes(x=game.time))+
  geom_line(aes(y=uwscore),color="red")+
  geom_line(aes(y=msuscore),color="green")+
  ylab("Score")+
  xlab("Time(mins)")

#Question 2

#sample a random number
num <- as.numeric(sample(1:100,1))
#10 guesses until the game is over
for(i in 1:10){
  #if guess number is 10, game over
  if(i==10){
    print(paste('Game over! Ran out of guesses. The correct answer was:',num,sep=' '))
    break
    #if guess is lower than guess 10, prompt for the user guess
  }else{
    guess <- as.numeric(readline('Guess: '))
  }
  #correct guess  
  if(guess == num){
    print("Correct!")
    #guess too high
  }else if(guess>num){
    print('Lower')
    #guess too low
  }else{
    print('Higher')
  } 
}    