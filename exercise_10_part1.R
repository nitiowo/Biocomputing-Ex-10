#Exercise 10
#11/27/2023
#James Magas


#Part 1 - create a line graph of the incremental cumulative scores of two
#basketball teams

#clear previous contents
rm(list=ls())

# load a package every time you wish to use it
library(ggplot2)
library(cowplot)

#import data and read the .txt file to a data frame

data=read.table(file="UWvMSU_1-22-13.txt",header=TRUE)
head(data)

#create a vector of the team column and call it team
team<-c(data$team)
#create a vector of the time column and call it time
time<-c(data$time)

#create a new data frame with the below headings and create empty vectors for each column
scores<-data.frame("Time" = numeric(length(time)), "MSU" = numeric(length(time)), "UW" = numeric(length(time)), stringsAsFactors = FALSE)


#create a variable that can be added to for each team value that can be incremented
uwprev = 0
uwcurr = 0

msuprev = 0
msucurr = 0
#create a loop that checks each row in "data" and accumulates points for the correct team
#the accumulated scores are added to the correct column and row each time the loop increments
for(j in 1:length(time)){
  if(team[j] == "MSU"){
    uwprev = data[j,3]
    uwcurr = uwprev + uwcurr
    scores[j,3] = uwcurr
    scores[j,2] = msucurr
    scores[j,1] = data[j,1]
  } else{
    msuprev = data[j,3]
    msucurr = msuprev + msucurr
    scores[j,2] = msucurr
    scores[j,3] = uwcurr
    scores[j,1] = data[j,1]
  }}

#create a row of zeroes at the top so that there is a starting time of zero and starting scores of zero
scores<-rbind(0,scores)
#finally print the data frame "scores" to make sure everything looks correct
scores



#for graph time is going to be x axis
#I will need to create a line of scores vs time for MSU and another for UW
#remove x tick marks
#make graph start at 0 in x-axis and y-axis


ggplot(scores, aes(x = Time)) +
     geom_line(aes(y = MSU), size = 2, color = "darkgreen") +
     geom_line(aes(y = UW), size = 2, color = "purple") +
     xlab("1st") +
     ylab("Score") +
     scale_x_continuous(expand = c(0,0), limits = c(0,NA)) +
     scale_y_continuous(expand = c(0,0), limits = c(0,NA)) +
     theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
