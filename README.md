# Employee Salary Analysis: Identifying Outliers and Department Statistics

## Project Overview

This project focuses on analyzing employee salaries within different departments to identify outliers and calculate department statistics. The analysis involves computing standard deviation, average salary, coefficient of variation, and identifying potential outliers using z-scores.

## Data Source

The data for this project is sourced from the `[dbo].[Employee_Salaries$]` table. It contains information about employee salaries and their respective departments.

## Project Steps

### Step 1: Department Statistics Calculation

In this step, we calculate the standard deviation and average salary for each department. We consider salaries greater than or equal to $10,000 for this analysis.

### Step 2: Identifying Outliers

In this step, we identify outliers within each department by calculating the z-score for each employee's salary and then filtering those with z-scores outside the range of -1.96 to 1.96.

### Step 3: Coefficient of Variation Calculation

Calculate the coefficient of variation (CV) for each department. CV is the ratio of the standard deviation to the average salary, which provides a measure of relative variation.

### Key Concepts
1. Z-Score
The z-score is a statistical measure that quantifies how many standard deviations a data point is away from the mean of a dataset. It's calculated using the formula (x - μ) / σ, where x is the data point, μ is the mean, and σ is the standard deviation. In this project, we use a z-score threshold of 1.96 to identify potential outliers. Data points with z-scores greater than 1.96 or less than -1.96 are considered outliers due to their significant deviation from the mean.

2. Coefficient of Variation (CV)
The coefficient of variation (CV) is a relative measure of data variability. It's calculated as (σ / μ) * 100, where σ is the standard deviation and μ is the mean of the dataset. The CV is expressed as a percentage and provides insight into the variability of data relative to its mean. A higher CV indicates greater variability, while a lower CV suggests less variability.

3. Outliers
Outliers are data points that significantly deviate from the rest of the dataset. They can arise due to errors, extreme values, or other factors. In this project, outliers are identified using the z-score. Data points with z-scores beyond the threshold of 1.96 are considered potential outliers. This threshold is based on a 95% confidence interval, indicating that about 95% of data points are expected to fall within this range in a normal distribution.

## Project Outputs

The final output of the project includes a summary table for each department, including the following information:

- Department name
- Standard deviation of salaries
- Average salary
- Coefficient of variation (CV)
- Count of outliers based on z-scores

## Conclusion

This project demonstrates an analytical approach to identifying outliers and calculating department statistics for employee salaries. The analysis provides valuable insights into salary distribution, variability, and potential anomalies within each department. The results can assist in making informed decisions related to compensation and identifying departments that might require further investigation.
