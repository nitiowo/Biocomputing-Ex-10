### Judith Lanahan
### exercise 10
### 12/1/23

## problem 1: create plot of cumulative score vs. time for badgers vs. spartans

# set working directory to exercise 10 directory

setwd("C:/Users/Judith Lanahan/OneDrive/Desktop/Biocomputing/R/Exercises/Biocomputing-Ex-10")

# load in game data text file and plot packages

game<-read.table("UWvMSU_1-22-13.txt", header = TRUE) # unchanged data
game2<-read.table("UWvMSU_1-22-13.txt", header = TRUE) # will provide structure for cumulative score dataframe

library(ggplot2)
library(cowplot)

# create data frame of cumulative scores of each team 

# creating empty variables for the cumulative score of each team
totScoW<-0
totScoM<-0

# loop through rows of "game" to replace score column in "game2" with cumulative score
for(i in 1:nrow(game)){
  if(game$team[i]=="UW"){
    totScoW<-totScoW+game$score[i]
    game2$score[i]<-totScoW
  }else if(game$team[i]=="MSU"){
    totScoM<-totScoM+game$score[i]
    game2$score[i]<-totScoM
  }
}

# plot the score v. time for each team

ggplot(data=game2, aes(x=time, y=score))+
  geom_line(aes(color=team))+
  xlab("Time (s)")+
  ylab("Score")+
  theme_classic()

## problem 2: generate random number between 1:100 and ask user to guess number until 
## correct or ten guesses 

#game is the function guessGame()
#this function takes no arguments
#the user calls this function and then responds to prompts in the console

guessGame<-function(){
  #generate random number between 1 and 100
  ans<-sample(1:100,1)
  
  #when correct, this flag switches to 1 and terminates the prompt to the user
  #flag must be reset to 0 before running the guessing game
  correct=0 
  
  # loop that gives user 10 guesses to choose the random number
  
  for(i in 1:10){
    if(correct==0){
      guess<-readline("Guess a number between 1 and 100: ")
      guess<-as.numeric(guess)
      if(guess>ans){
        print("Lower...")
      }else if(guess<ans){
        print("Higher...")
      }else if(guess==ans){
        print("Correct!")
        correct<-1
      }
    }else if(correct==1){
      # in order to end the game when the user is correct, nothing occurs here
    }
  }
}

# code to run the game 

guessGame()

