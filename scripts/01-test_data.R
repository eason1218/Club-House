#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data
# Author: YiZhuo Li
# Date: 14 November 2024
# Contact: liyizhuo.li@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

# Load the data from the specified path
data_path <- "simulated_data.csv"
analysis_data <- read_csv(data_path)

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 100 rows (update as necessary)
expected_rows <- 100
if (nrow(analysis_data) == expected_rows) {
  message(paste("Test Passed: The dataset has", expected_rows, "rows."))
} else {
  stop(paste("Test Failed: The dataset does not have", expected_rows, "rows."))
}

# Check if the dataset has 7 columns
expected_columns <- 7
if (ncol(analysis_data) == expected_columns) {
  message(paste("Test Passed: The dataset has", expected_columns, "columns."))
} else {
  stop(paste("Test Failed: The dataset does not have", expected_columns, "columns."))
}

# Check if 'nowtime' column is of type POSIXct
if (inherits(analysis_data$nowtime, "POSIXct")) {
  message("Test Passed: The 'nowtime' column is of type POSIXct.")
} else {
  stop("Test Failed: The 'nowtime' column is not of type POSIXct.")
}

# Check if 'current_price' is numeric
if (is.numeric(analysis_data$current_price)) {
  message("Test Passed: The 'current_price' column is numeric.")
} else {
  stop("Test Failed: The 'current_price' column is not numeric.")
}

# Check if 'old_price' is numeric and allows NA values
if (is.numeric(analysis_data$old_price) && any(is.na(analysis_data$old_price))) {
  message("Test Passed: The 'old_price' column is numeric and contains NA values.")
} else {
  stop("Test Failed: The 'old_price' column is not numeric or lacks NA values.")
}

# Check if 'price_per_unit' follows the format "$xx.xx/100g"
if (all(grepl("^\\$[0-9]+\\.[0-9]{2}/100g$", analysis_data$price_per_unit))) {
  message("Test Passed: The 'price_per_unit' column follows the correct format.")
} else {
  stop("Test Failed: The 'price_per_unit' column does not follow the correct format.")
}

# Check if 'other' column contains only 'Low Stock' or 'In Stock'
if (all(analysis_data$other %in% c("Low Stock", "In Stock"))) {
  message("Test Passed: The 'other' column contains only 'Low Stock' or 'In Stock'.")
} else {
  stop("Test Failed: The 'other' column contains invalid values.")
}

# Check if 'product_id' is numeric
if (is.numeric(analysis_data$product_id)) {
  message("Test Passed: The 'product_id' column is numeric.")
} else {
  stop("Test Failed: The 'product_id' column is not numeric.")
}

# Check if 'product_name' contains only expected product names
expected_product_names <- c("Bay Leaves", "Oregano", "Thyme")
if (all(analysis_data$product_name %in% expected_product_names)) {
  message("Test Passed: The 'product_name' column contains only expected product names.")
} else {
  stop("Test Failed: The 'product_name' column contains unexpected values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'other', 'product_name', and 'price_per_unit' columns
if (all(analysis_data$other != "" & analysis_data$product_name != "" & analysis_data$price_per_unit != "")) {
  message("Test Passed: There are no empty strings in 'other', 'product_name', or 'price_per_unit'.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}

# Check if 'product_name' column has at least two unique values
if (n_distinct(analysis_data$product_name) >= 2) {
  message("Test Passed: The 'product_name' column contains at least two unique values.")
} else {
  stop("Test Failed: The 'product_name' column contains less than two unique values.")
}

