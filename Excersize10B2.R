# Excercise10b.R

guess_my_number <- function() {
  # Generate a random number between 1 and 100
  secret_number = sample(1:100, 1)
  
  # Set the maximum number of guesses and intiate attempt
  max_guesses = 10
  attempt = 0
  
  print("Guess a number between 1 and 100. You have ten tries")
  print(secret_number)
  
for (attempts in 1:10) {  
  if (attempt < 10) {
    user_guess = readline(prompt = "Enter any number : ")
    
    if (user_guess == secret_number) {
      print("you win")
      break
    } else if (user_guess < secret_number) {
        print("guess higher")
        attempt = attempt + 1
    } else if (user_guess > secret_number) {
        print("guess lower")
        attempt = attempt + 1
    }
    
    if (attempt == 9) {
      print("last try")
    }
  
  }
}
print("game over")
}

guess_my_number()  
  