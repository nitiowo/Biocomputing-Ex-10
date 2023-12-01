# Exercise 10
library(ggplot2)

# #1 First, import the game data file (assuming file is in directory) 
df <- read.table(file="UWvMSU_1-22-13.txt",sep=",",header=TRUE)

# generate a data frame with a cumulative score for each team whenever either team scores
# df for MSU
MSUdf <- df[df[1:50,2] == "MSU",]
MSU-cum-score <- vector("numeric", nrow(MSUdf))
MSU-cum-score[1] <- MSUdf$score[1]

for(i in 2:nrow(MSUdf)){
  MSU-cum-score[i] <- MSUdf$score[i] + MSU-cum-score[i-1]
}

MSU-cum <- data.frame(time = MSUdf$time,
                      team = "MSU",
                      score = MSU-cum-score)
# df for UW
UWdf <- df[df[,2] == "UW",]
UW-cum-score <- vector("numeric", nrow(UWdf))
UW-cum-score[1] <- UWdf$score[1]

for(i in 2:nrow(UWdf)){
  UW-cum-score[i] <- UWdf$score[i] + UW-cum-score[i-1]
}

UW-cum <- data.frame(time = UWdf$time,
                      team = "UW",
                      score = UW-cum-score)

# Data frame of cumulative scores
MSU-merged <- merge(data.frame(time=df$time), MSU-cum, by = "time", all.time = TRUE)
UW-merged <- merge(data.frame(time=df$time), UW-cum, by = "time", all.time = TRUE)

ggplot()+
  geom_line(data = MSU-merged, aes(x=time, y=score), color = 'green')+
  geom_line(data = UW-merged, aes(x=time, y=score), color = 'purple')+
  labs(title = "Cumulative Scores of MSU and UW vs Time", x = "Time", y = "Score") +
  theme_minimal()

# #2 Guess My Number game
# Generate 1 integer from 1 to 100
randint <- sample(1:100,1)
guess <- 1
num = randint
# Ask user to input their guess
print("I'm thinking of a number from 1-100 ")
print("Can you guess my number in 10 guesses?")

# Keep asking again if incorrect
while(guess != num)
{
  # Prompt user for integer
  guess <- readline(prompt="Enter guess: ")
  if (guess == num) {
    # If guess is correct
    print("Correct!")
  }else if (guess < num) {
    # For output that is bigger than guess
    print("Higher")
    guesses = guesses+1
  }else if (guess > num) {
    # For output that is smaller than guess
    print("Lower")
    guesses = guesses+1
  }
  if (guesses < 10) {
    print("Good game")
  }else if (guesses > 10) {
    print("Sorry, you are out of guesses")
  }
  #This will loop as long as the guess is incorrect and there are less than 10 guesses
}

