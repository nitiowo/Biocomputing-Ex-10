#exercise 10 for Mark Jantz

rm(list=ls())
library(ggplot2)

#Problem 1: 

#load in dataset
data <- read.table("/Users/mark/Downloads/UWvMSU_1-22-13.txt",header=TRUE,sep="\t")

# Set empty variables for socre
MSUscore <- 0
UWscore <- 0
#to collect total score
MSUtot <- c()
UWtot <- c()
# Calculate cumulative scores with for loop
for(i in 1:nrow(data)) {
  if(data$team[i] == "MSU") {
    MSUscore <- MSUscore + data$score[i]
  } else {
    UWscore <- UWscore + data$score[i]
  }
  UWtot <- c(UWtot, UWscore)
  MSUtot <- c(MSUtot, MSUscore)
}

# Add time to the cumulative scores in a data frame
total_score <- data.frame(Time = data$time, UW = UWtot, MSU = MSUtot)

# Plot graph
ggplot(total_score, aes(x = Time)) +
  geom_line(aes(y = UW, color = "UW")) +
  geom_line(aes(y = MSU, color = "MSU")) + labs(y = 'Points')+
  theme_classic()




#Problem 2
#guessing game fuction type guessing_game() in terminal to play 
guessing_game<-function() {
  #generate random number
  num<-sample(1:100,1)
  attempts<-1
  max_attempts<-10
  #prints instructions
  cat("you have 10 guesses to get a number between 1-100 good LUCK!")
  while(attempts<=max_attempts){

    #Get user input for guess
    userguess<-readline(prompt=("Enter guess: "))
    #If the number is correct, it tells the user and ends the loop  
    if(userguess==num){
      print("correct! :)")
      break
    }else if(attempts==max_attempts){
      #Ends the game if # of attempts is exceded 
      print("You lost :/")
      break
    }else if(userguess>num){
      print("higher")
    }else if(userguess<num){
      print("lower")
    }
    #Counter variable to adding one each time through the loop
    attempts<-attempts+1
  }
  }