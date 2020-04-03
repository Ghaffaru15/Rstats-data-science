setwd('~/Artificial Intelligence/R-ML-Projects/mtcars')


cars <- read.csv('Cars.csv')


library(ggplot2)

# create a frequency bar chart
ggplot(
  data = cars,
  aes(x = Transmission)
) + geom_bar() + ggtitle('Count of cars by Transmission Type') + ylab('Count of Cars')+ xlab('Transmisson Tye')


cars$Cylinders <-  as.factor(cars$Cylinders)
ggplot(
  data = cars,
  aes(x = Cylinders)
) + geom_boxplot()

# Histogram

ggplot(
  data = cars,
  aes(x = Fuel.Economy)) + 
  geom_histogram(bins = 10) +
  ggtitle('Distribution of fuel Economy') + 
  xlab('Fuel Economy') + 
  ylab('Count of cars')

# Density plot
ggplot(
  data = cars,
  aes(x = Fuel.Economy)
) +
  geom_density() +
  ggtitle('Distribution of fuel Economy') 

# Create scatter plot
ggplot(
  data = cars,
  aes(x = Cylinders, y = Fuel.Economy)
) + 
  geom_point() +
  ggtitle('Scatter Plot')
