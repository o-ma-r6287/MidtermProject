library(tidyverse)
library(gt)
library(here)

here::i_am("code/02_bivariate_analysis.R")

df <- read_csv(here("data", "f75_interim.csv")) %>%
  mutate(arm = factor(arm))

muac<- c("muac1", "muac2")
weight <- c("weight1", "weight2")
all_outcomes <- c(muac, weight)
long <- df %>%
  pivot_longer(
    cols      = all_of(all_outcomes),
    names_to  = "outcome",
    values_to = "value"
  )

label <- c(
  muac1   = "MUAC 1",
  muac2   = "MUAC 2",
  weight1 = "Weight 1",
  weight2 = "Weight 2"
)
runtest <- function(data_subset) {
  d <- data_subset %>%
    filter(!is.na(arm), !is.na(value))
  if (n_distinct(d$arm) != 2) {
    return(tibble(test = NA_character_, p_value = NA_real_))
  }
  welch_t <- t.test(value ~ arm, data = d)
  tibble(
    test = "t-test",
    p_value = welch_t$p.value
  )
}
pvals <- long %>%
  filter(!is.na(value)) %>%
  group_by(outcome) %>%
  group_modify(~ runtest(.x)) %>%
  ungroup()

results <- long %>%
  group_by(outcome, arm) %>%
  summarise(
    n    = sum(!is.na(value)),
    mean = mean(value, na.rm = TRUE),
    sd   = sd(value, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  left_join(pvals, by = "outcome") %>%
  mutate(
    out_lab = unname(label[outcome]),
    mean_sd= sprintf("%.2f (%.2f)", mean, sd),
    p_value=round(p_value, 3)
  )

results

bivar_table <- results %>%
  arrange(out_lab, arm) %>%
  select(
    Outcome     = out_lab,
    Arm         = arm,
    n,
    `Mean (SD)` = mean_sd,
    Test        = test,
    `p-value`   = p_value
  ) %>%
  gt() %>%
  tab_header(
    title = "Outcomes by Treatment Arm"
  ) %>%
  tab_options(
    table.font.size = px(14),
    heading.align   = "left"
  )

gtsave(
  bivar_table,
  filename = here("outputs", "bivariate_A_table.png")
)