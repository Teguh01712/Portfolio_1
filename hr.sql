CREATE DATABASE projects;

USE projects;

select * from hr;
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

SELECT * FROM hr;


DESCRIBE hr;

SELECT birthdate FROM hr;

SET sql_safe_updates=0;

UPDATE hr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(STR_TO_DATE(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(STR_TO_DATE(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
WHEN hire_date LIKE '%/%' THEN date_format(STR_TO_DATE(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(STR_TO_DATE(hire_date,'%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate iS NOT NULL AND termdate !='';

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SET sql_mode = 'ALLOW_INVALID_DATES';


ALTER TABLE hr
MODIFY COLUMN termdate text;

SELECT birthdate from hr;
SELECT termdate from hr;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;
SELECT hire_date from hr;

ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate,CURDATE());

SELECT birthdate,age FROM hr;

SELECT 
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 1;

