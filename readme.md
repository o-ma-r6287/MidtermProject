## Midterm Project

The contents of this repository include the f75 data which refers to data from randomized trial
testing whether a modified milk formula improved child malnutrition outcomes.

## code

This repository contains a code folder which contains code for descriptive statistics,
bivariate analysis, and exploratory analysis. 

descriptive statistics include a table with the mean and standard deviation of the outcome variables
in the f75 data including, *weight1*, *weight2*, *muac1*, and *muac2*. By using the dplyr package and the
gtsummary package, we will create a table1/summary table with the means and standard deviations in the outcome variables.
'code/01_descriptives.R'

bivariate analysis is where we compare outcomes between treatment arms and where we conduct independent t=tests
and wilcoxon tests. We would use wilcox.test and t.test. Using gtsummary, we would make a table showing
means and standard deviations of outcomes based on treatment arm and add a column for p values based on the t test
or wilcoxon test conducted.
'code/02_bivariate_analysis.R'

exploratory analysis includes comparisons of MUAC and weight outcomes by treatment arm using boxplots created with the ggplot2 package. 
these visualizations provide a clear, descriptive comparison of the two arms across time points.
'code/03_boxplots.R'

## output

The output tables from descriptive statistics, bivariate analysis, and the boxplot from exploratory analysis will be saved in the outputs folder. 

## report.rmd

This will contain the descriptive table with the means and standard deviations of the outcomes.
Tables with the means and standard deviations of outcomes based on treatment arm with p values will also be included.
The exploratory analysis boxplots will also be included.
