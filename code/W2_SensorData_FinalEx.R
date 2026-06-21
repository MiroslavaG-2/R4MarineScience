# Script to wrangle sensor data

library(tidyverse)

# Load sensor data
sensor_raw <- read_csv(here::here("data/workshop2/estuary_sonde_data.csv"))

# Check the data
head(sensor_raw)
str(sensor_raw)
glimpse(sensor_raw)
summary(sensor_raw)

# Clean up the sensor data


