library(tidyverse)
library(tidytuesdayR)

tt <- tt_load("2022-03-22")

tt %>% list2env(.GlobalEnv)
tt %>% glimpse()

babynames %>% 
  count(name) %>% 
  arrange(n)
