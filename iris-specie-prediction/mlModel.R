

set.seed(42)


# see the dimensions
dim(iris)

# number of rows
nrow(iris)

# number of columns
ncol(iris)

# Column names
colnames(iris)

names(iris)

# Structure
str(iris)

table(iris$Species)

# 
head(iris, 10)

summary(iris)

# Randomly sample 100 of 150 row indexes
indexes <- sample(x = 1:150, size = 100)

# inspect the random indexes
print(indexes)

# create the training dataset
train <- iris[indexes, ]

# create the test
test <- iris[-indexes, ]

# install.packages('tree')

library(tree)

model <- tree(
  formula = Species ~ ., 
  data = train
)

?tree
summary(model)

# visualize the tree model
plot(model)
text(model)

#install.packages("RColorBrewer")

# Create color pallete
library(RColorBrewer)

palette <- brewer.pal(3, 'Set2')

# create a scatter plot colored by species
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  pch = 19,
  col = palette[as.numeric(iris$Species)]
)

# Plot the decision boundaries
partition.tree(
  tree = model,
  label = 'Species',
  add = TRUE
)

predictions <- predict(
  object = model,
  newdata = test,
  type = 'class'
)

# create a confusion matrix
table(
  x = predictions,
  y = test$Species
)

# caret package
install.packages('caret') # classification and regression training
library(caret)

# evaluate the prediction results
confusionMatrix(
  data = predictions,
  reference = test$Species
)


setwd('~/Artificial Intelligence/R-ML-Projects/iris-specie-prediction')

# save tree model
save(model, file = 'Tree.RData')
# install.packages('dplyr')
  