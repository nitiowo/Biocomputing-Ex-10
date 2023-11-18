#Tutorial 12 Submission

#Exercise 1
#Import Data
scores <- read.table("C:/Users/grace/Desktop/Biocomputing 2023/R/Tutorials/Biocomputing-Ex-10/UWvMSU_1-22-13.txt")
#Generate dataframe for the cumulative scores
time <- c(0)
UWScore <- c(0)
MSUScore <- c(0)
UWCurrentScore <- 0
MSUCurrentScore <- 0
cumulativeScores <- data.frame(time,UWScore,MSUScore)
#For loop
for(i in 2:nrow(scores)){
  if(scores$V2[i]=="UW"){
    UWCurrentScore <- UWCurrentScore + as.numeric(scores$V3[i])
    cumulativeScores[i] <- c(scores$V1[i],UWCurrentScore,MSUCurrentScore)
  }else{
    MSUCurrentScore <- MSUCurrentScore + as.numeric(scores$V3[i])
    cumulativeScores[i] <- c(scores$V1[i],UWCurrentScore,MSUCurrentScore)
  }
}

#Exercise 2