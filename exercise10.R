# Exercise 10

library(ggplot2)

##1
df <- read.table('UWvMSU_1-22-13.txt', header = TRUE)
# setting up MSU df
msu_df <- df[df[,2] == "MSU",]

msu_cum_score <- vector("numeric", nrow(msu_df))
msu_cum_score[1] <- msu_df$score[1]

for(i in 2:nrow(msu_df)){
  msu_cum_score[i] <- msu_df$score[i] + msu_cum_score[i-1]
}

msu_cum <- data.frame(time = msu_df$time,
                      team = "MSU",
                      score = msu_cum_score)

# setting up UW df
uw_df <- df[df[,2] == "UW",]

uw_cum_score <- vector("numeric", nrow(uw_df))
uw_cum_score[1] <- uw_df$score[1]

for (i in 2:nrow(uw_df)){
  uw_cum_score[i] <- uw_df$score[i] + uw_cum_score[i - 1]
}

uw_cum <- data.frame(time = uw_df$time,
                     team = "UW",
                     score = uw_cum_score)

# IK my variables are sus but it makes sense

# Cummulative score dataframe
msu_merged <- merge(data.frame(time=df$time), msu_cum, by = "time", all.time = TRUE)
uw_merged <- merge(data.frame(time=df$time), uw_cum, by = "time", all.time = TRUE)

ggplot()+
  geom_line(data = msu_merged, aes(x=time, y=score), color = 'blue')+
  geom_line(data = uw_merged, aes(x=time, y=score), color = 'red')+
  labs(title = "Cummulative Scores of MSU and UW vs Time", x = "Time", y = "Score") +
    theme_minimal()
##2: Guess My Number

randint <- sample(1:100,1)
print("I'm thinking of a number from 1-100..")


while(1){
  usr_guess <- strtoi(readline(prompt = "Guess:"))
  if (usr_guess < randint){
    print("Higher")
  }
  else if (usr_guess > randint){
    print("Lower")
  }
  else{
    print("Correct!")
    break
  }
}
