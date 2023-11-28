#Exercise 10
#11/27/2023
#James Magas


#Part 2 - create a "guess my number" game

#clear previous contents
rm(list=ls())

#have computer generate random number between 1 and 100
number = sample(1:100,1)

#can modify number of guesses user gets
#starts out at 10
guesses = 10
#declare a variable to track if there have been 10 guesses
count = 0

print("I'm thinking of a number 1-100...")

#loop through 10 times at most, if they guess correct number exit loop with "break"
#accept user input as guess and store as variable y
#I need to declare user input as an integer rather than a character

for (i in 1:10){
  y = as.integer(readline("Guess: "))
  count = 1 + count
  if (count == guesses){
    print("Too many guesses.")
  }
  else{
    if (y > number){
      print("Lower")
      }
    else if (y < number){
      print("Higher")
      }
    else{
      print("Correct!")
#if got answer correct break out of the loop
      break
    }
  }
}
