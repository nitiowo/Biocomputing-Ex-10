randint = sample(1:100, 1)
step = 1
max_steps = 10

cat("I'm thinking of a number 1-100...\n")

while(step != max_steps) {
  guess = readline("Guess: ")
  if (guess == randint) {
    cat("Correct!\n")
    break
  } else if (guess < randint) {
    cat("Higher!\n")
    step = step + 1
  } else if (guess > randint) {
    cat("Lower!\n")
    step = step + 1
  } else if (step == max_steps) {
    cat("Game is over.\n")
    break
  }
}

