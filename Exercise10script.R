#Conde Exercise10
#First, set working directory and read data from the provided file
setwd("/Users/mikeconde/Desktop/Biocomp/Rpractice")
library(ggplot2)
library(cowplot)
info <- read.table("UwvMSU_1-22-13.txt", header=TRUE, sep = "\t")

#Part 1; need cumulative score variables, and create vectors for these scores
UW_score <- 0
MSU_score <- 0
UW-cum <- numeric(length = nrow(info))
MSU_cum <- numeric(length = nrow(info))

#Calculate the cumulative scores
for (i in 1:nrow(info)) {
  if (info$team[i] == "UW") {
    UW_score <- UW_score + info$score[i] }
  else {
    MSU_score <- MSU_score + info$score[i] }
  UW-cum[i] <- UW_score
  MSU-cum[i] <- MSU_score
}
#Plot Line Graph
plot(info$time, UW-cum, type = "l", col = "red", ylim = c(0, max(UW_cum, MSU_cum)), xlab = "Time (min)", ylab = "Score", main = "Wisconsin vs MSU")
lines(info$time, MSU_cum, col = "darkgreen")
legend("bottomright", legend = c("University of Wisconsin", "MSU"), col = c("red", "darkgreen"), lty =1)

#Part 2: Guess my number
play <- function() {
  randomnum <- sample(1:100, 1)
  cat("I'm thinking of a number from 1-100...\n")
  for (i in 1:10) {
    user_guess <- as.numeric(readline(prompt = "Guess: "))
    if (user_guess == randomnum) {
      cat("Nice, You did it.\n")
      break
    } else {
      if (user_guess < randomnum) {
        cat("Higher\n")
        } else {
        cat("Lower\n")
        }
    }
    if (i == 10) {
      cat("You are very, very wrong. The correct number is ", randomnum, ".\n")
    }
  }
}
play()
