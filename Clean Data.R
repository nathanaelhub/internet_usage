# install packages (only if not already available)
if (!requireNamespace("readr", quietly = TRUE)) install.packages("readr")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")

# Cleaning Data in R
library(readr)
library(dplyr)

# Point this at your local copy of the data folder. The source CSVs
# (CountriesByUsers.csv and the per-country files under Countries/) are not
# committed to the repo, so set this before running.
data_dir <- "~/Desktop/Final"

# read in the master list of countries by number of internet users
df <- read.csv(file.path(data_dir, "CountriesByUsers.csv"))

# read every per-country search-engine file
countries_dir <- file.path(data_dir, "Countries")
China <- read.csv(file.path(countries_dir, "China.csv"))
India <- read.csv(file.path(countries_dir, "India.csv"))
US <- read.csv(file.path(countries_dir, "US.csv"))
Brazil <- read.csv(file.path(countries_dir, "Brazil.csv"))
Japan <- read.csv(file.path(countries_dir, "Japan.csv"))
Russia <- read.csv(file.path(countries_dir, "Russia.csv"))
Indonesia <- read.csv(file.path(countries_dir, "Indonesia.csv"))
Mexico <- read.csv(file.path(countries_dir, "Mexico.csv"))
Germany <- read.csv(file.path(countries_dir, "Germany.csv"))
Philippines <- read.csv(file.path(countries_dir, "Philippines.csv"))
UK <- read.csv(file.path(countries_dir, "UK.csv"))
Pakistan <- read.csv(file.path(countries_dir, "Pakistan.csv"))

Countries <- bind_rows(China, India, US, Brazil, Japan, Russia, Indonesia, Mexico,
                       Germany, Philippines, UK, Pakistan)
glimpse(Countries)

final_data <- merge(df, Countries)
glimpse(final_data)

write_csv(final_data, file.path(data_dir, "Final_data.csv"))
