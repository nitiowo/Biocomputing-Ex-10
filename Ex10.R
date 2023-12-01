#Set working directory
setwd("C:/Users/chris/OneDrive/Desktop/R/BioComputing")

#Load ggplot
library(ggplot2)

# Read in txt file
data <- read.table("UWvMSU_1-22-13.txt", header = TRUE)
total_score <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

# Loop through each row in the score data and calculate the cumulative scores
for(i in 1:nrow(data)) {
  if(data$team[i] == "UW") {
    UW_score<-UW_score + data$score[i]
    total_score$score[i]<-UW_score
  } else {
    MSU_score<-MSU_score  + data$score[i]
    total_score$score[i]<-MSU_score
  }
}

# Plot the graph
ggplot(total_score, aes(x = time, y=score)) +
  geom_line(aes(color=team)) +
  xlab("Time") +
  ylab("Score")
  theme_classic()

#Part 2: Number Game
game <- function() {
    attempts <- 10 #number of attempts allowed
    rng <- sample(1:100, 1) # pick a random number
    cat("I'm thinking of a number 1-100...\n") #text for the game
    
    for (i in 1:attempts) { #iterate for every attempt
      guess <- as.numeric(readline(prompt = "Guess: ")) #code for each guess
      if (is.na(guess)) {
        cat("Try harder fool.\n")
        next
      }
      if (guess == rng) { #code if you win
        cat("lo hicimos!", rng, "\n")
        return(TRUE)
      } else if (guess > rng) { #code if number is too low
        cat("guess lower\n")
      } else {
        cat("guess higher\n") #code if number is too high
      }
    }
    
    cat("you failure. the correct number was", random_number, "\n") #code if you fail
    return(FALSE)
}
    
  