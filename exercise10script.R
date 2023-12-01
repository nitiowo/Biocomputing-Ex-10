setwd("~/Desktop/shell-lesson-data/exercises/Biocomputing-Ex-10")

# Problem 1
# generate a graph similar to the example based on data from UWvMSU_1-22-13.txt

# read in data
gamedata <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
# sort data by team
UW_data<- gamedata[gamedata$team == 'UW',]
MSU_data <- gamedata[gamedata$team == 'MSU',]

# find scores throughout the game and save as a data frame
UW_cumulativescore_list<-cumsum(UW_data$score)
UW_cumulativescore<- as.data.frame(UW_cumulativescore_list)
MSU_cumulativescore_list<-cumsum(MSU_data$score)
MSU_cumulativescore <- as.data.frame(MSU_cumulativescore_list)


# make a variable for the time points where a point was scored
times_UW<-sort(unique(c(UW_data$time)))
times_MSU<-sort(unique(c(MSU_data$time)))

# make a data frame for cumulative scores for each team
cumulative_scores_UW<-data.frame(time=times_UW,
                              UW_score=0)
cumulative_scores_MSU<-data.frame(time=times_MSU,
                                 MSU_score=0)

# replace the empty cumulative scores data frame with the cumulative scores for each team
# iterate through the UW_data
for(i in 1:nrow(cumulative_scores_UW)){
  for(x in 1:nrow(UW_data)){
      if(cumulative_scores_UW$time[i] == UW_data$time[x]){
        cumulative_scores_UW$UW_score[i] <- UW_cumulativescore$UW_cumulativescore_list[x]
      }
  }
}
# iterate through the MSU data
for(b in 1:nrow(cumulative_scores_MSU)){
  for(w in 1:nrow(MSU_data)){
   if(cumulative_scores_MSU$time[b] == MSU_data$time[w]){
    cumulative_scores_MSU$MSU_score[b] <- MSU_cumulativescore$MSU_cumulativescore_list[w]
  }
}
}


# load ggplot
library(ggplot2)

# make the graph
gameGraph <- ggplot ()+
  geom_line(data=cumulative_scores_UW, aes(x=time, y=UW_score), color="red") +
  geom_line(data=cumulative_scores_MSU, aes(x=time, y=MSU_score), color="green") +
  theme_bw() +
  xlab("Time") +
  ylab("Score")

# display graph
gameGraph

# Problem 2
# make required variables for the number game
interval <- c(1:100)
maxGuesses=10
correctGuess<-FALSE

# create game through a function
randomNumbergame<- function(interval, maxGuesses){
  randomnumber<-sample(interval,1) # have the computer choose a random number
  for(i in 1:maxGuesses){ #iterate through a specified number of guesses
      guessInput<-readline("Guess a number 1-100: ") # get user input
      guess<- as.numeric(guessInput) # convert user input to a numeric
    # check if user guess is higher or lower than the answer
      if(guess>randomnumber){
      print("Lower!") 
    }else if(guess<randomnumber){
      print("Higher!")
    }else{
      print("Congrats, you have guessed the number!")
      correctGuess<-TRUE
      break
    }
  }
  if(!correctGuess){
    if(!correctGue)
      print("Sorry, you didn't guess the number.")
    print(paste("The correct number was: ", randomnumber)) # tell user what the right answer is
  }
}
# play game
randomNumbergame(interval, maxGuesses)

