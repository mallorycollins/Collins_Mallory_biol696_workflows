############################################
# Week 4 — Air Quality Visualization and Inference
# Name: YOUR NAME
# Course: BIOL 696 Graduate Research Workflows
############################################


# Define file paths
data_dir <- "week04_airquality_inference/data"
fig_dir  <- "week04_airquality_inference/figures"

if (!require("tidyverse")) install.packages("tidyverse")

library(tidyverse)

# Load built-in dataset
data("airquality")

# Convert to tibble for easier handling
air_data <- as_tibble(airquality)


glimpse(air_data)
dim(air_data)
names(air_data)

# Check missing values
colSums(is.na(air_data))

air_clean <- air_data %>%
  drop_na(Ozone, Temp)

temp_boxplot <- ggplot(air_clean, aes(x = ozone_group, y = Temp, fill = ozone_group)) +
  geom_boxplot() +
  labs(
    title = "Temperature by Ozone Level",
    x = "Ozone Group",
    y = "Temperature (F)"
  ) +
  theme_minimal()

# Display
temp_boxplot

# Save
ggsave(file.path(fig_dir, "temp_boxplot.png"), plot = temp_boxplot)

ozone_temp_plot <- ggplot(air_clean, aes(x = Ozone, y = Temp)) +
  geom_point(alpha = 0.7, color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(
    title = "Ozone vs Temperature",
    x = "Ozone",
    y = "Temperature (F)"
  ) +
  theme_minimal()

ozone_temp_plot

ggsave(file.path(fig_dir, "ozone_temp_scatter.png"), plot = ozone_temp_plot)

# Define file paths
data_dir <- "week04_airquality_inference/data"
fig_dir  <- "week04_airquality_inference/figures"

#Null hypothesis (H0): The mean temperature is the same for high and low ozone days
#Alternative hypothesis (H1): The mean temperature differs between high and low ozone days


# Perform t-test
result <- t.test(Temp ~ ozone_group, data = air_clean)

result

##p < 0.05 → reject H0
##p ≥ 0.05 → fail to reject H0

# Fit linear model
lm_model <- lm(Temp ~ Ozone, data = air_clean)

# View summary
summary(lm_model)


###Coefficient for Ozone → direction and strength of relationship
###p-value → is the relationship statistically significant?
### R-squared → how much variation is explained

