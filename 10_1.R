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
##plot each dataset
ggplot(score,aes(x=game.time))+
  geom_line(aes(y=uwscore),color="red")+
  geom_line(aes(y=msuscore),color="green")+
  ylab("Score")+
  xlab("Time(mins)")
