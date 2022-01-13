# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!


tuesdata <- tidytuesdayR::tt_load('2020-11-17')
tuesdata <- tidytuesdayR::tt_load(2020, week = 47)

black_in_data <- tuesdata$black_in_data

install.packages("tidytuesdayR")
tidytuesdayR::
