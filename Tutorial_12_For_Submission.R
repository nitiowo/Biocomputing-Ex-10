#Tutorial 12 Submission

#Exercise 1
#Import Data
scores <- read.table("C:/Users/grace/Desktop/Biocomputing 2023/R/Tutorials/Biocomputing-Ex-10/UWvMSU_1-22-13.txt")
#Generate dataframe for the cumulative scores
time <- c(0)
UWScore <- c(0)
MSUScore <- c(0)
cumulativeScores <- data.frame(time,UWScore,MSUScore)
#For loop
for(i in 2:nrow(scores)){
  if(scores$V2[i]=="UW"){
    print(scores$V3[i])
  }
  else{
    print(scores$V3[i])
  }
}

#Exercise 2