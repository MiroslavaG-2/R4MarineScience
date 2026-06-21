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
sensor_data <- 
  sensor_raw |>
  mutate(
    datetime = dmy_hm(timestamp), # time to day/month/year hour:minute
    turbidity = na_if(turbidity, -999), # convert error to a true NA
    salinity = ifelse(salinity < 0, NA, salinity), # convert negative salinity values to NA
  )

# Summarise the data that was collected evey 15 minutes into daily means
sensor_daily <- 
  sensor_data |>
  mutate(date = as_date(floor_date(datetime, "day"))) |>
  group_by(site, date) |>
  summarise(
    mean_temp = mean(temperature, na.rm = TRUE),
    mean_salinity = mean(salinity, na.rm = TRUE),
    mean_turbidity = mean(turbidity, na.rm = TRUE),
    .groups = "drop")


