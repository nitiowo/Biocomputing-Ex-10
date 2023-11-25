#Question 1
#set working directory
setwd("/Users/izabellalopez/Junior_yr/Biocomputing/Biocomputing-Ex-10")

#access library of ggplot functions
library(ggplot2)

#read in scores file
scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE)
scores <- data.frame(scores)

#starting cumulative score for both teams
msu_score <- 0
uw_score <- 0

#updates scores dataframe with cumatlive scores at each time stamp
for (i in 1:nrow(scores)){
  if (scores[i,2]=="UW"){
    uw_score <- uw_score + scores[i, 3]
    scores[i, 3] <- uw_score
  }
  else{
    msu_score <- msu_score + scores[i, 3]
    scores[i, 3] <- msu_score
  }
}
#plots the scores over time for each team
ggplot(scores, aes(x = time, y = score, color = team) +
  geom_line() +
  labs(title = "Scores Over Time",
       x = "Time",
       y = "Score") +
  scale_color_manual(values = c("UW" = "red", "MSU" = "blue")) +
  scale_linetype_manual(values = c("UW" = "solid", "MSU" = "solid"))

#Question 2
#gunction selects a random number between 1 and 100
number <- sample(c(1,100),1)
print("I am thinking of a number between 1 and 100...You have 10 tries to guess!")

#for loop that iterates through until number correctly guessed or once iterated through 10 times
for (i in 1:10){
    guess <- as.numeric(readline(prompt = "Guess a number: "))
    if (guess == number){
      print("Correct!")
      break
    }else if(guess < number){
        print("Higher!")
    }else{
      print("Lower!")
    }
}

