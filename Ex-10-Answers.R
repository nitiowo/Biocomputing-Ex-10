#Exercise 10
#2023-11-26



#Question 1
library(ggplot2)


#reading in info
UV = read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)
#dim(UV)
#head(UV)

#Empty Matrix that stores running score (starts with zero)
plotData<- matrix(0, nrow = nrow(UV)+1, ncol =3 )


#loop that adds score to previous score to have a running total
for (i in 1:nrow(UV)){
  if(UV$team[i]=="UW"){ #if the team is UW them do following code
    #stores time and score data into respective places in the matrix
    plotData[i+1,2]<-UV$score[i]+plotData[i,2] #the [i+1] is used to add data into the next row so that you don't override pervious data
    plotData[i+1,1]<-UV$time[i]         
    plotData[i+1,3]<-plotData[i,3]
  }else {#for anything that is not UW (MSU) do the following score
    plotData[i+1,3]<-UV$score[i]+plotData[i,3]
    plotData[i+1,1]<-UV$time[i] 
    plotData[i+1,2]<-plotData[i,2]
  }
}
plotData

#data needs to be in a data frame to plot so this functions turns the matirx into a dataframe
plotDataDF<-as.data.frame(plotData)

#plot of data


ggplot()+
  geom_line(data=plotDataDF, mapping = aes(x=V1, y=V2), color="pink")+
  geom_point(data=plotDataDF, mapping = aes(x=V1, y=V2), color="pink")+
  geom_line(data=plotDataDF, mapping = aes(x=V1, y=V3), color="purple")+
  geom_point(data=plotDataDF, mapping = aes(x=V1, y=V3), color="purple")+
  labs(x="Time", y="Score", title ="Score Vs. Time" )+
  theme_bw()


#Question 2

#generates a # between 1 through 10
num<-sample(1:100,1)
#num

#prints statement
print("Guess a number between 1 and 100")

#loop to continue guessing until you guess the correct number
while(guess !=num){
  #interactive part that allows the user to make a guess
  guess<- readline(prompt ="Enter interger: ")
  #if else statement that checks if the number guessed is correct
  if (guess == num)
  {cat("Correct!")}
  else if (guess>num)
  {cat("Lower")}
  else
    {cat("Higher")}
}
  
