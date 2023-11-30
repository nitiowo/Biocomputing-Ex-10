#Start in working directory that includes the file "UWvMSU_1-22-13.txt"
#1)Generate graph of cumulative score over time for game data compared in the file
##Tip: Generate dataframe with cumulative score for each team whenever either team scores
#2)Write game called "guess my number" where computer generates number between 1 and 100 randomly, user types a number, and computer tells if it is higher or lower or correct and player can guess up to 10 times 
#Create a vector containing numbers 1 through 100
numbers<-c(1:100)
#Computer generates a random number from the vector created above and saves as random
random<-sample(numbers,1)
#Prompts user to enter a number and then user enters a number
guess<-readline(prompt = "I'm thinking of a number 1-100...")
#Computer determines whether number is higher or lower and use if else statement to generate a response
if(guess<=random){
  if(guess<random){
    print("Higher")
  }else{
    print("Correct!")
  }
}else{
  print("Lower")
}