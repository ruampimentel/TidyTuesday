library(tidyverse)
library(tidytuesdayR)
library(ggplot2)
library(forcats)
library(scales)
library(RColorBrewer)
library(systemfonts)

tt <- tt_load("2022-03-22")

tt %>% list2env(.GlobalEnv)
tt %>% glimpse()

p1 <- babynames %>%
  group_by(name) %>% 
  summarise(n_sum = sum(n, na.rm = TRUE)) %>% 
  arrange(desc(n_sum)) %>% 
  top_n(10) %>% 
  mutate(name = fct_reorder(name, n_sum)) %>% 
  ggplot(aes(y = name, x = n_sum, fill = name)) +
  geom_col() +
  # making prettier
  scale_x_continuous(
                     expand = c(.01, .01)
                     ) +
  scale_fill_brewer(palette = "Paired"
                    ) +
  labs(x = "# of cases", 
       y = "Names",
       caption="Source: TidyTuesday Week 12") +
  ggtitle("Top 10 baby names since 1880",
          "  M = Million") +
  #theme_minimal() +
  geom_label(aes(label = paste0(round((n_sum)/1000000, 1), "M") ),
            hjust = 1.3, nudge_x = 0,
            size = 4, fontface = "bold", family = "Fira Sans",
            ## turn into white box without outline
            fill = "white", label.size = 0) +
  #theme() +
  ## get rid of all elements except y axis labels + adjust plot margin
  theme_void() +
  theme(axis.text.y = element_text(size = 14, hjust = 1, family = "Fira Sans"),
        plot.margin = margin(rep(15, 4)),
        legend.position = "none",
        plot.title = element_text(size=22))

p1

# rtweet
library(rtweet)
source("C:/Users/ruamp/OneDrive - University of Toledo/R studying/My Functions/my_twitter_cred.R")
my_twitter_cred()

post_tweet(status = "Simple #TidyTuesday plot for the week...",
           media = "2022/2022-week_12/plots/baby names since 1880.png")
