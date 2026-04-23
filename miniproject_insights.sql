-- EMPLOYEE INFORMATION INSIGHTS
-- number of employees with attrition and average age.
SELECT Attrition, COUNT(EmployeeNumber) Employees, ROUND(AVG(Age), 2) Average_Age
FROM employee_information
GROUP BY Attrition;

-- WORK CONDITION INSIGHTS
-- we had to divide the query because there was some categorical and some numerical data in this table.alter
-- For the 
SELECT i.Attrition, 
		ROUND(AVG(DistanceFromHome), 2),
        ROUND(AVG(MonthlyIncome), 2),
        ROUND(AVG(TrainingTimesLastYear), 2)
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY i.Attrition;

--
SELECT i.Attrition, 
		c.BusinessTravel, 
		COUNT(c.BusinessTravel) Count,
		ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.BusinessTravel), 2) Percentage
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY c.BusinessTravel, i.Attrition
ORDER BY c.BusinessTravel, i.Attrition;

--
SELECT i.Attrition, 
		c.Department, 
		COUNT(c.Department) Count,
		ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.Department), 2) Percentage
FROM employee_information i
INNER JOIN work_conditions c
ON c.EmployeeNumber = i.EmployeeNumber
GROUP BY c.Department, i.Attrition
ORDER BY c.Department, i.Attrition;

--
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

--
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
SELECT i.Attrition, 
		ROUND(AVG(EnvironmentSatisfaction), 2),
        ROUND(AVG(JobInvolvement), 2),
        ROUND(AVG(JobSatisfaction), 2),
        ROUND(AVG(WorkLifeBalance), 2)
FROM employee_information i
INNER JOIN work_satisfaction s
ON s.EmployeeNumber = i.EmployeeNumber
GROUP BY i.Attrition;

-- CAREER PATH INSIGHTS
SELECT i.Attrition, 
		ROUND(AVG(NumCompaniesWorked), 2),
        ROUND(AVG(YearsAtCompany), 2),
        ROUND(AVG(YearsInCurrentRole), 2),
        ROUND(AVG(YearsSinceLastPromotion), 2),
        ROUND(AVG(YearsWithCurrManager), 2)
FROM employee_information i
INNER JOIN career_path p
ON p.EmployeeNumber = i.EmployeeNumber
GROUP BY i.Attrition;