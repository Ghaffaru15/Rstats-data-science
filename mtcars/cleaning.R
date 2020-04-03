
setwd('~/Artificial Intelligence/R-ML-Projects/mtcars')

cars <- read.table(
  file = 'Cars.txt',
  header = TRUE,
  sep = '\t',
  quote = "\""
)

head(cars)

# load dplyr package
library(dplyr)

# select a subset of columns
temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)

temp
