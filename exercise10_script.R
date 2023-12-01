#### part 1 ----

# read in data
game <- read.table("UWvMSU_1-22-13.txt", sep = "\t", header = TRUE)
# create data frame for just msu
msu <- game[game$team == "MSU", ]
# create data frame for just uw
uw <- game[game$team == "UW", ]

# just msu
# create a column with the running total score
msu$cumulative = NA
# fill the first running total cell with first score
msu$cumulative[1] = msu$score[1]
# for the following columns, fill the each running total cell with the score +
# the previous running total
for (i in (2:27)) {
  msu$cumulative[i] = msu$score[i] + msu$cumulative[i - 1]
}

# repeat process above for uw
# create a column with the running total score
uw$cumulative = NA
# fill the first running total cell with first score
uw$cumulative[1] = uw$score[1]
# for the following columns, fill the each running total cell with the score +
# the previous running total
for (i in (2:23)) {
  uw$cumulative[i] = uw$score[i] + uw$cumulative[i - 1]
}

# combine msu and uw dataframes back into a single dataframe
game_cumulative = rbind(msu, uw)

## create summary plot
# load tidyverse
library(tidyverse)
# plot data
ggplot(data = game_cumulative, aes(x = time, y = cumulative, color = team)) +
  geom_line(size = 1) +
  theme_classic() +
  ylab("Cumulative Score") +
  scale_x_discrete("Quarter", limits = c(10, 20, 30, 40),
                   labels = c("First", "Second", "Third", "Fourth"))

#### part 2 ----

print("I'm thinking of a number between 1-100...", quote = FALSE)
for (i in (1:10)) {
  # have computer generate a number
  computer <- sample(1:100, 1)
  # ask for user-input number
  user <- scan(nmax = 1)
  # print user guessed number
  print(paste0("Guess: ", user), quote = FALSE)
  # compare the two using if else
  # if computer = user
  if (computer == user){
  # print correct
    print("Correct!", quote = FALSE)
    # if computer < user
  } else if (computer < user) {
    # print lower
    print("Lower", quote = FALSE)
    # if computer > user
  } else {
    # print higher
    print("Higher", quote = FALSE)
  }
  i = i + 1
}
