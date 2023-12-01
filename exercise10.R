#set working directory 
setwd("D:/PhD/lecture/intro Biocomputing/exercise10")
#challenge 1:
#load packages
library(ggplot2)
library(dplyr)
#read in the information
score_record<-read.csv(file="UWvMSU_1-22-13.txt",header=TRUE,sep="\t")
#make score accumulative
score_record <- score_record %>% 
  group_by(team) %>% 
  mutate(Cumulative_Score = cumsum(score))
#split
list_of_tables <- split(score_record, score_record$team)
table_UW <- list_of_tables[["UW"]]  
table_MSU <- list_of_tables[["MSU"]]
#plot
ggplot() +
  geom_line(data = table_UW, aes(x = time, y = Cumulative_Score,color="UW")) +
  geom_line(data = table_MSU, aes(x = time, y = Cumulative_Score, color = "MSU")) +
  labs(title = "UWvMSU", x = "Time", y = "Score", color="team") +
  scale_color_manual(values = c("UW" = "blue", "MSU" = "red")) +
   theme_classic()


#challenge 2: guess my number
guess_my_number<-function(){
  secret_number <- sample(1:100, 1)
  max_times<-10
  for (attempt in 1:max_times){
    guess_number<-as.numeric(readline("Guess:"))
    if (guess_number==secret_number){
      print("Correct!")
      break
      }else if(guess_number>secret_number){
        print("Lower")
      }else{
        print("Higher")
      }
    if (attempt == max_times){
      cat("Sorry, you've run out of attempts, the correct number:", secret_number)
    }
  }
}
