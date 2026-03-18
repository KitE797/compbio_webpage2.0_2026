
library(tidyverse)
library(sqldf)

species_clean <- read.csv("r_scripts/site_by_species.csv")

vars_clean <- read.csv("r_scripts/site_by_variables.csv")

query <- "SELECT Site, Sp1, Sp2, Sp3 FROM species_clean WHERE Site <'30'"

sqldf(query)


