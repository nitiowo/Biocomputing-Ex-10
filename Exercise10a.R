# Exercise10a.R

# load in necessary packages
library(ggplot2)
library(cowplot)

# read necessary data to be working with
df <- read.table("~/Desktop/BIOCOMP/Biocomputing-Ex-10/UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

# create data frame 
df_cumulative <- transform(df, cumulative_score = ave(score, team, FUN = cumsum))

ggplot(df_cumulative, aes(x = time, y = cumulative_score, color = team)) +
  geom_line() +
  labs(title = "Cumulative Score Over Time",
       x = "Time",
       y = "Cumulative Score",
       color = "Team") +
  theme_minimal() 