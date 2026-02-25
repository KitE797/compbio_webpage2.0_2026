### Class 2/25/26
### Learning about Dplyr

library(tidyverse)

dplyr::filter()
stats::filter()

data(starwars)

class(starwars)

# remove NAs
starwarsClean <- starwars[complete.cases(starwars[,1:10]),]

# check for NAs

is.na(starwarsClean[,1])





starwarsClean |> 
  mutate(sp=case_when(species=="Human"~"Human", T ~ "Non-Human")) |>
  select(name, sp, everything())