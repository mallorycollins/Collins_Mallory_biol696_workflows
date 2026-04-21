############################################
# Homework 3 — Penguins Inference
# Name: Mallory Collins
# Course: BIOL 696 Graduate Research Workflows
############################################


# Define file paths
data_dir <- "week04_homework_penguins_inference/data"
fig_dir  <- "week04_homework_penguins_inference/figures"


if (!require("tidyverse")) install.packages("tidyverse")
if (!require("palmerpenguins")) install.packages("palmerpenguins")

library(tidyverse)
library(palmerpenguins)

penguins_data <- penguins

penguins_clean <- penguins_data %>%
  drop_na(body_mass_g, flipper_length_mm, sex, species)

sex_mass_plot <- ggplot(penguins_clean, aes(x = sex, y = body_mass_g, fill = sex)) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Sex",
    x = "Sex",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

sex_mass_plot

ggsave(file.path(fig_dir, "sex_mass_boxplot.png"), plot = sex_mass_plot)

# Perform t-test
result <- t.test(body_mass_g ~ sex, data = penguins_clean)

result


flipper_mass_plot <- ggplot(penguins_clean, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(
    title = "Flipper Length vs Body Mass",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

flipper_mass_plot

ggsave(file.path(fig_dir, "flipper_mass_scatter.png"), plot = flipper_mass_plot)

lm_model <- lm(flipper_length_mm ~ body_mass_g, data = penguins_clean)
# View summary
summary(lm_model)
species_plot <- ggplot(penguins_clean, aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Species",
    x = "Species",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

species_plot

ggsave(file.path(fig_dir, "species_comparison.png"), plot = species_plot)

