# Load the primary data science framework and Excel import library
library(tidyverse)
library(readxl)
library(here)

# Practice Import A: Loading a standard comma-separated plain text file
benthic_cover <- read_csv(here::here("data/reef_cover_log.csv"))

# Practice Import B: Parsing a tab-separated telemetry instrument array string
acoustic_stream <- read_tsv(here::here("data/acoustic_telemetry_stream.txt"))

# Practice Import C: Targeting a specific sheet in a multi-tab Excel spreadsheet
fisheries_annual <- read_excel(here::here("data/fish_catch_data.xlsx"), sheet = "Commercial_2026")

# Read in mangrove_data
mangrove_data <- read_csv(file = here::here("data/mangrove_survey_raw.csv")) # file has a lot of notes in the initial columns, corrupting the entire data ingesting pipeline.

# Use args with read_csv to skip headers and declare missing flags
mangrove_data <- read_csv(here::here("data/mangrove_survey_raw.csv"), skip = 5, # skips the first 5 lines of field notes
                          na = c( ".","NA", "9999", "ND", "blank")) # convert known text alts to true NA 
# By providing the NA character vector, you instructed R to search for common biological placeholder shorthands like . or ND, and normalize them into an explicit traceable missing indicator state (NA) at the point of ingestion.


