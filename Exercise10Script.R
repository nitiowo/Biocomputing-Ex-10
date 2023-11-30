#Start in working directory that includes the file "UWvMSU_1-22-13.txt"
#1)Generate graph of cumulative score over time for game data compared in the file
##Tip: Generate data frame with cumulative score for each team whenever either team scores
#read in data from score file
ogscores<-read.csv(file="UWvMSU_1-22-13.txt", header=TRUE,sep="\t",stringsAsFactors=FALSE)
#Separate data by team from original textfile
UWscores<-data.frame(time=ogscores$time,score=ogscores$score,cumscore=0)
for(i in 1:nrow(UWscores)){
  UWscores$score[i]<-if(ogscores$team[i]=="UW"){
    print(ogscores$score[i])
  }else{
    print(0)
  }
} 

MSUscores<-data.frame(time=ogscores$time,score=ogscores$score,cumscore=0)
for(i in 1:nrow(MSUscores)){
  MSUscores$score[i]<-if(ogscores$team[i]=="MSU"){
    print(ogscores$score[i])
  }else{
    print(0)
  }
} 
#Fill cumulative column with cumulative score over time for each team
for(i in 1:nrow(UWscores)){
  UWscores$cumscore[i]=sum(UWscores$score[1:i])
}

for(i in 1:nrow(MSUscores)){
  MSUscores$cumscore[i]=sum(MSUscores$score[1:i])
}

#Load in ggplot package to be able to creat plot
library(ggplot2)

#create lineplot with time on x axis and cumulative score on y axis
##there should be 2 lines representing each team separately
ggplot(data=UWscores,
       aes(time,cumscore)) + 
  geom_line()+ 
  xlab("Time") + 
  ylab("Cumulative Score") +
  geom_line(data=MSUscores,colour='darkorchid')

#2)Write game called "guess my number" where computer generates number between 1 and 100 randomly, user types a number, and computer tells if it is higher or lower or correct and player can guess up to 10 times 
#Create a vector containing numbers 1 through 100
numbers<-c(1:100)
#Computer generates a random number from the vector created above and saves as random
random<-sample(numbers,1)
#Prompts user to enter a number and then user enters a number
guess<-readline(prompt = "I'm thinking of a number 1-100...")
##For loop to loop through guessing and outputs with responses from code:  
for(i in 1:10){
  guess<-readline(prompt = "I'm thinking of a number 1-100...")
  if(guess<=random){
    if(guess<random){
      print("Higher")
    }else{
      print("Correct!")
      break
    }
  }else{
    print("Lower")
  }
}
