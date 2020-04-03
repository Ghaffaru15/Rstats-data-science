
head(iris)

plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  main = 'Iris Petal Length vs Petal Width',
  xlab = 'Petal Length',
  ylab = 'Petal Width'
)


# Simple Linear Regression Model
model <- lm(
  formula = Petal.Width ~ Petal.Length, # y as a function of x. [ y == mx + c]
  data = iris 
)

summary(model)

# Draw the regression line plot
lines(
  x = iris$Petal.Length,
  y = model$fitted,
  col = 'red',
  lwd = 3
)

# Get the correlation coefficient
cor(
  x = iris$Petal.Length,
  y = iris$Petal.Width
)

predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(5,10, 15)
  )
)
install.packages('ff')

# assume big data
library(ff)
iris