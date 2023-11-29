#Excercise 10 Script for Patrick Kuebler

#loads in packages
library(ggplot2)

#loads in the game data text file
game<-read.table("UWvMSU_1-22-13.txt",header=TRUE,sep="\t",stringsAsFactors = FALSE)

#makes a new data frame with the cumulative score for each team

#pre-allocate an empty data frame
score<-data.frame(time=0,UW=0,MSU=0)

#puts the cumulative score into the data frame
for(i in 1:nrow(game)){
#adds the number of points to the UW column in they score
  if(game$team[i]=="UW"){
    newRow<-data.frame(time=game$time[i],UW=score$UW[nrow(score)]+game$score[i],MSU=score$MSU[nrow(score)])
    score<-rbind(score,newRow)
  }else{
#adds the number of points to the MSU column if they score
    newRow<-data.frame(time=game$time[i],MSU=score$MSU[nrow(score)]+game$score[i],UW=score$UW[nrow(score)])
    score<-rbind(score,newRow)
  }
}

#Generates a graph with the cumulative score of each team throughout the game
ggplot(data=score,aes(x=time)) +
  geom_line(aes(y=MSU,color="MSU"),linetype="solid",size=1.5) +
  geom_line(aes(y=UW,color="UW"),linetype="solid",size=1.5) +
  theme_classic() +
  labs(x="Time of Game",y="Score",color="Teams") +
  scale_color_manual(values=c("MSU"="darkgreen","UW"="red"))



#Number guessing name, between 1 and 100

number_guess<-function() {
#generates a random number between 1 and 100
  number<-sample(1:100,1)
  
  print("I'm thinking of a number between 1 and 100...")
#stores the number of attempts in a variable  
  attempts<-0
#keeps this loop going while the number of attempts is less than 10  
while(attempts<10){
#allows the user to input a guess  
  guess<-readline(prompt="Guess: ")
#If the number is correct, it tells the user and ends the loop  
  if(guess==number){
    print("You got it!!!")
    break
#if the number is too high or too low, it tells the user
  }else if(guess>number){
    print("Too high!")
  }else{
    print("Too low!")
  }
#adds 1 to the number of attempts after every guess  
  attempts<-attempts+1
}
#Ends the game if the number of attempts reaches 10  
  if(attempts==10){
    print("You ran out of tries...")
}
}

