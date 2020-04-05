

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

test_imp <- read.csv('test-imp1.csv')

table(is.na(test_imp))

# substiting missing values with the mean
train$Age[is.na(train$Age)] <- mean(train$Age, na.rm = T)

sum(is.na(train$Age))

# replace with mode
train$Embarked[is.na(train$Embarked)] <- 's'
sum(is.na(train$Embarked))

# Univariate Analysis
str(train)

# chi square test against two categorical
chisq.test(train$Ticket, train$Cabin)

install.packages('corrplot')

library(corrplot)
cor(train[, sapply(train, is.numeric)])

corrplot(cor(train[, sapply(train, is.numeric)]), diag = T)

?corrplot

install.packages('e1071')

install.packages('caTools')
