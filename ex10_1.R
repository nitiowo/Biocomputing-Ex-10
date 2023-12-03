library(tidyverse)
library(cowplot)

dat = read.table("/Users/plezar/Documents/gradschool/biocomputing/Biocomputing-Ex-10/UWvMSU_1-22-13.txt", header = T)

dat %>%
  group_by(team) %>%
  mutate(cum_score = cumsum(score)) %>%
  ggplot(aes(x = time, y = cum_score, color = team)) +
  geom_line(linetype = "dashed")+
  geom_point() +
  theme_cowplot() +
  labs(x = "Time", y = "Cumulative score")
