##tutorial due dec. 1
##Faith Schafer


getwd()
setwd("/Users/faithschafer/Downloads")

##question 1 : to make the game score results graph: 

##reading in data
basketball <- read.table("UWvMSU_1-22-13.txt", header=T)

##subsetting and creating empty vectors
uw <- basketball[basketball$team=="UW",]
msu <- basketball[basketball$team=="MSU",]

sumofuw<- numeric(nrow(uw))
sumofmsu <-numeric(nrow(msu))

##the msu vector
for (i in 1:nrow(msu)){
  sumofmsu[i] <- sum(msu$score[1:i])
}
sumofmsu<- c(0, sumofmsu)

##wisconsin vector
for (i in 1:nrow(uw)){
  sumofuw[i] <- sum(uw$score[1:i])
}
sumofuw <- c(0, sumofuw)

##adding starting scores
msu1 <- data.frame(time = 0, team= "MSU", score= 0)
msu <-rbind(msu1, msu)

uw1 <- data.frame(time = 0, team= "UW", score= 0)
uw <- rbind(uw1, uw)

##relationship between sum and time scored for the ggplot
uw <- cbind(uw, sumofuw)
msu <- cbind(msu, sumofmsu)

##create ggplot
library("ggplot2")
ggplot(data=NULL, aes(x=basketball$time, y=basketball$score))+
  geom_line(data=uw, aes(x=uw$time, y=uw$sumofuw), color="red") +
  geom_line(data=msu, aes(x=msu$time, y=msu$sumofmsu), color="green") +
  xlab ("time") +
  ylab ("score")


##question 2 : guess my number game

##creating the initial variable
random_number <- sample(1:100,1)

for (i in 1:10){
  guess <- as.numeric(readline("Guess: "))
  
  if (guess > random_number){
    print ("lower!")
  }else if (guess < random_number){
    print ("higher!")
  }else if (guess == random_number){
    print ("correct!")
  }
  if (i ==10){
    print ("Sorry, too many guesses. Try again later!")
  }
}

