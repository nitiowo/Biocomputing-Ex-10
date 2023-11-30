#Conde Exercise10
#First, set working directory and read data from the provided file
setwd("/Users/mikeconde/Desktop/Biocomp/Rpractice")
library(ggplot2)
library(cowplot)
info <- read.table("UwvMSU_1-22-13.txt", header=TRUE, sep = "\t")

#Part 1; need cumulative score variables, and create vectors for these scores
UW_score <- 0
MSU_score <- 0
UW-cum <- numeric(length = nrow(info))
MSU_cum <- numeric(length = nrow(info))

#Calculate the cumulative scores
for (i in 1:nrow(info)) {
  if (info$team[i] == "UW") {
    UW_score <- UW_score + info$score[i] }
  else {
    MSU_score <- MSU_score + info$score[i] }
  UW-cum[i] <- UW_score
  MSU-cum[i] <- MSU_score
}
