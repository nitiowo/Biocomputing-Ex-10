#John LeSage
#Biocomputing Exercise 10, 11/29/23

#Setting up the exercise
#Question 1

#Question 2: Guess a number
myNum <- as.numeric(sample(100,1))
for(i in 1:10){
  myGuess <- readline("Type your guess:")
  if(myGuess<myNum){
    print("Too low, try again")
  } else if(myGuess>myNum){
    print("Too high, try again")
  } else {
    print("That is correct!")
    break
  }}



