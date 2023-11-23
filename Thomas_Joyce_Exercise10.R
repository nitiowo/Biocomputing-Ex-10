# Thomas Joyce Exercise 10 Script

# Set working directory
setwd("C:/Users/thoma/OneDrive/Documents/NOTRE DAME FALL 2023/Intro to Biocomputing/Exercise 10/Biocomputing-Ex-10")

# Import libraries
library(ggplot2)

# 1. Create a graph depicting the cumulative score for 
# each team as a function of time

# Import scores dataset
scores <- read.delim("UWvMSU_1-22-13.txt", header = TRUE, sep = "")

# Use a for loop to create vectors of cumulative scores for both teams at each timepoint
UW_score = 0
MSU_score = 0
times = c(0)
UW = c(0)
MSU = c(0)

for (i in 1:nrow(scores)){
  times <- c(times,scores[i,1])
  if (scores[i,2]=="UW"){
    UW_score <- UW_score + scores[i,3]
    UW <- c(UW,UW_score)
    MSU <- c(MSU,MSU_score)
  } else {
    MSU_score <- MSU_score + scores[i,3]
    UW <- c(UW,UW_score)
    MSU <- c(MSU,MSU_score)
  }
}

# Create cumulative scores dataframe
cumulative_scores <- data.frame(times,UW,MSU)

# Create game summary plot
ggplot(cumulative_scores, aes(x = times)) +
  geom_line(aes(y = UW, color="UW"), linetype = "solid", size = 1) +
  geom_line(aes(y = MSU, color="MSU"), linetype = "solid", size = 1) +
  scale_color_manual(breaks=c("UW","MSU"),values=c("red","darkgreen"))+
  labs(title = "Game Summary", x = "Time", y = "Cumulative Score",color="Team")


# 2. Write a game called "guess my number."

guess_my_number <- function(){
  number <- sample(1:100,1)
  print("I'm thinking of a number 1-100...")
  guess <- as.numeric(readline(prompt = "Guess: "))
  total_guesses <- 0
  while (guess != number & total_guesses < 10){
    if (guess<number){
      print("higher")
      guess <- as.numeric(readline(prompt = "Guess: "))
      total_guesses <- total_guesses + 1
    } else {
      print("lower")
      guess <- as.numeric(readline(prompt = "Guess: "))
      total_guesses <- total_guesses + 1
    } }
  if (total_guesses < 10){
    print("correct!")   
  } else {
    print("Sorry, maximum number of guesses exceeded")
  }

}

guess_my_number() # Run this line of code to play the game


