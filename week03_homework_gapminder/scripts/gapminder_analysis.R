############################################
# Homework 2 — Gapminder Analysis
# Name: Mallory Collins
# Course: BIOL 696 Graduate Research Workflows
############################################

# Define file paths
data_dir <- "week03_homework_gapminder/data"
fig_dir  <- "week03_homework_gapminder/figures"

# Load libraries and data
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("gapminder")) install.packages("gapminder")

library(tidyverse)
library(gapminder)

gap_data <- gapminder

# Inspect the dataset
glimpse(gap_data)
dim(gap_data)
names(gap_data)


# Subset data from year 2007
gap_2007 <- gap_data %>%
  filter(year == 2007)

# Count unique countries in 2007
n_distinct(gap_2007$country)


# Make new variable for total GDP
gap_2007 <- gap_2007 %>%
  mutate


# Summary of life expectancy and GDP per capita by continent
continent_summary <- gap_2007 %>%
  group_by(continent) %>%
  summarize(
    mean_lifeExp = mean(lifeExp),
    mean_gdpPercap = mean(gdpPercap)
  )

continent_summary


# Identify top 5 countries by total GDP
gap_2007 %>%
  arrange(desc(gdp_total)) %>%
  slice(1:5)

# Create GDP per capita boxplot
gdp_boxplot <- ggplot(gap_2007, aes(x = continent, y = gdpPercap, fill = continent)) +
  geom_boxplot() +
  labs(
    title = "GDP per Capita by Continent (2007)",
    x = "Continent",
    y = "GDP per Capita"
  ) +
  theme_minimal()

# Display plot
gdp_boxplot

# Save plot
ggsave(file.path(fig_dir, "gdp_boxplot.png"), plot = gdp_boxplot)


# Create life expectancy boxplot
lifeExp_boxplot <- ggplot(gap_2007, aes(x = continent, y = lifeExp, fill = continent)) +
  geom_boxplot() +
  labs(
    title = "Life Expectancy by Continent (2007)",
    x = "Continent",
    y = "Life Expectancy"
  ) +
  theme_minimal()

# Display plot
lifeExp_boxplot

# Save plot
ggsave(file.path(fig_dir, "lifeExp_boxplot.png"), plot = lifeExp_boxplot)


# Create scatter plot of GDP per capita vs. life expectancy
scatter_plot <- ggplot(gap_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  labs(
    title = "GDP per Capita vs Life Expectancy (2007)",
    x = "GDP per Capita",
    y = "Life Expectancy"
  ) +
  theme_minimal()

# Display plot
scatter_plot

# Save plot
ggsave(file.path(fig_dir, "gdp_vs_lifeExp.png"), plot = scatter_plot)


# Create faceted scatterplot by continent with trend lines
plot_linear <- ggplot(gap_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  facet_wrap(~ continent) +
  labs(
    title = "GDP per Capita vs Life Expectancy by Continent (2007)",
    x = "GDP per Capita",
    y = "Life Expectancy"
  ) +
  theme_minimal()

# Display plot
plot_linear

# Save plot
ggsave(file.path(fig_dir, "facet_gdp_lifeExp_linear.png"), plot = plot_linear)

# Create faceted scatterplot using a log-scale transformation of the x-axis
plot_log <- ggplot(gap_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  facet_wrap(~ continent) +
  scale_x_log10() +
  labs(
    title = "GDP per Capita vs Life Expectancy by Continent (2007)",
    x = "GDP per Capita (log scale)",
    y = "Life Expectancy"
  ) +
  theme_minimal()

# Display plot
plot_log

# Save plot
ggsave(file.path(fig_dir, "facet_gdp_lifeExp_log.png"), plot = plot_log)
