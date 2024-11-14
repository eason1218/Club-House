#### Preamble ####
# Purpose: Simulates a dataset
# Author: YiZhuo Li
# Date: 14 November 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)
set.seed(123) # For reproducibility

# Define sample parameters
n <- 100 # Number of rows to simulate
product_names <- c("Bay Leaves", "Oregano", "Thyme")
product_ids <- sample(21000:22000, length(product_names), replace = TRUE)

# Simulate the data
sim_data <- data.frame(
  nowtime = as.POSIXct("2024-06-10 23:38:00") + sample(0:86400, n, replace = TRUE),
  current_price = round(runif(n, 5, 15), 2),
  old_price = ifelse(runif(n) > 0.7, NA, round(runif(n, 5, 15), 2)),
  price_per_unit = paste0("$", round(runif(n, 50, 100), 2), "/100g"),
  other = sample(c("Low Stock", "In Stock"), n, replace = TRUE),
  product_id = sample(product_ids, n, replace = TRUE),
  product_name = sample(product_names, n, replace = TRUE)
)

# Display the first few rows
head(sim_data)

#### Save data ####
write_csv(sim_data, "simulated_data.csv")

