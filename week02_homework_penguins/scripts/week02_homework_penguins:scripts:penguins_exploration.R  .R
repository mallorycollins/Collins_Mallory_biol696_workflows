############################################
# Homework 1 — Palmer Penguins Exploration
# Name: Mallory Collins
# Course: BIOL 696 Graduate Research Workflows
############################################

# Define file paths
data_dir <- "week02_homework_penguins/data"
fig_dir  <- "week02_homework_penguins/figures"

# Load dataset
if (!require("palmerpenguins")) install.packages("palmerpenguins")
library(palmerpenguins)

penguins_data <- penguins
head(penguins_data)

# Inspect data
str(penguins_data)
dim(penguins_data)
names(penguins_data)

# Count missing values in each column
colSums(is.na(penguins_data))

# Count rows with any missing values
sum(!complete.cases(penguins_data))

# Create clean dataset with no missing data
penguins_clean <- na.omit(penguins_data)

# Confirm new dataset size
dim(penguins_clean)

# Summary of cleaned up data with no missing values
summary(penguins_clean)

# Plot of flipper length vs body mass colored by species
plot(
  penguins_clean$flipper_length_mm,
  penguins_clean$body_mass_g,
  col = penguins_clean$species,
  pch = 19,
  xlab = "Flipper Length (mm)",
  ylab = "Body Mass (g)",
  main = "Flipper Length vs Body Mass by Species"
)

legend(
  "topleft",
  legend = levels(penguins_clean$species),
  col = 1:length(levels(penguins_clean$species)),
  pch = 19
)


# boxplot of body mass by species
boxplot(
  body_mass_g ~ species,
  data = penguins_clean,
  col = c("tomato","steelblue","darkgreen"),
  xlab = "Species",
  ylab = "Body Mass (g)",
  main = "Body Mass by Penguin Species"
)

# mean of body mass per species
aggregate(body_mass_g ~ species, data = penguins_clean, mean)


# open png file to write to
png(file.path(fig_dir,"penguin_body_mass_boxplot.png"))

# create boxplot (this is written to the PNG file)
boxplot(
  body_mass_g ~ species,
  data = penguins_clean,
  col = c("tomato","steelblue","darkgreen"),
  xlab = "Species",
  ylab = "Body Mass (g)",
  main = "Body Mass by Penguin Species"
)

# close the graphics device and save the file
dev.off()


# open png file to write to
png(file.path(fig_dir,"penguin_body_mass_boxplot.png"))

# create boxplot (this is written to the PNG file)
boxplot(
  body_mass_g ~ species,
  data = penguins_clean,
  col = c("tomato","steelblue","darkgreen"),
  xlab = "Species",
  ylab = "Body Mass (g)",
  main = "Body Mass by Penguin Species"
)

# close the graphics device and save the file
dev.off()