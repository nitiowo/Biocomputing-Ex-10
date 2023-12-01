#Exercise 10: Intro to Biocomputing
#Lindsay Burgess


#Question 1: Generate a graph to plot the cumulative scores of UW and MSU basketball game
rm(list=ls())

# read data from the UW vs MSU text file
data <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

# create variables to store the cumulative scores
uwscore <- 0
msuscore <- 0

# Create a data frame to store the new information with cumulative scores of each team
cumulativescoredata <- data.frame(Time = numeric(nrow(data)),
                              Team = character(nrow(data)),
                              Score = numeric(nrow(data)),
                              UW_Cumulative = numeric(nrow(data)),
                              MSU_Cumulative = numeric(nrow(data)))

# Create a loop to compute the cumulative score with each row
for (i in 1:nrow(data)) {
  team <- data$team[i]
  score <- data$score[i]
  time <- data$time[i]
  
  # Separate cumulative scores based on if the score was from UW or MSU
  if (team == "UW") {
    uwscore <- uwscore + score
  } else if (team == "MSU") {
    msuscore <- msuscore + score
  }
  
  # Assign values to the rows in the data frame
  cumulativescoredata[i, ] <- c(time, team, score, uwscore, msuscore)
}

# Assign names to the columns of the data frame
colnames(cumulativescoredata) <- c("Time", "Team", "Score", "UW_Cumulative", "MSU_Cumulative")

# Show the data saved with cumulative scores
print(cumulativescoredata)


#open ggplot2
library(ggplot2)

ggplot(cumulativescoredata, aes(x = Time)) +
  geom_line(aes(y = UW_Cumulative, color = "UW"), size = 1) +
  geom_line(aes(y = MSU_Cumulative, color = "MSU"), size = 1) +
  labs(title = "Cumulative Scores of UW and MSU vs Time", x = "Time", y = "Cumulative Score") +
  scale_color_manual(values = c("UW" = "blue", "MSU" = "red"), labels = c("UW", "MSU")) +
  theme_minimal()





#2 Write a game called “guess my number”. The computer will generate a random number between 1 and 100. 
#The user types in a number and the computer replies “lower” if the random number is lower than the guess, “higher” if the random number is higher, and “correct!” if the guess is correct. 
#The player can continue guessing up to 10 times.

# create function to play the "guess my number" game
guess_my_number <- function() {
  # use sample to generate a random number in the game
  randomnumber <- sample(1:100, 1)
  attempts <- 0 #create a variable that stores the number of attempts in the game
  
  print("Welcome to guess my number") #print a welcome statement for the start of the game
  print("The answer is a number between 1 and 100.") #print rules for the game
  print("You have a total of 10 attempts to guess the correct number.")
  
  for (attempts in 1:10) { #create a for loop to enter your guess 
    guess <- as.integer(readline("Enter your guess: "))
    
    if (guess < randomnumber) { #tells you after each guess whether the guess was too high or too low or the correct number
      print("Higher! Try again.")
    } else if (guess > randomnumber) {
      print("Lower! Try again.")
    } else {
      print(paste("Correct! You guessed the number", randomnumber, "in", attempts, "attempts."))
    }
  }
  
  if (attempts == 10) { 
    print(paste("Sorry, you've reached the maximum number of attempts. The number was", randomnumber))
  }
}

# play the game
guess_my_number()







