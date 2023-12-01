#recreating wisco v msu game graph
#reading in data
ball <- read.table("UWvMSU_1-22-13.txt", header=T)

#creating wisco and msu subsets of ball data frame
wisco <- ball[ball$team=="UW",]
msu <- ball[ball$team=="MSU",]

#creating empty vectors to add scores to
wisco_sum <- numeric(nrow(wisco))
msu_sum <-numeric(nrow(msu))

#adding up msu vector
for (i in 1:nrow(msu)){
  msu_sum[i] <- sum(msu$score[1:i])
}

#add 0 for initial score
msu_sum<- c(0, msu_sum)

#adding up wisco vector
for (i in 1:nrow(wisco)){
  wisco_sum[i] <- sum(wisco$score[1:i])
}
#add 0 for initial score
wisco_sum <- c(0, wisco_sum)

#adding starting score
wisco_start <- data.frame(time = 0, team= "UW", score= 0)
wisco <- rbind(wisco_start, wisco)

#adding starting score
msu_start <- data.frame(time = 0, team= "MSU", score= 0)
msu <-rbind(msu_start, msu)

#need to add these sum columns to wisco and msu data frames because i need the relationship
#between sum and time scored for the ggplot
wisco <- cbind(wisco, wisco_sum)
msu <- cbind(msu, msu_sum)

#create ggplot
library("ggplot2")
ggplot(data=NULL, aes(x=ball$time, y=ball$score))+
  geom_line(data=wisco, aes(x=wisco$time, y=wisco$wisco_sum), color="red") +
  geom_line(data=msu, aes(x=msu$time, y=msu$msu_sum), color="darkgreen") +
  xlab("time")+ ylab("score")+ ggtitle("Wisco v MSU")


#problem 2

#generating a random number
random_number <- sample(1:100,1)

#only get 10 guesses before the game is over
for (i in 1:11){
  #didn't guess correctly within 10 guesses
  if (i==11){
    print("Too many guesses")
    break
  #prompting user to make a guess
  } else { guess <- as.numeric(readline("Guess: "))
  }
  #too low
  if (guess < random_number) {
    print("Higher")
  #too high
  } else if (guess > random_number) {
    print("Lower")
  #user is right
  } else {
    print("Correct!")
    break
  }

}
    


  