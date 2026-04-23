-- EMPLOYEE INFORMATION INSIGHTS
-- number of employees with attrition and average age.
-- we added a window function that tell us the percentage of people with attrition and the percentage of people with no attrition
SELECT Attrition, 
	COUNT(EmployeeNumber) Employees, 
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) Percentage,
    ROUND(AVG(Age), 2) Average_Age
FROM employee_information
GROUP BY Attrition;

-- WORK CONDITIONS INSIGHTS
-- we had to divide the query because there was some categorical and some numerical data in this table.alter
-- For the numerical data we did the average of every variable.
SELECT i.Attrition, 
		ROUND(AVG(DistanceFromHome), 2) AVG_DistanceFromHome, 
        ROUND(AVG(MonthlyIncome), 2) AVG_MonthlyIncome,
        ROUND(AVG(TrainingTimesLastYear), 2) AVG_TrainingTimesLastYear
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY i.Attrition;

-- for the categorical data, we decided to make four different queries. 
-- we needed concise insights, we could have make an super query which output would be a super big table with a lot of insights
-- but that could be messier and less effective as we would be focusing on specific situations more than in the big picture that is what concern us.
-- query for the count and percentage relative to their business travel frequency
SELECT i.Attrition, 
		c.BusinessTravel, 
		COUNT(c.BusinessTravel) Count,
		ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.BusinessTravel), 2) Percentage
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY c.BusinessTravel, i.Attrition
ORDER BY c.BusinessTravel, i.Attrition;

-- query for the count and percentage relative to their department
SELECT i.Attrition, 
		c.Department, 
		COUNT(c.Department) Count,
		ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.Department), 2) Percentage
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY c.Department, i.Attrition
ORDER BY c.Department, i.Attrition;

-- query for the count and percentage relative to their job roles
-- as the job role is closely related to their salary, we decided to include the avarage monthly income for each job role dependidg on the attrition.
SELECT i.Attrition, 
		c.JobRole, 
		COUNT(c.Department) Count,
		ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.JobRole), 2) Percentage,
		ROUND(AVG(MonthlyIncome), 2) AverageIncome
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY c.JobRole, i.Attrition
ORDER BY c.JobRole, i.Attrition;

-- query for the count and percentage relative to the overtime
SELECT i.Attrition, 
		c.OverTime, 
		COUNT(c.Department) Count,
		ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.OverTime), 2) Percentage
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY c.OverTime, i.Attrition
ORDER BY c.OverTime, i.Attrition;

-- WORK SATISFACTION INSIGHTS
-- these were numerical data, they showed work satisfaction variables rated between 1-4.
SELECT i.Attrition, 
		ROUND(AVG(EnvironmentSatisfaction), 2) AVG_EnvironmentSatisfaction,
        ROUND(AVG(JobInvolvement), 2) AVG_JobInvolvement,
        ROUND(AVG(JobSatisfaction), 2) AVG_JobSatisfaction,
        ROUND(AVG(WorkLifeBalance), 2) AVG_WorkLifeBalance
FROM employee_information i
INNER JOIN work_satisfaction s
ON s.EmployeeNumber = i.EmployeeNumber
GROUP BY i.Attrition;

-- CAREER PATH INSIGHTS
-- they were all numerical data, so we decided to do the mean.
SELECT i.Attrition, 
		ROUND(AVG(NumCompaniesWorked), 2) AVG_NumCompaniesWorked,
        ROUND(AVG(YearsAtCompany), 2) AVG_YearsAtCompany,
        ROUND(AVG(YearsInCurrentRole), 2) AVG_YearsInCurrentRole,
        ROUND(AVG(YearsSinceLastPromotion), 2) AVG_YearsSinceLastPromotion,
        ROUND(AVG(YearsWithCurrManager), 2) AVG_YearsWithCurrManager
FROM employee_information i
INNER JOIN career_path p
ON p.EmployeeNumber = i.EmployeeNumber
GROUP BY i.Attrition;