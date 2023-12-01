library(ggplot2)


# Question 1

# Read in data
Game <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

# Create column for cumulative score 
Game$CumulativeScore <- ave(Game$score, Game$team, FUN = cumsum)

# Create a line graph
ggplot(Game, aes(x = time, y = CumulativeScore, color = team))+
  geom_line(linewidth = 1.5) +
  labs(x = "Time", y = "Cumulative Score")+
  theme_minimal() +
  scale_x_continuous(breaks = c(5, 15, 25, 35), labels = c("1st", "2nd", "3rd", "4th"))+
  scale_color_manual(values = c("green", "red"))


# Question 2

# Create guess my number game function
GuessMyNumber <- function() {
  
  # Create random number between 1 and 100
  Number <- sample(1:100, 1)
  
  # Game starting prompt
  cat("I'm thinking of a number 1-100...")
  
  # For loop for 10 guesses
  for (i in 1:10) {
    
    # Store user input as a guess
    UserGuess <- as.integer(readline("Guess: "))
    
    # If else function to test user guess
    if (UserGuess == Number) {
      cat("Correct!")
      break
    }else if (UserGuess < Number){
      cat("Higher")
    }else{
      cat("Lower")
    }
  }
  
  # Stop game after 10 guesses
  if (i == 10) {
    cat(", no more guesses")
  }
}

# Run the game
GuessMyNumber()

