here::i_am(
  "code/03_boxplots.R"
)

library(tidyverse)
library(here)
library(patchwork)
library(ggplot2)

df <- read_csv(here("data", "f75_interim.csv")) %>%
  mutate(arm = factor(arm))

muac_vars <- c("muac1", "muac2")
weight_vars <- c("weight1", "weight2")

df_muac <- df %>%
  pivot_longer(
    cols = all_of(muac_vars),
    names_to = "outcome",
    values_to = "value"
  )


df_weight <- df %>%
  pivot_longer(
    cols = all_of(weight_vars),
    names_to = "outcome",
    values_to = "value"
  )

label_map <- c(
  muac1 = "MUAC 1",
  muac2 = "MUAC 2",
  weight1 = "Weight 1",
  weight2 = "Weight 2"
)


p_muac <- ggplot(df_muac, aes(x = arm, y = value, fill = arm)) +
  geom_boxplot(alpha = 0.7) + 
  facet_wrap(~ outcome, ncol = 2,
             labeller = labeller(outcome = label_map)) +
  labs(
    title = "MUAC Outcomes by Treatment Arm",
    x = "Arm",
    y = "MUAC (cm)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    strip.text = element_text(face = "bold")
  )

ggsave(
  filename = here("outputs", "muac_outcomes_by_arm.png"),
  plot = p_muac,
  width = 10,
  height = 6,
  dpi = 300
)

p_weight <- ggplot(df_weight, aes(x = arm, y = value, fill = arm)) +
  geom_boxplot(alpha = 0.7) +   # again, no limits
  facet_wrap(~ outcome, ncol = 2,
             labeller = labeller(outcome = label_map)) +
  labs(
    title = "Weight Outcomes by Treatment Arm",
    x = "Arm",
    y = "Weight (kg)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    strip.text = element_text(face = "bold")
  )

ggsave(
  filename = here("outputs", "weight_outcomes_by_arm.png"),
  plot = p_weight,
  width = 10,
  height = 6,
  dpi = 300
)
