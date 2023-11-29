#Exercise 10 
#Question 1 - Generate Graph of cumulative scores against time for UWvsMSU score

#Set the working directory which contains the necessary files and download ggplot
setwd("/Users/jsobo/OneDrive/Documents/Intro to Biocomputing/Biocomputing-Ex-10/")
library("ggplot2")
#Reading the Data into R
UWvsMSU <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

#Creating another data set with 51 rows and 3 colums
cumulative_scores <- data.frame(matrix(0,nrow=51, ncol=3))
#Adding column names to the data set
colnames(cumulative_scores) <- c("Time", "UW_Score", "MSU_Score")
#Adding the times into the cumulative scores data set with 0 to start 
cumulative_scores$Time <- c(0, UWvsMSU$time)

#starting the for loop
for (i in 1:length(UWvsMSU$score)) {
  #Adjusted_cumulative_index to offset so that UWvsMSU starts counting from the second row instead of the first row of cumulative_scores. The i length is 50 and the adjusted_cumlative length is 51 as I was getting an error code that the lengths were different
  Adjusted_cumulative_index <- i + 1
  
  #Updating the UW score every time they scored and staying the same when they do not score
  if (UWvsMSU$team[i] == "UW") {
    cumulative_scores$UW_Score[Adjusted_cumulative_index] <- cumulative_scores$UW_Score[Adjusted_cumulative_index - 1] + UWvsMSU$score[i]
  } else {
    cumulative_scores$UW_Score[Adjusted_cumulative_index] <- cumulative_scores$UW_Score[Adjusted_cumulative_index - 1]
  }
  
  #Updating the MSU score every time they scored and staying the same when they do not score
  if (UWvsMSU$team[i] == "MSU") {
    cumulative_scores$MSU_Score[Adjusted_cumulative_index] <- cumulative_scores$MSU_Score[Adjusted_cumulative_index - 1] + UWvsMSU$score[i]
  } else {
    cumulative_scores$MSU_Score[Adjusted_cumulative_index] <- cumulative_scores$MSU_Score[Adjusted_cumulative_index - 1]
  }
}
#Creating the graph of the cumulative totals of both teams against time where the red line is UW and the green line is MSU
ggplot(cumulative_scores, aes(x = Time)) +
  geom_line(aes(y = UW_Score), color = "red") +
  geom_line(aes(y = MSU_Score), color = "forestgreen") +
  xlab("Time") +
  ylab("Score") +
  theme_classic() 

#Question 2 - Creating a Number guessing game
#Creating the custom function to play the game
Guess_The_Number_Game<-function(){
#Setting number of guesses to 10
  guesses <-10
  #Create a random number between 1-100 then have user guess the number if their guess is lower than the number printing "Higher" and if it is higher than the random number printing "Lower"
  random_number<-sample((1:100),1)
  print("I'm thinking of a number 1-100 can you guess it,?(You have 10 guesses)")
  for (i in 1:guesses) {
    guess<-readline("Guess: ")
    if (guess==random_number) {
      return("Correct!")
    } else if(guess<random_number) {
      print("Higher")
    } else {
      print("Lower")
    }
  }
  print("Sorry, You've ran out of guesses")
}
#Play the game by now running the custom function Guess_The_Number_Game()
Guess_The_Number_Game()

