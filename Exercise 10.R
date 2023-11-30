#Question 1

library(ggplot2)
#reading the data set in and calling it scores
scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

#creating subsets of the full dataset for each team
UW <- subset(scores, team == "UW")
MSU <- subset(scores, team == "MSU")

#making a data frame for each team then using the cumsum function to get the cumulative scores for each time -> found the cumsum function on RDocumentation.org
UW_cumulative <- data.frame(
  Time = c(UW$time),
  Scores = cumsum(UW$score)
)
MSU_cumulative <- data.frame(
  Time = c(MSU$time),
  Scores = cumsum(MSU$score)
)

#creating one plot and plotting each data frame, assigning colors to each line, then labeling the axis
p = ggplot() +
  geom_line(data = UW_cumulative, aes(x = Time, y = Scores), color = "red") +
  geom_line(data = MSU_cumulative, aes(x = Time, y = Scores), color = "blue") +
  xlab('Time') +
  ylab('Score')

#code to print the plot with both graphs
print(p)


#Question 2

#creating the function called guess_my_number
guess_my_number <- function() {
  #using the sample function to generate a random number 1-100
  number <- sample(1:100, 1)
  #creating a variable that is initially set equal to zero
  guesses <- 0
  #code to print the prompt
  print("I'm thinking of a number 1-100...")
  #using a while loop to iterate through the code for when the variable guesses is less than 10
  while (guesses < 10) {
    #user input prompt
    user_input <- as.integer(readline(prompt = "Guess: "))
    #adding one to guesses after each user inputted guess
    guesses <- guesses + 1
    #using if/elif/else statements to give feedback to the user depending on if their guess is higher/lower/equal to the computer's randomly generated number
    if (user_input < number) {
      print("Higher")
    } else if (user_input > number) {
      print("Lower")
    } else {
      print("Correct!")
      break
    }
    }
  }

#function call
guess_my_number()


    
    
   
    
   
