setwd("~/Biocomputing-Ex-10/")

# Read data
data <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

# Set scores to 0
uw_cumulative <- 0
msu_cumulative <- 0

# Create empty list to store data
Time <- numeric()
UW <- numeric()
MSU <- numeric()

# For loop
for (i in 1:nrow(data)) {
  if (data$team[i] == "UW") {
    uw_cumulative <- uw_cumulative + data$score[i]
  } else if (data$team[i] == "MSU") {
    msu_cumulative <- msu_cumulative + data$score[i]
  }
  Time <- c(Time, data$time[i])
  UW <- c(UW, uw_cumulative)
  MSU <- c(MSU, msu_cumulative)
}

# Merge lists into dataframe
cumulative_data <- data.frame(Time, UW, MSU)

# Plot
library(ggplot2)
ggplot(cumulative_data, aes(x = Time)) +
  geom_line(aes(y = UW), color = "blue") + #UW is blue
  geom_line(aes(y = MSU), color = "black") + #MSU is black
  ylab("Score") +
  xlab("Time (mins)")

## Question 2
# Make random number
number <- sample(c(1:100),1)
print("I am thinking of a number between 1 and 100...")

# For loop that's maxed out at 10
for (i in 1:10){
  guess <- as.integer(readline(prompt = "Guess: "))
  if (guess > number){
    print("Lower")
  }else if(guess < number){
    print("Higher")
  }else{
    print("Correct!")
    break 
  }
}
