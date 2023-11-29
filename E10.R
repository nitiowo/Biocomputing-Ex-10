# Czerwiec, Mae
# Intro to Biocomputing
# Exercise 10 - due Dec. 1

setwd("~/Desktop/Biocomputing/Biocomputing-Ex-10")

# Question 1: Basketball Data Analysis

#this block of code generates separate data for UW and MSU scoring
fileinit=read.table("UWvMSU_1-22-13.txt", header=TRUE)
uw=data.frame(time=0, score=0)
msu=data.frame(time=0, score=0)
for(g in 1:nrow(fileinit)){
  if(fileinit$team[g]=="UW"){
    uw=rbind(uw, c(fileinit$time[g], fileinit$score[g]))
  }
  else if(fileinit$team[g]=="MSU"){
    msu=rbind(msu, c(fileinit$time[g], fileinit$score[g]))
  }
}
# this block of code makes the score cumulative
for(w in 2:nrow(uw)){
  lastone=uw$score[w-1]
  thisone=uw$score[w]
  uw$score[w]=lastone+thisone
}
for(m in 2:nrow(msu)){
  lastone=msu$score[m-1]
  thisone=msu$score[m]
  msu$score[m]=lastone+thisone
}
# this block of code plots the scores
install.packages("ggplot2")
library(ggplot2)

ggplot() +
  geom_line(data=uw, aes(x=time, y=score), color="red") +
  geom_line(data=msu, aes(x=time, y=score), color="forestgreen") +
  theme_classic()


# Question 2 - Number Guessing Game

guessingGame=function(x){
thenumber=sample(x)[1]
for(i in 1:11){
  if(i<11){
  guess=strtoi(readline(prompt="Guess a number!"))
  if(guess==thenumber){
    print("You win!")
    break
  }
  else if(guess<thenumber){
    print("Higher!")
  }
  else if(guess>thenumber){
    print("Lower!")
  }
  }
  else{
    print(thenumber)
    print("You lose!")
  }
}
}
