#Rhett Bianchi
#Exercise 10

#Part 1: MSU.vs.UW plot

# Load the ggplot2 library
library(ggplot2)

# Read the data from the text file
score <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")

# Initialize score variables and vectors
MSU_total <- c()
UW_total <- c()
MSU_points <- 0
UW_points <- 0

# Loop through each row in the score data and calculate the cumulative scores
for(i in 1:nrow(score)) {
  if(score$team[i] == "UW") {
    UW_points <- UW_points + score$score[i]
  } else {
    MSU_points <- MSU_points + score$score[i]
  }
  UW_total <- c(UW_total, UW_points)
  MSU_total <- c(MSU_total, MSU_points)
}

# Combine time and scores into a data frame for plotting
total_score <- data.frame(Time = score$time, UW = UW_total, MSU = MSU_total)

# Plot the graph
ggplot(total_score, aes(x = Time)) +
  geom_line(aes(y = UW, color = "UW")) +
  geom_line(aes(y = MSU, color = "MSU")) +
  labs(x = 'Time', y = 'Points', title = 'Game Score Summary') +
  theme_classic() +
  scale_color_manual(values = c("UW" = "red", "MSU" = "green"))

# Store the plot in a variable
my_plot <- ggplot(total_score, aes(x = Time)) +
  geom_line(aes(y = UW, color = "UW")) +
  geom_line(aes(y = MSU, color = "MSU")) +
  labs(x = 'Time', y = 'Points', title = 'Game Score Summary') +
  theme_classic() +
  scale_color_manual(values = c("UW" = "red", "MSU" = "green"))

# Print the plot
print(my_plot)

# Save the plot to a file
ggsave("game_score_summary.png")


#Part 2: guess the number game

# Guessing game function
guess_game <- function() {
  attempts <- 10
  random_number <- sample(1:100, 1)
  cat("I'm thinking of a number 1-100...\n")
  
  for (i in 1:attempts) {
    guess <- as.numeric(readline(prompt = "Guess: "))
    if (is.na(guess)) {
      cat("That's not a number. Please try again.\n")
      next
    }
    if (guess == random_number) {
      cat("Correct! The number was", random_number, "\n")
      return(TRUE)
    } else if (guess > random_number) {
      cat("Lower\n")
    } else {
      cat("Higher\n")
    }
  }
  
  cat("Sorry, the correct number was", random_number, ". You are out of guesses.\n")
  return(FALSE)
}
