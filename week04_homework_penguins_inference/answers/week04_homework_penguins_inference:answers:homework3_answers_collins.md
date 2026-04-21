# Homework 3 — Penguins Inference

Name: Mallory Collins
Course: BIOL 696 Graduate Research Workflows  
Instructor: Dr. Jan E. Janecka  
Semester: Spring 2026  


Visualize the data first
Decide which test is appropriate
t-test → comparing two groups
linear model → testing a relationship between variables
State your hypothesis
Run the statistical test
Interpret the result


Question 1 — Do male and female penguins differ in body mass?
Do males and females appear different in body mass?
yes
Which statistical test should you use and why?
t test because we are just comparing two groups and if their variation of the one variable weight is significant

State your null and alternative hypotheses
null: penguin weight is not significantly different between the sexes
alternative: penguin weight is significantly different between males and females

What is the p-value?
4.79e-16
Do you reject the null hypothesis?
yes
What does this mean biologically?
there is a significant difference in penguin weight between the sexes
Did the statistical result match your visualization?
yes

Does there appear to be a relationship?
yes a positive relationship

Which statistical test should you use and why?
liner regression to see how the data fits the trend line

State your null and alternative hypotheses
There is no significant difference between flipper length and body mass in penguins
There is a significant difference between flipper length and body mass in penguins

s the relationship statistically significant?
yes
Is the relationship positive or negative?
positive
What does R-squared tell you?
how strongly the data fits the trend line
How strong is this relationship biologically?
very strong

Do the species appear different?
yes
Which statistical approach would you use here?
t test
Why might a simple t-test not be sufficient?
because you are comparing mass across multiple different groups (species)

What test would be appropriate for comparing more than two groups?
A two way t test
Why is it important to match the test to the question?
so you can compare data different ways to see the significance of different combinations of relationships

When should you use a t-test vs a linear model?
T test, comparing a variable between groups, linear regression, how well the data fits a trend, strength of relationship
Why is visualization important before statistical testing?
because data can be visualized and represented multiple ways to compare relationships. Sigficance of data is not always fully representative of relationship importance.
Does a small p-value always mean the result is biologically important? Explain.
Because the data you provided for the t-test may not be fully representative of the question