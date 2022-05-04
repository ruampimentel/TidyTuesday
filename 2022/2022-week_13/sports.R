library(tidyverse)
library(tidytuesdayR)
library(psych)

tt <- tt_load("2022-03-29")

tt %>% list2env(.GlobalEnv)

sports %>% glimpse()
sports %>%
  select(!unitid:classification_other,
         -sector_name,
         -sports) %>% 
  describe() %>% as_tibble(rownames = "variables")

sports %>% count(sports, sort = T)

sports %>% count(partic_women)

sports %>% count(ef_male_count)

sports %>% count(year, sort = T)
