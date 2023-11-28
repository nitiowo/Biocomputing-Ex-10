# Biergans Exercise 10

# Part 1

# Read the data from the file
data <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

# Cumulative score variables
UW_score <- 0
MSU_score <- 0

# Create vectors for cumulative scores
UW_cumulative <- numeric(length = nrow(data))
MSU_cumulative <- numeric(length = nrow(data))

# Calculate cumulative scores
for (i in 1:nrow(data)) {
  if (data$team[i] == "UW") {
    UW_score <- UW_score + data$score[i]
  } else {
    MSU_score <- MSU_score + data$score[i]
  }
  UW_cumulative[i] <- UW_score
  MSU_cumulative[i] <- MSU_score
}

# Plotting the Line Graph
plot(data$time, UW_cumulative, type = "l", col = "red", ylim = c(0, max(UW_cumulative, MSU_cumulative)), xlab = "Time (minutes)", ylab = "Score", main = "University of Wisconsin vs Michigan State University")
lines(data$time, MSU_cumulative, col = "darkgreen")
legend("bottomright", legend = c("Univeristy of Wisconsin", "Michigan State University"), col = c("red", "darkgreen"), lty = 1)

