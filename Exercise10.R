# Removing any pre-existing environment variables
rm(list=ls())
# Set working directory
setwd("C:/Users/student/Desktop/Notre Dame/Fall 23/Biocomp/Biocomputing-Ex-10")
# Loading necessary packages
library(ggplot2)
# Read in the score-by-score table
scoreinfo <- read.table("UWvMSU_1-22-13.txt", header=TRUE)

# Initialize variables to place running score total
UW_score = 0
MSU_score = 0

# Using a for loop to calculate the running score total
for (i in 1:nrow(scoreinfo)){
  if (i == 1 && scoreinfo$team[1] == "UW") {
    UW_score = scoreinfo$score[1]
    MSU_score = 0
  }
  else if (i == 1 && scoreinfo$team[1] == "MSU") {
    MSU_score = scoreinfo$score[i]
    UW_score = 0
  }
  else {
    for (j in 2:nrow(scoreinfo)) {
      if (scoreinfo$team[j] == "UW") {
        UW_score[j] = UW_score[j-1] + scoreinfo$score[j]
        MSU_score[j] = MSU_score[j-1]
      }
      else {
        MSU_score[j] = MSU_score[j-1] + scoreinfo$score[j]
        UW_score[j] = UW_score[j-1]
      }
    }
  } 
}


# Creating a dataframe with the running scores for each teams
tot_scores <- cbind(scoreinfo, UW_score, MSU_score)

## Team score vs. time (minutes)
ggplot(data = tot_scores, aes(x = time)) +
  geom_line(aes(y = UW_score, colour = "UW"), size = 1) +
  geom_line(aes(y = MSU_score, colour = "MSU"), size = 1) +
  xlab("Time (minutes)") + ylab("Score") + 
  labs(colour = "Team") + 
  theme_bw() 


# Guess my number game as a function
guessmynumber <- function() {
  # Generate random integer between 1 and 100
  random_num = sample(1:100,1)
  # Initial message
  cat("I'm thinking of a number between 1 to 100...\nYou have 10 tries to guess correctly.")
  # Taking user's guss
  guess = readline("Guess: ")
  # Initialize variable for number of tries
  tries = 0
  
  while (tries < 9) {
      if (guess < random_num) {
        print("Lower")
        tries <- tries + 1
        guess = readline(paste("Guess",tries + 1,": "))
      }
      else if (guess > random_num) {
        print("Higher")
        tries <- tries + 1
        guess = readline(paste("Guess",tries + 1,": "))
      }
      else if (guess == random_num) {
        return(paste("Correct!"))
      }
    }
    paste("Youre out of gueses! The number was: ", random_num)
  }
