--3.1

--A
--Print the first three characters and last three characters of all country names. Print in capital letters.
SELECT
	UPPER(SUBSTR(COUNTRY_NAME, 1, 3)) AS FIRST_THREE_LETTERS,
	UPPER(SUBSTR(COUNTRY_NAME, LENGTH(COUNTRY_NAME)-2)) AS LAST_THREE_LETTERS
FROM
	COUNTRIES;
	
--B
--Print all employee full names (first name followed by a space then followed by last name). All names should be printed in width of 60 characters and left padded with '*' symbol for names less than 60 characters. 
SELECT
	LPAD(FIRST_NAME || ' ' || LAST_NAME, 60, '*') AS FULL_NAME
FROM
	EMPLOYEES;

--C
--Print all job titles that contain the text 'manager'. 
SELECT
	JOB_TITLE
FROM
	JOBS
WHERE
	INSTR(LOWER(JOB_TITLE), 'manager')>0;
	

--3.2

--A
--Print employee last name and number of days employed. Print the second information rounded up to 2 decimal places.
SELECT
	LAST_NAME ,
	ROUND(SYSDATE-HIRE_DATE, 2) AS NUMBER_OF_DAYS_EMPLOYED
FROM
	EMPLOYEES;

--B
--Print employee last name and number of years employed. Print the second information truncated up to 3 decimal place. 
SELECT
	LAST_NAME,
	TRUNC((SYSDATE-HIRE_DATE)/ 365, 3) AS NUMBER_OF_YEARS_EMPLOYED
FROM
	EMPLOYEES;
	

--3.3

--A
--For all employees, find the number of years employed. Print first names and number of years employed for each employee. 
SELECT 
	FIRST_NAME ,
	MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/ 12 AS NUMBER_OF_YEARS_EMPLOYED
FROM
	EMPLOYEES;

--B
--Suppose you need to find the number of days each employee worked during the first month of his joining. Write an SQL query to find this information for all employees. 
SELECT
	FIRST_NAME ,
	ADD_MONTHS(TRUNC(HIRE_DATE, 'MONTH'), 1)-HIRE_DATE AS NUMBER_OF_DAYS_WORKED_DURING_FIRST_MONTH
FROM
	EMPLOYEES;


--3.4

--A
--Print the commission_pct values of all employees whose commission is at least 20%. Use NVL function. 
SELECT
	EMPLOYEE_ID ,
	COMMISSION_PCT
FROM
	EMPLOYEES
WHERE
	NVL(COMMISSION_PCT, 0)>= 0.20;

--B
--Print the total salary of an employee for 5 years and 6 months period. Print all employee last names along with this salary information. Use NVL function assuming that salary may contain NULL values. 
SELECT
	LAST_NAME ,
	NVL(SALARY, 0)* 66 AS SALARY
FROM
	EMPLOYEES;


--3.5

--A
--Print hire dates of all employees in the following formats:  (i) 13th February, 1998 (ii) 13 February, 1998.
SELECT
	TO_CHAR(HIRE_DATE, 'DDth MONTH,YYYY') AS FORMAT_1,
	TO_CHAR(HIRE_DATE, 'DD MONTH,YYYY') AS FORMAT_2
FROM
	EMPLOYEES;