
library(rpart)

library(caTools)

library(e1071)

library(randomForest)
?sample.split

split <- sample.split(Y = iris, SplitRatio = 0.9)

train <- subset(x = iris, split == TRUE)

test <- subset(x = iris, split == FALSE)

nrow(train)

head(train)

head(test)

test[-5]

?predict
decisionTreeModel <- rpart(Species ~ . , data = train, method = 'class')

randomForestModel <- randomForest(x = train[-5], y = train$Species, ntree = 1000)
colnames(iris)
test_pred <- predict(object = decisionTreeModel, newdata = test[-5], type = 'class')

test_pred
cm <- table(test_pred, test$Species)

cm

library(caret)

confusionMatrix(cm)


