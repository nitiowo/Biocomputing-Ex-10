#SPORTS GRAPH

#loading the data
data<- read.table("UWvMSU_1-22-13.txt", header = TRUE)
#making columns for cumulative scores 
data['UW_Cumulative_Score'] <- 0
data['MSU_Cumulative_Score'] <- 0

data$UW_Cumulative_Score[1] = data$score[1]

for (i in 2:length(data$score)) {
  if (data$team[i] == "UW") {
    data$UW_Cumulative_Score[i] = ((data$UW_Cumulative_Score[i-1])+data$score[i])
  } else {
    data$UW_Cumulative_Score[i] = ((data$UW_Cumulative_Score[i-1]))
  }
  if (data$team[i] == "MSU") {
    data$MSU_Cumulative_Score[i] = ((data$MSU_Cumulative_Score[i-1])+data$score[i])
  } else {
    data$MSU_Cumulative_Score[i] = ((data$MSU_Cumulative_Score[i-1]))
  }
}

#plotting the graph
library(ggplot2)

ggplot(data, aes(x=time)) +
geom_line(aes(y=UW_Cumulative_Score), color='blue', linewidth=1.5) +
geom_line(aes(y=MSU_Cumulative_Score), color='red', linewidth=1.5) +
labs(title='Cumulative Scores Over Time', x='Time', y='Cumulative Score')



#GUESSING GAME

# Function code making the guess my number game
guess_my_number <- function() {
  target_number <- sample(1:100, 1)
  max_attempts <- 10
  print("I'm thinking of a number 1-100...")

  for (attempt in 1:max_attempts) {
    user_guess <- as.integer(readline(prompt = "Enter your numeric guess: "))
    if (user_guess == target_number) {
      print("Correct!")
      return()
    } else if (user_guess < target_number) {
      print("Higher")
    } else {
      print("Lower")
    }
  }
  print("LOSER! You ran out of guesses.")
}

# Play the game
guess_my_number()
