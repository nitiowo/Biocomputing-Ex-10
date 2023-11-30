#John LeSage
#Biocomputing Exercise 10, 11/30/23

#Setting up the exercise
setwd("~/Desktop/Exercise_10")
#navigates R to the Exercise_10 directory where my files are stored
gameData <- read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")
#loads the UW vs MSU game into a data frame with columns for time, team, and points scored
library(ggplot2)
library(cowplot)
#loads in the R packages to graph the data


#Question 1
#setting up data frames for question
header <- c("Time", "Points") 
MSU_Points <- data.frame(matrix(ncol=2, nrow=nrow(gameData[gameData$team=="MSU",]))) #creates an empty data frame with 2 columns and the number of rows in which MSU scores
colnames(MSU_Points) <- header #attaches the "Time" and "Points" labels as headers to the MSU data frame
UW_Points <- data.frame(matrix(ncol=2, nrow=nrow(gameData[gameData$team=="UW",]))) #creates an empty data frame with 2 columns and the number of rows in which UW scores
colnames(UW_Points) <- header #attaches the "Time" and "Points" labels as headers to the UW data frame

#starting variables which our for loop will add to
UW_Time <- 0 
UW_Score <- 0
MSU_Time <- 0
MSU_Score <- 0
RowNumUW <- 0
RowNumMSU <- 0


#Making the for loop
for(i in 1:nrow(gameData)){ #repeats for each time a team scored (50x)
  if(gameData$team[i] == "UW"){ #if UW scores
    UW_Score <- UW_Score + gameData$score[i] #add points UW scored to running total
    UW_Time <- gameData$time[i] #creates a variable of game time when UW scores
    RowNumUW <- RowNumUW + 1 #creates a variable to index the UW data set
    UW_Points$Points[RowNumUW] <- UW_Score #populates the "Points" column of the UW data frame row by row 
    UW_Points$Time[RowNumUW] <- UW_Time #populates the "Time" column of the UW data frame row by row 
  }else{ #if MSU scores
    MSU_Score <- MSU_Score + gameData$score[i] #add points MSU scored to running total
    MSU_Time <- gameData$time[i] #creates a variable of game time when MSU scores
    RowNumMSU <- RowNumMSU + 1 #creates a variable to index the MSU data set
    MSU_Points$Points[RowNumMSU] <- MSU_Score #populates the "Points" column of the MSU data frame row by row 
    MSU_Points$Time[RowNumMSU] <- MSU_Time #populates the "Time" column of the MSU data frame row by row 
  }}
    
#create graph to visually show data
ggplot()+ #creates two line graphs in one plot 
  geom_line(data=UW_Points, aes(x=Time, y=Points), color="maroon") + #line graph with team colors of UW
  geom_line(data=MSU_Points, aes(x=Time, y=Points), color="forestgreen") + #line graph with team colors of MSU
 xlab("Time elapsed in game") + ylab("Points scored") + ggtitle("UW vs MSU, 1/22/13") #extra aesthetics
      


#Question 2: Guess a number
print("Let's play guess my number!")
myNum <- as.numeric(sample(100,1))
#computer randomly chooses 1 integer between 0-100
for(i in 1:10){
  myGuess <- readline("Type your guess:") #stores user input as a variable
  if(myGuess<myNum){
    print("higher")
  } else if(myGuess>myNum){
    print("lower")
  } else {
    print("Correct!")
    break #ends loop early since user has guessed correctly and finished the game
  }}


