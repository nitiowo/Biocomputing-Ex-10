# Exercise 10

library(ggplot2)

#1
df <- read.table('UWvMSU_1-22-13.txt', header = TRUE)
ggplot(data = df,
       aes(x = score, y = time)) +
  geom_point() +
  xlab("Score") +
  ylab("Time") +
  stat_smooth(method="lm") +
  theme_classic()


#2: Guess My Number

randint <- sample(1:100,1)
print("I'm thinking of a number from 1-100..")
usr_guess <- readline(prompt = "Guess:")

guess_func<-function(guesss_inpt, randint){
  if (usr_guess < randint){
    print("Higher")
  }
  else if (usr_guess > randint){
    print("Lower")
  }
}

while(usr_guess != randint){
  guess_func(usr_guess,randint)
}

print("Correct!")