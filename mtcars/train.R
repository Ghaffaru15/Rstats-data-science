
head(mtcars)

colnames(mtcars)

str(mtcars)

mtcars$am <- as.factor(mtcars$am)

mtcars$vs <- as.factor(mtcars$vs)

sum(is.na(mtcars))

# Split data
library(caTools)

split <- sample.split(Y = mtcars, SplitRatio = 0.9)

train <- subset(x = mtcars, split == TRUE)

test <- subset(x = mtcars, split == FALSE)

str(train)

nrow(train)

nrow(test)

library(rpart) # recursive partitioning
library(e1071)
decisionTree <- rpart(am ~ . , data = train, method = 'class')

test_pred <- predict(object = decisionTree, newdata = test, type = 'class')

cm <- table(test_pred, test$am)

cm

library(caret)

confusionMatrix(test_pred, test$am)
 
