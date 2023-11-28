# Biergans Exercise 10

# Part 1

# Read the data from the file
data <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

# Cumulative score variables
UW_score <- 0
MSU_score <- 0

# Create vectors for cumulative scores
UW_cumulative <- numeric(length = nrow(data))
MSU_cumulative <- numeric(length = nrow(data))

# Calculate cumulative scores
for (i in 1:nrow(data)) {
  if (data$team[i] == "UW") {
    UW_score <- UW_score + data$score[i]
  } else {
    MSU_score <- MSU_score + data$score[i]
  }
  UW_cumulative[i] <- UW_score
  MSU_cumulative[i] <- MSU_score
}

# Plotting the Line Graph
plot(data$time, UW_cumulative, type = "l", col = "darkred", ylim = c(0, max(UW_cumulative, MSU_cumulative)), xlab = "Time (minutes)", ylab = "Score", main = "University of Wisconsin vs Michigan State University")
lines(data$time, MSU_cumulative, col = "darkgreen")
legend("bottomright", legend = c("Univeristy of Wisconsin", "Michigan State University"), col = c("darkred", "darkgreen"), lty = 1)

# Part 2

# Generate a random number between 1 and 100
secret_number <- sample(1:100, 1)

cat("I'm thinking of a number 1-100...\n")

# Allow up to 10 guesses
for (attempt in 1:10) {
  cat("Guess: ")
  guess <- as.integer(readline())
  
  # Check if the guess is correct, too high, or too low
  if (guess == secret_number) {
    cat("Correct!\n")
    break
  } else if (guess < secret_number) {
    cat("Higher\n")
  } else {
    cat("Lower\n")
  }
  
  # If this was the last attempt
  if (attempt == 10) {
    cat(sprintf("You have reached the maximum number of attempts. The number was %d.\n", secret_number))
  }
}
