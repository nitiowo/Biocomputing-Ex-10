#### part 1 ----

# read in data
game <- read.table("UWvMSU_1-22-13.txt", sep = "\t", header = TRUE)
# create data frame for just msu
msu <- game[game$team == "MSU", ]
# create data frame for just uw
uw <- game[game$team == "UW", ]



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
