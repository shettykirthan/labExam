library(dplyr)
library(ggplot2)
library(tidyr)
# Step 1: Read dataset from CSV file
file_path <- "R_final\\train.csv"
data <- read.csv(file_path)

summary_stats <- summary(data)
print(summary_stats)

print(ggplot(data, aes(x = Age)) +
        geom_histogram(binwidth = 5, fill ="blue", color ="black") +
        labs(title = "Distribution of Age on Titanic",x = "Age",y = "Frequency"))
# Identifying missing values
missing_values <- colSums(is.na(data))
print(missing_values)
#Cleaning the data
#Remove duplicates
data <- distinct(data)
#Removing missing values
data$Age[is.na(data$Age)] <- mean(data$Age, na.rm = TRUE)
missing_values <- colSums(is.na(data))
print(missing_values)
# Data manipulation operations
# Filtering: Select passengers with age greater than 18
adult_passengers <- filter(data, Age > 79)
print(adult_passengers)
# Sorting: Sort data by Fare in descending order
sorted_titanic <- arrange(data, desc(Fare))
#write.csv(sorted_titanic ,file = "Sorted.csv")
print(sorted_titanic)
