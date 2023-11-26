# Exercise 10
# author: Qiushi Peng

library(ggplot2)


# Task 1
setwd("/Users/pengqiushi/Documents/Biocomputing")
scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

scores_uw <- 0
scores_msu <- 0

for (i in 1:nrow(scores)) {
  if(scores$team[i] == "UW"){
    scores_uw <- scores_uw + scores$score[i]
    scores$score[i] <- scores_uw 
  } else {
    scores_msu <- scores_msu + scores$score[i]
    scores$score[i] <- scores_msu 
  }
}


ggplot(data = scores, aes(x = time, y = score, color = team)) + 
  geom_line() +
  scale_x_continuous(breaks = seq(0, 60, by = 15)) +
  theme_bw()


# Task 2
number_to_guess <- sample(1:100, 1)
cat("I'm thinking of a number between 1 and 100.")

for (i in 1:10){
  cat("Guess:\n")
  guess <- as.integer(readline())
  if (guess < number_to_guess) {
    cat("Higher\n")
  } else if (guess > number_to_guess) {
    cat("Lower\n")
  } else {
    cat("Correct!")
    return(TRUE)
  }
}