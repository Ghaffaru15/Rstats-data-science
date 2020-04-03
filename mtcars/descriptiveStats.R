setwd('~/Artificial Intelligence/R-ML-Projects/mtcars')

cars <- read.csv('Cars.csv')

head(cars)


# Create frequency table
table(cars$Transmission)

# Get the minimum value
min(cars$Fuel.Economy)

# Get the maximum value
max(cars$Fuel.Economy)

# get the average
mean(cars$Fuel.Economy)

# median
median(cars$Fuel.Economy)

# get quartiles
quantile(cars$Fuel.Economy)

# standard deviation
sd(cars$Fuel.Economy)

# total value
sum(cars$Fuel.Economy)

# correlation coefficients
cor(
  x = cars$Cylinders,
  y = cars$Fuel.Economy
)

# summarize an entire table
summary(cars)
