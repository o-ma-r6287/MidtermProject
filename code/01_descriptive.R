# Code for descriptive statistics as outlined in midterm planning document will go here

here::i_am("code/01_descriptive.R")

library(tidyverse)
library(here)
library(gtsummary)

df <- read_csv(here("data", "f75_interim.csv")) %>%
  mutate(arm = factor(arm))

gtsummary_table <- df %>%
  select(weight1, weight2, muac1, muac2) %>%
  tbl_summary(
    statistic = list(all_continuous() ~ "{mean} ({sd})"),
    digits = everything() ~ 2
  )

