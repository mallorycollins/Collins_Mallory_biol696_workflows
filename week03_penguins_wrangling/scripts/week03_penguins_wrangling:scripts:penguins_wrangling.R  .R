############################################
# Week 3 — Penguins Data Wrangling
# Name: Mallory Collins
# Course: BIOL 696 Graduate Research Workflows
############################################


# Define file paths
data_dir <- "week03_penguins_wrangling/data"
fig_dir  <- "week03_penguins_wrangling/figures"

# Install packages if needed
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("palmerpenguins")) install.packages("palmerpenguins")

# Load packages
library(tidyverse)
library(palmerpenguins)

# Load dataset
penguins_data <- penguins


# Calculate percent missing values per column
missing_percent <- colSums(is.na(penguins_data)) / nrow(penguins_data) * 100

missing_percent

# Replace missing values in numeric columns with median
penguins_clean <- penguins_data %>%
  mutate(
    bill_length_mm = ifelse(is.na(bill_length_mm),
                            median(bill_length_mm, na.rm = TRUE),
                            bill_length_mm),
    
    bill_depth_mm = ifelse(is.na(bill_depth_mm),
                           median(bill_depth_mm, na.rm = TRUE),
                           bill_depth_mm),
    
    flipper_length_mm = ifelse(is.na(flipper_length_mm),
                               median(flipper_length_mm, na.rm = TRUE),
                               flipper_length_mm),
    
    body_mass_g = ifelse(is.na(body_mass_g),
                         median(body_mass_g, na.rm = TRUE),
                         body_mass_g)
  )

colSums(is.na(penguins_clean))

# Look at first few rows
head(penguins_clean)

# Inspect cleaned dataset
glimpse(penguins_clean)

dim(penguins_clean)
names(penguins_clean)

# Keep only Chinstrap penguins
chinstrap <- penguins_clean %>%
  filter(species == "Chinstrap")

table(penguins_clean$species)
nrow(chinstrap)

# Keep only selected variables
penguins_small <- penguins_clean %>%
  select(species, flipper_length_mm, body_mass_g)

head(penguins_small)

# Create body condition index
penguins_small <- penguins_small %>%
  mutate(body_condition = body_mass_g / flipper_length_mm)

# Summarize by species
summary_stats <- penguins_small %>%
  group_by(species) %>%
  summarize(
    mean_mass = mean(body_mass_g),
    mean_flipper = mean(flipper_length_mm),
    mean_body_condition = mean(body_condition)
  )

# View summary table
summary_stats

# Find top 5 penguins with lowest body condition
penguins_small %>%
  arrange(body_condition) %>%
  slice(1:5)

# Save summary table as CSV
write.csv(summary_stats, file.path(data_dir, "summary_stats.csv"), row.names = FALSE)

# Save summary table as CSV
write.csv(summary_stats, file.path(data_dir, "summary_stats.csv"), row.names = FALSE)


# Create body mass boxplot
mass_boxplot <- ggplot(penguins_small, aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Species",
    x = "Species",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

# Display plot
mass_boxplot

# Save plot
ggsave(file.path(fig_dir, "body_mass_boxplot.png"), plot = mass_boxplot)

# Create body condition boxplot
body_condition_boxplot <- ggplot(penguins_small, aes(x = species, y = body_condition, fill = species)) +
  geom_boxplot() +
  labs(
    title = "Body Conition by Species",
    x = "Species",
    y = "Body Condition"
  ) +
  theme_minimal()

# Display plot
body_condition_boxplot

# Save plot
ggsave(file.path(fig_dir, "body_condition_boxplot.png"), plot = body_condition_boxplot)

# Create body condition boxplot
body_condition_boxplot <- ggplot(penguins_small, aes(x = species, y = body_condition, fill = species)) +
  geom_boxplot() +
  labs(
    title = "Body Conition by Species",
    x = "Species",
    y = "Body Condition"
  ) +
  theme_minimal()

# Display plot
body_condition_boxplot

# Save plot
ggsave(file.path(fig_dir, "body_condition_boxplot.png"), plot = body_condition_boxplot)

flipper_mass_plot <- ggplot(penguins_small, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ species, scales = "free") +
  labs(
    title = "Flipper Length vs Body Mass by Species",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

flipper_mass_plot

ggsave(file.path(fig_dir, "flipper_vs_mass_facet.png"), plot = flipper_mass_plot)

