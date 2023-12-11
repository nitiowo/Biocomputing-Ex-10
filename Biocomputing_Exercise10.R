#Part 1
# Read the data from the file
data <- read.table("UWvMSU_1-22-13.txt", header = FALSE, col.names = c("Time", "Team", "Score"))

# Convert Score column to numeric
data$Score <- as.numeric(data$Score)

# Create a new column to store cumulative scores for each team
data$CumulativeScore_UW <- 0
data$CumulativeScore_MSU <- 0

# Loop through each row to calculate cumulative scores
for (i in 1:nrow(data)) {
  if (data$Team[i] == "UW") {
    data$CumulativeScore_UW[i] <- data$Score[i] + ifelse(i > 1, data$CumulativeScore_UW[i - 1], 0)
    data$CumulativeScore_MSU[i] <- ifelse(i > 1, data$CumulativeScore_MSU[i - 1], 0)
  } else {
    data$CumulativeScore_MSU[i] <- data$Score[i] + ifelse(i > 1, data$CumulativeScore_MSU[i - 1], 0)
    data$CumulativeScore_UW[i] <- ifelse(i > 1, data$CumulativeScore_UW[i - 1], 0)
  }
}

# Plot the cumulative scores over time
plot(data$Time, data$CumulativeScore_UW, type = "l", col = "blue", xlab = "Time", ylab = "Cumulative Score", main = "UW vs MSU Basketball Game")
lines(data$Time, data$CumulativeScore_MSU, type = "l", col = "green")
legend("topright", legend = c("UW", "MSU"), col = c("blue", "green"), lty = 1)

# Add points to represent individual scores
points(data$Time, data$CumulativeScore_UW, col = "blue")
points(data$Time, data$CumulativeScore_MSU, col = "green")

# Add a grid for better readability
grid()

#Part 2 
# Function to play the Guess My Number game
guess_my_number <- function() {
  # Generate a random number between 1 and 100
  secret_number <- sample(1:100, 1)
  
  cat("I'm thinking of a number 1-100...\n")
  
  # Allow the player to make up to 10 guesses
  for (attempt in 1:10) {
    # Get user input for the guess
    user_guess <- as.numeric(readline(prompt = paste("Guess", attempt, ": ")))
    
    if (is.na(user_guess)) {
      cat("Invalid input. Please enter a valid number.\n")
      attempt <- attempt - 1  # Decrement attempt counter for invalid input
      next
    }
    
    if (user_guess < secret_number) {
      cat("Higher\n")
    } else if (user_guess > secret_number) {
      cat("Lower\n")
    } else {
      cat("Correct! You guessed it in", attempt, "attempts.\n")
      return(invisible())  # Exit the function
    }
  }
  
  cat("Sorry, you've run out of attempts. The correct number was", secret_number, ".\n")
}

# Run the game
guess_my_number()