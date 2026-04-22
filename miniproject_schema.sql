DROP DATABASE IF EXISTS `ibm`;
CREATE DATABASE IF NOT EXISTS `ibm`;

USE ibm;

CREATE TABLE IF NOT EXISTS `raw` (
	`EmployeeNumber` INTEGER UNSIGNED NOT NULL UNIQUE,
	`Attrition` VARCHAR(10),
	`Age` TINYINT UNSIGNED,
	`BusinessTravel` VARCHAR(255),
	`Department` VARCHAR(255),
	`DistanceFromHome` TINYINT UNSIGNED,
	`EnvironmentSatisfaction` TINYINT UNSIGNED,
	`JobInvolvement` TINYINT UNSIGNED,
	`JobRole` VARCHAR(255),
	`JobSatisfaction` TINYINT UNSIGNED,
	`MonthlyIncome` MEDIUMINT UNSIGNED,
	`NumCompaniesWorked` TINYINT UNSIGNED,
	`OverTime` VARCHAR(10),
	`TrainingTimesLastYear` TINYINT UNSIGNED,
	`WorkLifeBalance` TINYINT UNSIGNED,
	`YearsAtCompany` TINYINT UNSIGNED,
	`YearsInCurrentRole` TINYINT UNSIGNED,
	`YearsSinceLastPromotion` TINYINT UNSIGNED,
	`YearsWithCurrManager` TINYINT UNSIGNED,
	PRIMARY KEY(`EmployeeNumber`)
);


CREATE TABLE IF NOT EXISTS `employee_information` (
	`EmployeeNumber` INTEGER UNSIGNED NOT NULL UNIQUE,
	`Attrition` VARCHAR(10),
	`Age` TINYINT UNSIGNED,
	PRIMARY KEY(`EmployeeNumber`)
);


CREATE TABLE IF NOT EXISTS `work_conditions` (
	`EmployeeNumber` INTEGER UNSIGNED NOT NULL UNIQUE,
	`BusinessTravel` VARCHAR(255),
	`Department` VARCHAR(255),
	`DistanceFromHome` TINYINT UNSIGNED,
	`JobRole` VARCHAR(255),
	`MonthlyIncome` MEDIUMINT UNSIGNED,
	`OverTime` VARCHAR(10),
	`TrainingTimesLastYear` TINYINT UNSIGNED,
	PRIMARY KEY(`EmployeeNumber`)
);


CREATE TABLE IF NOT EXISTS `work_satisfaction` (
	`EmployeeNumber` INTEGER UNSIGNED NOT NULL UNIQUE,
	`EnvironmentSatisfaction` TINYINT UNSIGNED,
	`JobInvolvement` TINYINT UNSIGNED,
	`JobSatisfaction` TINYINT UNSIGNED,
	`WorkLifeBalance` TINYINT UNSIGNED,
	PRIMARY KEY(`EmployeeNumber`)
);


CREATE TABLE IF NOT EXISTS `career_path` (
	`EmployeeNumber` INTEGER UNSIGNED NOT NULL UNIQUE,
	`NumCompaniesWorked` TINYINT UNSIGNED,
	`YearsAtCompany` TINYINT UNSIGNED,
	`YearsInCurrentRole` TINYINT UNSIGNED,
	`YearsSinceLastPromotion` TINYINT UNSIGNED,
	`YearsWithCurrManager` TINYINT UNSIGNED,
	PRIMARY KEY(`EmployeeNumber`)
);


ALTER TABLE `career_path`
ADD FOREIGN KEY(`EmployeeNumber`) REFERENCES `employee_information`(`EmployeeNumber`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `work_conditions`
ADD FOREIGN KEY(`EmployeeNumber`) REFERENCES `employee_information`(`EmployeeNumber`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `work_satisfaction`
ADD FOREIGN KEY(`EmployeeNumber`) REFERENCES `employee_information`(`EmployeeNumber`)
ON UPDATE NO ACTION ON DELETE NO ACTION;