# Exercise 10
# Number 1
# install and load ggplot2
install.packages("ggplot2")
library(ggplot2)
# load data from UWvsMSU_1-22-13.txt using read.table and make the following adjustments because it is tab-delimited
data <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep='\t')
# initialize cumulative scores
uw_cumulative <- 0
msu_cumulative <- 0
# create a dataframe to store cumulative scores
cumulative_scores <- data.frame(Time = numeric(0), UW_Score = numeric(0), MSU_Score = numeric(0))
# iterate through each row in the data
for (i in 1:nrow(data)) {
  time <- data$time[i]
  team <- data$team[i]
  score <- data$score[i]
# update cumulative scores based on the scoring team
  if (team == 'UW') {
    uw_cumulative <- uw_cumulative + score
  } else if (team == 'MSU') {
    msu_cumulative <- msu_cumulative + score
  }
# append the cumulative scores to the dataframe
  cumulative_scores <- rbind(cumulative_scores, c(time, uw_cumulative, msu_cumulative))
}
# rename columns
colnames(cumulative_scores) <- c('Time', 'UW_Score', 'MSU_Score')
# create a ggplot line graph
plot <- ggplot(cumulative_scores, aes(x = Time)) +
  geom_line(aes(y = UW_Score, color = "UW"), size = 1, linetype = 'solid') +
  geom_line(aes(y = MSU_Score, color = "MSU"), size = 1, linetype = 'solid') +
  labs(title = 'UW vs MSU Basketball Game - Cumulative Score', x = 'Time', y = 'Cumulative Score') +
# add custom colors to match the team colors
  scale_color_manual(values = c("UW" = "red", "MSU" = "green")) +
  theme_minimal() 
# show the plot
print(plot)

# Number 2
# create a function for guess my number
guess_my_number <- function() {
# generate a random number between 1 and 100
secret_number <- sample(1:100, 1)
cat("I'm thinking of a number 1-100...\n")
# allow 10 guesses
for (i in 1:10) {
# allow number to type in a numerical guess
user_guess <- as.numeric(readline("Guess: "))
# check if the guess is correct
  if (user_guess == secret_number) {
    cat("Correct!\n")
    break
  } else if (user_guess < secret_number) {
    cat("Higher\n")
  } else {
    cat("Lower\n")
  }
  }
# if the loop completes without a correct guess
  if (i == 10) {
    cat("Sorry, you've run out of attempts. The correct number was", secret_number, "\n")
  }
}
# run the game
guess_my_number()