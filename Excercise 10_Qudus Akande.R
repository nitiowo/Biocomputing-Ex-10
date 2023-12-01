#Excercise 10

#Question 1: Using the score-by-score information to generate a graph

#Load graph plot library
library (ggplot2)
library (cowplot)

#Load the .txt file
setwd("~/Desktop/Biocomputing/Excercise 10")
score <- read.table("UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors = FALSE)
head(score)
dim(score)
UW <- score[score$team == "UW", ]
MSU <- score[score$team == "MSU", ]
UW$UW_sum <- NA
MSU$MSU_sum <- NA

UW[1,4] <- UW[1,3]
MSU[1,4] <- MSU[1,3]
for (i in 2:nrow(UW)) {
  UW[i,4] <- UW[i-1,4] + UW[i, 3]
  i <- i+1
  }
  
for (j in 2:nrow(MSU)) {
  MSU[j,4] <- MSU[j-1,4] + MSU[j,3]
  i <- i+1
}

#Plot the graph.
ggplot() + geom_line(data = UW, aes(x = time, y = UW_sum), color = 'green') +
  geom_line(data = MSU, aes (x = time, y = MSU_sum), color = 'yellow') +
  xlab("time(min)") +
  ylab("score") +
  theme_classic()



#Question 2: Write a game called “guess my number”.
Random <- sample(1:100, 1)

player_input <- function(){
  for (i in 1:11){
    #prompt user to input a number
    number <- readline(cat(sprintf("Guess")))
  
    #check for higher or lower
    if (number > random){
      print("lower")
      i <- i+1
    }else if (nummber < random){
      printer("Higher")
      i <- i+1
    }else{
      print("correct!")
      break
    }
    if (i == 11){
      print("Sorry game over!")
    break
      }
    }
}
player_input()
