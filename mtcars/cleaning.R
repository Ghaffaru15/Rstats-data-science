
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

head(temp)

# filter a subset of columns
temp <- filter(
  .data = temp,
  Transmission == 'Automatic'
)


head(temp)

# compute a new column
temp <- mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425
)

head(temp)

# Group by column
temp <- group_by(
  .data = temp,
  Cylinders
)
temp

# aggregate based on groups
temp <- summarize(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)

temp

# Arrange the rows in descending order
temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)

head(temp)

# convert tibble back to dataframe
efficiency <- as.data.frame(temp)

efficiency

# Using pipe
efficiency <- cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission== 'Automatic') %>%
  mutate(Consumption = Fuel.Economy * 0.425) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()

efficiency

# save the results to a csv file
write.csv(
  x = efficiency,
  file = 'Fuel Efficiency',
  row.names = FALSE
)
ls
