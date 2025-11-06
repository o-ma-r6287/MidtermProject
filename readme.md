## Midterm Project

The contents of this repository include the f75 data which refers to data from randomized trial
testing whether a modified milk formula improved child malnutrition outcomes.

## code

This repository contains a code folder which contains code for descriptive statistics,
bivariate analysis, and linear regression. 

descriptive statistics include a table with the mean and standard deviation of the outcome variables
in the f75 data including, *weight1*, *weight2*, *muac1*, and *muac2*. By using the dplyr package and the
gtsummary package, we will create a table1/summary table with the means and standard deviations in the outcome variables.
'code/01_descriptive.R'

bivariate analysis is where we compare outcomes between treatment arms and where we conduct independent t=tests
and wilcoxon tests. We would use wilcox.test and t.test. Using gtsummary, we would make a table showing
means and standard deviations of outcomes based on treatment arm and add a column for p values based on the t test
or wilcoxon test conducted.
'code/02_bivariate_analysis.R'

linear regression includes an adjusted linear regression model including confounders and testing for effect measure modification with interaction terms
using the lm() function. The model summary could be seen with the summary() function. The ggplot2 package
would be used to visualize the linear regression model with ggplot(df, aes(...)geom_point...) to ensure it is
a scatter plot. 
'code/03_linear_regression.R'

## output

The output tables from descriptive statistics, bivariate analysis, and the scatter plot from linear regression
will be saved in the outputs folder. 

## report.rmd

This will contain the descriptive table with the means and standard deviations of the outcomes.
Tables with the means and standard deviations of outcomes based on treatment arm with p values will also be included.
The adjusted linear regression scatter plot will also be included.