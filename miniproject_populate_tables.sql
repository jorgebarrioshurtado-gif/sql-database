INSERT INTO employee_information
SELECT EmployeeNumber,
		Attrition,
        Age
FROM raw;

SELECT * FROM employee_information;

INSERT INTO work_conditions
SELECT EmployeeNumber,
		BusinessTravel,
        Department,
        DistanceFromHome,
        JobRole,
        MonthlyIncome,
        OverTime,
        TrainingTimesLastYear
FROM raw;

SELECT * FROM work_conditions;

INSERT INTO work_satisfaction
SELECT EmployeeNumber,
		EnvironmentSatisfaction,
        JobInvolvement,
        JobSatisfaction,
        WorkLifeBalance
FROM raw;

SELECT * FROM work_satisfaction;

INSERT INTO career_path
SELECT EmployeeNumber,
		NumCompaniesWorked,
        YearsAtCompany,
        YearsInCurrentRole,
        YearsSinceLastPromotion,
        YearsWithCurrManager
FROM raw;

SELECT * FROM career_path;