here::i_am("code/01_descriptives.R")

library(tidyverse)
library(here)
library(gtsummary)
library(gt)

df <- read_csv(here("data", "f75_interim.csv")) %>%
  mutate(arm = factor(arm))

gtsummary_table <- df %>%
  select(weight1, weight2, muac1, muac2) %>%
  tbl_summary(
    statistic = list(all_continuous() ~ "{mean} ({sd})"),
    digits = everything() ~ 2
  )

gt_table <- as_gt(gtsummary_table)

gtsave(
  gt_table,
  filename = here("outputs", "gtsummarytable.png")
)