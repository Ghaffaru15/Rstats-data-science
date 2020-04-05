
loan <- read.csv('lending_club_data01.csv')

head(loan)

colnames(loan)

str(loan)

loan$bad_loans = factor(loan$bad_loans)

str(loan)

sum(is.na(loan))

# Split into training and testing
library(caTools)

split = sample.split(loan, SplitRatio = 0.8)

train <- subset(loan, split == TRUE)
test <- subset(loan, split == FALSE )

nrow(loan)
nrow(train)
nrow(test)

library(e1071)
library(rpart)
colnames(loan)

?naiveBayes
classifier <- randomForest(
  x = loan[-7],
  y = loan$bad_loans,
)

decisionTreeClassifier <- rpart(bad_loans ~ ., data = loan, method = 'class')
test_pred <- predict(classifier, test[-7])

# Create confusion matrix
cm <- table(test_pred, test$bad_loans)

library(caret)

confusionMatrix(cm)

plot(classifier)

importance(classifier)

varImpPlot(classifier)
