


dataset <- read.csv('Social_Network_Ads.csv', sep = '\t')

?read.csv
head(dataset)

nrow(dataset)

dataset$Purchased = factor(dataset$Purchased, levels = c(0,1))

dataset = dataset[3:5]

dataset

# splitting data with caTools
library(caTools)

set.seed(123)
?sample.split
split = sample.split(dataset$Purchased, SplitRatio = 0.75)

training_set <- subset(dataset, split == TRUE)

test_set <- subset(dataset, split == FALSE)

head(training_set)

nrow(training_set)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


head(training_set)

# Create the Naive Bayes Model
library(e1071)

classifier <- svm(
  x = training_set[-3],
  y = training_set$Purchased
)

# Test set predictions 
test_pred = predict(
  object = classifier,
  newdata = test_set[-3]
)

test_pred

# Confusion matrix
cm = table(test_set$Purchased, test_pred )
cm

# install.packages('caret') 
library(caret)
confusionMatrix(cm)

# Visualizing your training result
# library()
?merge
