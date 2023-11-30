random <- sample(1:100, 1)

get_user_input <- function(){
  for (i in 1:11){
    # Prompt the user for input
    number <- readline(cat(sprintf("Guess")))
    
    #check higher or lower
    if (number > random){
      print("Lower")
      i <- i+1
    } else if (number < random){
      print("Higher")
      i <- i+1
    } else{
      print("Correct!")
      break
    }
    if (i == 11){
      print("Sorry you used up all your 10 chances!")
      break
    }
  }
}
get_user_input()

