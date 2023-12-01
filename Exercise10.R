# Exercise 10 Hinkes

#1.Creating a graph for cumulative game scores

data <- read.table("UwvMSU_1-22-13.txt", header=TRUE)

#Creating vectors for team scores
UW_score <- 0
MSU_score <- 0
UW_cumulative <- numeric(length = nrow(info))
MSU_cumulative <- numeric(length = nrow(info))

#Creating a loop to determine cumulative scores
for (i in 1:nrow(info)) {
  if (data$team[i] == "UW") {
    UW_score <- UW_score + data$score[i] }
  else {
    MSU_score <- MSU_score + data$score[i] }
  UW_cumulative[i] <- UW_score
  MSU_cumulative[i] <- MSU_score
}

#Plots
plot(data()$time, UW_cum, type = "l", col = "blue", ylim = c(0, max(UW_cum, MSU_cum)), xlab = "Time (min)", ylab = "Score", main = "Wisconsin vs. MSU Game")
lines(data$time, MSU_cum, col = "lightblue")


#2. "Guess my Number" Game!!!

play <- function() {
  randomnum <- sample(1:100, 1)
  cat("I'm thinking of a number 1-100...\n")
  for (i in 1:10) {
    user_guess <- as.numeric(readline(prompt = "Guess: "))
    if (user_guess == randomnum) {
      cat("Congrats big boy.\n")
      break
    } else {
      if (user_guess < randomnum) {
        cat("Higher\n")
      } else {
        cat("Lower\n")
      }
    }
    if (i == 10) {
      cat("You suck at this game. The correct number was ", randomnum, ".\n")
    }
  }
}
play ()
