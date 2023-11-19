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
