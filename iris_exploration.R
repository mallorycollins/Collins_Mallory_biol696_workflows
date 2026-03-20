############################################
# Week 1 — Iris Data Exploration
# Name: YOUR NAME
# Course: BIOL 696 Graduate Research Workflows
############################################

# -----------------------------
# Confirm working directory
# -----------------------------

getwd()

# -----------------------------
# Define file paths
# -----------------------------

data_dir <- "week02_iris_workflow/data"
fig_dir <- "week02_iris_workflow/figures"

# -----------------------------
# Load dataset
# -----------------------------

# load iris data
data(iris)

#click promise

# -----------------------------
# Inspect dataset
# -----------------------------

# check the structure and data types
str(iris)

# check number of rows and columns
dim(iris)

# check the variable names, each variable is a column
names(iris)

# view first few rows
head(iris)

# -----------------------------
# Summarize data
# -----------------------------

# basic summary statistics
summary(iris)

# -----------------------------
# Basic scatter plot
# -----------------------------

# scatter plot of sepal length vs petal length
plot(
  iris$Sepal.Length,
  iris$Petal.Length,
  xlab = "Sepal Length",
  ylab = "Petal Length",
  main = "Sepal Length vs Petal Length"
)

# -----------------------------
# Colored scatter plot
# -----------------------------

# scatter plot of sepal length vs petal length colored by species
plot(
  iris$Sepal.Length,
  iris$Petal.Length,
  col = iris$Species,
  pch = 19,
  xlab = "Sepal Length",
  ylab = "Petal Length",
  main = "Sepal Length vs Petal Length by Species"
)

legend(
  "topleft",
  legend = levels(iris$Species),
  col = 1:length(levels(iris$Species)),
  pch = 19
)

# -----------------------------
# Box plot
# -----------------------------

# box plot of petal length by species
boxplot(
  Petal.Length ~ Species,
  data = iris,
  col = c("tomato", "steelblue", "darkgreen"),
  xlab = "Species",
  ylab = "Petal Length",
  main = "Petal Length by Species"
)


# -----------------------------
# Save figure of box plot
# -----------------------------

# path to figures directory
fig_dir <- "week02_iris_workflow/figures"

# save box plot
png(file.path(fig_dir, "petal_length_by_species.png"))

boxplot(
  Petal.Length ~ Species,
  data = iris,
  col = c("tomato", "steelblue", "darkgreen"),
  xlab = "Species",
  ylab = "Petal Length",
  main = "Petal Length by Species"
)

dev.off()

# save box plot
png(file.path(fig_dir, "petal_length_by_species.png"))

boxplot(
  Petal.Length ~ Species,
  data = iris,
  col = c("tomato", "steelblue", "darkgreen"),
  xlab = "Species",
  ylab = "Petal Length",
  main = "Petal Length by Species"
)

dev.off()

# -----------------------------
# Save figure of box plot
# -----------------------------

# path to figures directory
fig_dir <- "week02_iris_workflow/figures"

# save box plot
png(file.path(fig_dir, "petal_length_by_species.png"))

boxplot(
  Petal.Length ~ Species,
  data = iris,
  col = c("tomato", "steelblue", "darkgreen"),
  xlab = "Species",
  ylab = "Petal Length",
  main = "Petal Length by Species"
)

dev.off()