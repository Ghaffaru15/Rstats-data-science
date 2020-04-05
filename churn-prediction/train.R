
library(rpart)

library(caTools)

library(caret)

library(randomForest)
churnData <- read.csv('ChurnData.csv')

head(churnData)

nrow(churnData)

set.seed(50)

?set.seed

split <- sample.split(Y = churnData, SplitRatio = 0.8)

train <- subset(x = churnData, split == TRUE)

test <- subset(x = churnData, split == FALSE)

decisionTreeModel <- rpart(churn ~ ., data = churnData, method = 'class')
randomForestModel <- randomForest(x = train[-28], y = train$churn, ntree = 500, method = 'class')

test_pred <- predict(object = randomForestModel, newdata = test[-28], type = 'class')

cm <- table(test_pred, test$churn)

cm

confusionMatrix(cm)

summary(decisionTreeModel)

printcp(decisionTreeModel)


plotcp(decisionTreeModel)

# Tree Prunning

# find the value of cp for which cross validation is minimum
min(decisionTreeModel$cptable[,'xerror'])

which.min(decisionTreeModel$cptable[,'xerror'])

cpmin <- decisionTreeModel$cptable[1, 'CP']
cpmin

# Prune the tree by setting the CP parameter as cpmin
decisionTreeModelPrunned <- prune(decisionTreeModel, cp = cpmin)

# predict using prunned
pruned_test_pred <- predict(object = decisionTreeModelPrunned, test[-28], type = 'class')

table(pruned_test_pred, test$churn)

confusionMatrix(table(pruned_test_pred, test$churn))


