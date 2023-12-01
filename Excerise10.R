#Carlos Yovany Saravia
#Biocomputing - Excerise 10
#December 01, 2023

#Problem #1 - Plotting Badger's Game

#Librabries need to plot graph
library(ggplot2)
library(cowplot)

#Gathering of Data
badgersData<-read.table("UWvMSU_1-22-13.txt", header = TRUE)

#Creation of Data Frames for both teams
MichDF<-badgersData[badgersData[,2] == "MSU",]
WinDF<-badgersData[badgersData[,2]== "UW",]

#Recording of scores of both teams
MichSumScore<-vector("numeric", nrow(MichDF))
WinSumScore<-vector("numeric", nrow(WinDF))

#Recording Scores of Teams
  MichSumScore = MichDF$score
  WinSumScore = WinDF$score

#Creating of new Vector for Summation of Scores
#Michigan team
for( i in 1:nrow(MichDF)){
  if( i == 1){
    MichSumScore[1]<-MichDF$score[1]
  }else{
    MichSumScore[i] = MichSumScore[i] + MichSumScore[i-1]
  }
}

Mich_Comb <- data.frame(time = MichDF$time, team = "MSU", score = MichSumScore)

#Winconsin Team
for( i in 1:nrow(WinDF)){
  if( i == 1){
    WinSumScore[1]<-WinDF$score[1]
  }else{
    WinSumScore[i] = WinSumScore[i] + WinSumScore[i-1]
  }
}

Win_Comb <- data.frame(time = WinDF$time, team = "UW", score = WinSumScore)

#Creation of Graph
Mich_Comb_Merge<-merge(data.frame(time=badgersData$time), Mich_Comb, by = 'time', all.time = TRUE)
Win_Comb_Merge<-merge(data.frame(time=badgersData$time), Win_Comb, by = 'time', all.time = TRUE)

ggplot()+
  geom_line(data = Mich_Comb_Merge, aes(x=time, y =score), color ='blue')+
  geom_line(data = Win_Comb_Merge, aes(x=time, y =score), color ='purple')+
  labs(title = "MSU and UW, Scores vs Time", x = "Time", y = "Score")+
  theme_minimal()
  
#Problem #2 "Game - Guess my Number"
  randNum<-sample(1:100, 1)
  print("Thinking of a number between 1-100")
  
  for(i in 1:10){
    userGuess<-strtoi(readline(prompt = "Guess:"))
    if(userGuess < randNum){
      print("higher")
    }else if(userGuess > randNum){
      print("lower")
    }else{
      print("Correct!")
      break;
    }
    if(i == 10 && userGuess != randNum){
      print(paste("You ran out of guesses. The correct answer was: ",randNum))
    }
  }

  