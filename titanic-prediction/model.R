

train <- read.csv('train.csv')

test <- read.csv('test.csv')

# Number of rows in training data
nrow(train)

# Number of columns
ncol(train)

# Column name
colnames(train)

# Structure
str(train)

# Convert data type
train$Survived = as.factor(train$Survived)

# Check for number missing values
table(is.na(train))

# Get null values from each column
sapply(train, function(x) sum(is.na(x)))

table(rowSums(is.na(train)))

sum(is.na(train$Age))

# Percentage of null values
(sum(is.na(train)) / nrow(train)) * 100

(sum(is.na(train$Age) / length(train$Age))) * 100

# Using sapply to get the percentages of null values in each column
sapply(train, function (x) (sum(is.na(x)) / length(x)) * 100)

install.packages('Amelia')

# Library to help with null values detection
library(Amelia)

missmap(train, main = 'Missing Map')
AmeliaView()
