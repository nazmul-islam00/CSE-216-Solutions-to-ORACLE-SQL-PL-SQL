# CSE-216-Solutions-to-ORACLE-SQL-PL-SQL
### This repository contains solutions to the book "A Brief Introduction to ORACLE SQL/PL-SQL" by Prof. Sukarna Barua sir.

# [Chapter 1](#chapter-1)
# [Chapter 2](#chapter-2)
# [Chapter 3](#chapter-3)
# [Chapter 4](#chapter-4)
# [Chapter 5](#chapter-5)
# [Chapter 6](#chapter-6)
# [Chapter 7](#chapter-7)
# [Chapter 8](#chapter-8)

# <a name="chapter-1">Chapter 1</a>
### No exercises

# <a name="chapter-2">Chapter 2</a>

# [Section 2.1](#section-2.1)
# [Section 2.2](#section-2.2)
# [Section 2.3](#section-2.3)

# <a name="section-2.1">Section 2.1</a>
> a. Write an SQL query to retrieve all country names.<br>
```sql
SELECT 
	COUNTRY_NAME
FROM
	COUNTRIES;
```
> b. Write an SQL query to retrieve all job titles.<br>
```sql
SELECT 
	JOB_TITLE
FROM
	JOBS;
```
> c. Write an SQL query to retrieve all MANAGER_IDs. <br>
```sql
SELECT 
	DISTINCT MANAGER_ID
FROM
	EMPLOYEES;
```
> d. Write an SQL query to retrieve all city names. Remove duplicate outputs.<br>
```sql
SELECT 
	DISTINCT CITY
FROM
	LOCATIONS;
```
> e. Write an SQL query to retrieve LOCATION_ID, ADDRESS from LOCATIONS table. The ADDRESS should print each location in the following format: STREET_ADDRESS, CITY, STATE_PROVINCE, POSTAL_CODE.<br>
```sql
SELECT 
	LOCATION_ID,
	STREET_ADDRESS || ',' || CITY || ',' || STATE_PROVINCE || ',' || POSTAL_CODE AS ADDRESS
FROM
	LOCATIONS;
```

# <a name="section-2.2">Section 2.2</a>
> a. Select names of all employees who have joined before January 01, 1998.<br>
```sql
SELECT 
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM 
	EMPLOYEES
WHERE 
	HIRE_DATE <'01-JAN-2098';
```
> b. Select all locations in the following countries: Canada, Germany, United Kingdom.<br>
```sql
SELECT 
	*
FROM
	LOCATIONS
WHERE 
	COUNTRY_ID IN ('CA', 'DE', 'UK');
```
> c. Select first names of all employees who do not get any commission.<br>
```sql
SELECT 
	FIRST_NAME
FROM 
	EMPLOYEES
WHERE 
	COMMISSION_PCT IS NULL;
```
> d. Select first names of employees whose last name starts with an 'a'.<br>
```sql
SELECT 
	FIRST_NAME
FROM
	EMPLOYEES
WHERE 
	LAST_NAME LIKE 'A%';
```
> e. Select first names of employees whose last name starts with an 's' and ends with an 'n'.<br>
```sql
SELECT
	FIRST_NAME
FROM
	EMPLOYEES
WHERE 
	LAST_NAME LIKE 'S%n';
```
> f. Select all department names whose MANAGER_ID is 100.<br>
```sql
SELECT 
	DEPARTMENT_NAME
FROM 
	DEPARTMENTS
WHERE
	MANAGER_ID = 100;
```
> g. Select all names of employees whose job type is 'AD_PRES' and whose salary is at least 23000.<br>
```sql
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM
	EMPLOYEES
WHERE
	JOB_ID = 'AD_PRES'
	AND SALARY >= 23000;
```
> h. Select names of all employees whose last name do not contain the character 's'.<br>
```sql
SELECT
	FIRST_NAME || ' ' || LAST_NAME
FROM
	EMPLOYEES
WHERE
	LOWER(LAST_NAME) NOT LIKE '%s%';
```
> i. Select names and COMMISSION_PCT of all employees whose commission is at most 0.30.<br>
```sql
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME,
	COMMISSION_PCT
FROM
	EMPLOYEES
WHERE
	COMMISSION_PCT IS NULL
	OR COMMISSION_PCT <= 0.30;
```
> j. Select names of all employees who have joined after January 01, 1998.<br>
```sql
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM
	EMPLOYEES
WHERE
	HIRE_DATE >'01-JAN-1998';
```
> k. Select names of all employees who have joined in the year 1998.<br>
```sql
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM
	EMPLOYEES
WHERE
	HIRE_DATE BETWEEN '01-JAN-1998' AND '31-DEC-1998';
```

# <a name="section-2.3">Section 2.3</a>
> a. Select names, salary, and commissions of all employees of job type 'AD_PRES'. Sort the result in ascending order of commission and then descending order of salary.<br>
```sql
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME,
	SALARY ,
	COMMISSION_PCT
FROM
	EMPLOYEES
WHERE
	JOB_ID = 'AD_PRES'
ORDER BY
	NVL(COMMISSION_PCT, 0) ASC,
	SALARY DESC;
```
> b. Retrieve all country names in lexicographical ascending order.<br>
```sql
SELECT
	COUNTRY_NAME
FROM
	COUNTRIES
ORDER BY
	COUNTRY_NAME ASC;
```

# <a name="chapter-3">Chapter 3</a>

# [Section 3.1](#section-3.1)
# [Section 3.2](#section-3.2)
# [Section 3.3](#section-3.3)
# [Section 3.4](#section-3.4)
# [Section 3.5](#section-3.5)

# <a name="section-3.1">Section 3.1</a>
> a. Print the first three characters and last three characters of all country names. Print in capital letters.<br>
```sql
SELECT
	UPPER(SUBSTR(COUNTRY_NAME, 1, 3)) AS FIRST_THREE_LETTERS,
	UPPER(SUBSTR(COUNTRY_NAME, LENGTH(COUNTRY_NAME)-2)) AS LAST_THREE_LETTERS
FROM
	COUNTRIES;
```
> b. Print all employee full names (first name followed by a space then followed by last name). All names should be printed in width of 60 characters and left padded with '*' symbol for names less than 60 characters.<br>
```sql
SELECT
	LPAD(FIRST_NAME || ' ' || LAST_NAME, 60, '*') AS FULL_NAME
FROM
	EMPLOYEES;
```
> c. Print all job titles that contain the text 'manager'.<br>
```sql
SELECT
	JOB_TITLE
FROM
	JOBS
WHERE
	INSTR(LOWER(JOB_TITLE), 'manager')>0;
```

# <a name="section-3.2">Section 3.2</a>
> a. Print employee last name and number of days employed. Print the second information rounded up to 2 decimal places.<br>
```sql
SELECT
	LAST_NAME ,
	ROUND(SYSDATE-HIRE_DATE, 2) AS NUMBER_OF_DAYS_EMPLOYED
FROM
	EMPLOYEES;
```
> b. Print employee last name and number of years employed. Print the second information truncated up to 3 decimal place.<br>
```sql
SELECT
	LAST_NAME,
	TRUNC((SYSDATE-HIRE_DATE)/ 365, 3) AS NUMBER_OF_YEARS_EMPLOYED
FROM
	EMPLOYEES;
```

# <a name="section-3.3">Section 3.3</a>
> a. For all employees, find the number of years employed. Print first names and number of years employed for each employee.<br>
```sql
SELECT 
	FIRST_NAME ,
	MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/ 12 AS NUMBER_OF_YEARS_EMPLOYED
FROM
	EMPLOYEES;
```
> b. Suppose you need to find the number of days each employee worked during the first month of his joining. Write an SQL query to find this information for all employees.<br>
```sql
SELECT
	FIRST_NAME ,
	ADD_MONTHS(TRUNC(HIRE_DATE, 'MONTH'), 1)-HIRE_DATE AS NUMBER_OF_DAYS_WORKED_DURING_FIRST_MONTH
FROM
	EMPLOYEES;
```

# <a name="section-3.4">Section 3.4</a>
> a. Print the commission_pct values of all employees whose commission is at least 20%. Use NVL function.<br>
```sql
SELECT
	EMPLOYEE_ID ,
	COMMISSION_PCT
FROM
	EMPLOYEES
WHERE
	NVL(COMMISSION_PCT, 0)>= 0.20;
```
> b. Print the total salary of an employee for 5 years and 6 months period. Print all employee last names along with this salary information. Use NVL function assuming that salary may contain NULL values.<br>
```sql
SELECT
	LAST_NAME ,
	NVL(SALARY, 0)* 66 AS SALARY
FROM
	EMPLOYEES;
```

# <a name="section-3.5">Section 3.5</a>
> a. Print hire dates of all employees in the following formats:  (i) 13th February, 1998 (ii) 13 February, 1998.<br>
```sql
SELECT
	TO_CHAR(HIRE_DATE, 'DDth MONTH,YYYY') AS FORMAT_1,
	TO_CHAR(HIRE_DATE, 'DD MONTH,YYYY') AS FORMAT_2
FROM
	EMPLOYEES;
```

# <a name="chapter-4">Chapter 4</a>

# [Section 4.1](#section-4.1)
# [Section 4.2](#section-4.2)
# [Section 4.3](#section-4.3)

# <a name="section-4.1">Section 4.1</a>
> a. For all managers, find the number of employees he/she manages. Print the MANAGER_ID and total number of such employees.<br>
```sql
SELECT
	MANAGER_ID ,
	COUNT(*) AS EMPLOYEES_MANAGED
FROM
	EMPLOYEES
GROUP BY
	MANAGER_ID;
```
> b. For all departments, find the number of employees who get more than 30k salary. Print the DEPARTMENT_ID and total number of such employees.<br>
```sql
SELECT
	DEPARTMENT_ID ,
	COUNT(*) AS NUMBER_OF_EMPLOYEES_WITH_MORE_THAN_30K
FROM
	EMPLOYEES
WHERE
	SALARY >30000
GROUP BY
	DEPARTMENT_ID;
```
> c. Find the minimum, maximum, and average salary of all departments except DEPARTMENT_ID 80. Print DEPARTMENT_ID, minimum, maximum, and average salary. Sort the results in descending order of average salary first, then maximum salary, then minimum salary. Use column alias to rename column names in output for better display.<br>
```sql
SELECT
	DEPARTMENT_ID,
	MIN(SALARY) AS MIN_SALARY,
	MAX(SALARY) AS MAX_SALARY,
	AVG(SALARY) AS AVG_SALARY
FROM
	EMPLOYEES
GROUP BY
	DEPARTMENT_ID
HAVING
	DEPARTMENT_ID <> 80
ORDER BY
	AVG_SALARY DESC,
	MAX_SALARY DESC,
	MIN_SALARY DESC;
```

# <a name="section-4.2">Section 4.2</a>
> a. Find for each department, the average salary of the department. Print only those DEPARTMENT_ID and average salary whose average salary is at most 50k.<br>
```sql
SELECT
	DEPARTMENT_ID,
	AVG(SALARY) AS AVG_SALARY
FROM
	EMPLOYEES
GROUP BY
	DEPARTMENT_ID
HAVING
	AVG(SALARY)<= 50000;
```

# <a name="section-4.3">Section 4.3</a>
> a. Find number of employees in each salary group. Salary groups are considered as follows. Group 1: 0k to <5K, 5k to <10k, 10k to <15k, and so on.<br>
```sql
SELECT 
	TRUNC((SALARY / 5000))+ 1 AS SALARY_GROUP,
	COUNT(*) EMPLOYEE_COUNT
FROM
	EMPLOYEES
GROUP BY
	TRUNC((SALARY / 5000));
```
> b. Find the number of employees that were hired in each year in each job type. Print year, job id, and total employees hired.<br>
```sql
SELECT
	TO_CHAR(HIRE_DATE, 'YYYY') AS YEAR,
	JOB_ID,
	COUNT(*) AS NUMBER_OF_EMPLOYEES_HIRED
FROM
	EMPLOYEES
GROUP BY
	TO_CHAR(HIRE_DATE, 'YYYY'),
	JOB_ID;
```

# <a name="chapter-5">Chapter 5</a>

# [Section 5.1](#section-5.1)

# <a name="section-5.1">Section 5.1</a>
> a. For each employee print last name, salary, and job title.<br>
```sql
SELECT
	E.LAST_NAME,
	E.SALARY,
	J.JOB_TITLE
FROM
	EMPLOYEES E
JOIN JOBS J
ON
	E.JOB_ID = J.JOB_ID ;
```
> b. For each department, print department name and country name it is situated in. <br>
```sql
SELECT
	D.DEPARTMENT_NAME ,
	C.COUNTRY_NAME
FROM
	DEPARTMENTS D
JOIN LOCATIONS L ON
	D.LOCATION_ID = L.LOCATION_ID
JOIN COUNTRIES C ON
	L.COUNTRY_ID = C.COUNTRY_ID;
```
> c. For each country, finds total number of departments situated in the country.<br>
```sql
SELECT
	C.COUNTRY_NAME,
	COUNT(*) AS NUMBER_OF_DEPARTMENTS_IN_THE_COUNTRY
FROM
	COUNTRIES C
JOIN LOCATIONS L ON
	L.COUNTRY_ID = C.COUNTRY_ID
JOIN DEPARTMENTS D ON
	D.LOCATION_ID = L.LOCATION_ID
GROUP BY
	C.COUNTRY_NAME;
```
> d. For each employee, finds the number of job switches of the employee.<br>
```sql
SELECT
	E.EMPLOYEE_ID,
	COUNT(JH.EMPLOYEE_ID) AS JOB_SWITCHES
FROM
	EMPLOYEES E
LEFT JOIN JOB_HISTORY JH ON
	E.EMPLOYEE_ID = JH.EMPLOYEE_ID
GROUP BY
	E.EMPLOYEE_ID;
```
> e. For each department and job types, find the total number of employees working. Print department names, job titles, and total employees working.<br>
```sql
SELECT
	D.DEPARTMENT_NAME,
	J.JOB_TITLE,
	COUNT(*)
FROM
	EMPLOYEES E
JOIN DEPARTMENTS D ON
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN JOBS J ON
	E.JOB_ID = J.JOB_ID
GROUP BY
	D.DEPARTMENT_NAME ,
	J.JOB_TITLE;
```
> f. For each employee, finds the total number of employees those were hired before him/her. Print employee last name and total employees.<br>
```sql
SELECT
	E1.LAST_NAME,
	COUNT(E2.EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES_HIRED_BEFORE
FROM
	EMPLOYEES E1
LEFT JOIN EMPLOYEES E2 ON
	E1.HIRE_DATE>E2.HIRE_DATE
GROUP BY
	E1.EMPLOYEE_ID,
	E1.LAST_NAME;
```
> g. For each employee, finds the total number of employees those were hired before him/her and those were hired after him/her. Print employee last name, total employees hired before him, and total employees hired after him.<br>
```sql
SELECT
	E1.LAST_NAME,
	COUNT(DISTINCT E2.EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES_HIRED_BEFORE,
	COUNT(DISTINCT E3.EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES_HIRED_AFTER
FROM
	EMPLOYEES E1
LEFT JOIN EMPLOYEES E2 ON
	E1.HIRE_DATE>E2.HIRE_DATE
LEFT JOIN EMPLOYEES E3 ON
	E1.HIRE_DATE<E3.HIRE_DATE
GROUP BY
	E1.EMPLOYEE_ID,
	E1.LAST_NAME;
```
> h. Find the employees having salaries greater than at least three other employees<br>
```sql
SELECT
	E1.EMPLOYEE_ID
FROM
	EMPLOYEES E1
JOIN EMPLOYEES E2 ON
	E1.SALARY>E2.SALARY
GROUP BY
	E1.EMPLOYEE_ID
HAVING
	COUNT(E2.EMPLOYEE_ID)>= 3;
```
> i. For each employee, find his rank, i.e., position with respect to salary. The highest salaried employee should get rank 1 and lowest salaried employee should get the last rank. Employees with same salary should get same rank value. Print employee last names and his/he rank.<br>
```sql
SELECT
	E1.LAST_NAME,
	COUNT(DISTINCT E2.SALARY)+ 1 AS RANK
FROM
	EMPLOYEES E1
LEFT JOIN EMPLOYEES E2 ON
	E1.SALARY<E2.SALARY
GROUP BY
	E1.EMPLOYEE_ID,
	E1.LAST_NAME;
```
> j. Finds the names of employees and their salaries for the top three highest salaried employees. The number of employees in your output should be more than three if there are employees with same salary.<br>
```sql
SELECT
	E1.FIRST_NAME || ' ' || E1.LAST_NAME AS NAME,
	E1.SALARY
FROM
	EMPLOYEES E1
LEFT JOIN EMPLOYEES E2 ON
	E1.SALARY<E2.SALARY
GROUP BY
	E1.EMPLOYEE_ID,
	E1.FIRST_NAME,
	E1.LAST_NAME,
	E1.SALARY
HAVING
	COUNT(DISTINCT E2.SALARY)<3;
```

# <a name="chapter-6">Chapter 6</a>

# [Section 6.1](#section-6.1)
# [Section 6.2](#section-6.2)

# <a name="section-6.1">Section 6.1</a>
> a. Find the last names of all employees that work in the SALES department.<br>
```sql
SELECT
	LAST_NAME
FROM
	EMPLOYEES
WHERE
	DEPARTMENT_ID =(
	SELECT
		DEPARTMENT_ID
	FROM
		DEPARTMENTS
	WHERE
		UPPER(DEPARTMENT_NAME)= 'SALES');
```
> b. Find the last names and salaries of those employees who get higher salary than at least one employee of SALES department.<br>
```sql
SELECT
	LAST_NAME ,
	SALARY
FROM
	EMPLOYEES
WHERE
	SALARY > ANY(
	SELECT
		SALARY
	FROM
		EMPLOYEES
	WHERE
		DEPARTMENT_ID =(
		SELECT
			DEPARTMENT_ID
		FROM
			DEPARTMENTS
		WHERE
			UPPER(DEPARTMENT_NAME)= 'SALES'));
```
> c. Find the last names and salaries of those employees whose salary is higher than all employees of SALES department.<br>
```sql
SELECT
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES
WHERE
	SALARY > ALL(
	SELECT
		SALARY
	FROM
		EMPLOYEES
	WHERE
		DEPARTMENT_ID =(
		SELECT
			DEPARTMENT_ID
		FROM
			DEPARTMENTS
		WHERE
			UPPER(DEPARTMENT_NAME)= 'SALES'));
```
> d. Find the last names and salaries of those employees whose salary is within ± 5k of the average salary of SALES department.<br>
```sql 
SELECT
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES
WHERE
	SALARY BETWEEN 
(
	SELECT
		AVG(SALARY)
	FROM
		EMPLOYEES
	WHERE
		DEPARTMENT_ID =(
		SELECT
			DEPARTMENT_ID
		FROM
			DEPARTMENTS
		WHERE
			UPPER(DEPARTMENT_NAME)= 'SALES'))-5000 AND (
	SELECT
		AVG(SALARY)
	FROM
		EMPLOYEES
	WHERE
		DEPARTMENT_ID =(
		SELECT
			DEPARTMENT_ID
		FROM
			DEPARTMENTS
		WHERE
			UPPER(DEPARTMENT_NAME)= 'SALES'))+ 5000;
```

# <a name="section-6.2">Section 6.2</a>
> a. Find those employees whose salary is higher than at least three other employees. Print last names and salary of each employee. You cannot use join in the main query. Use sub-query in WHERE clause only. You can use join in the sub-queries.<br>
```sql 
SELECT
	E1.LAST_NAME ,
	E1.SALARY
FROM
	EMPLOYEES E1
WHERE
	(
	SELECT
		COUNT(*)
	FROM
		EMPLOYEES E2
	WHERE
		E2.SALARY<E1.SALARY)>= 3;
```
> b. Find those departments whose average salary is greater than the minimum salary of all other departments. Print department names. Use sub-query. You can use join in the sub-queries.<br>
```sql
SELECT
	E1.DEPARTMENT_ID
FROM
	EMPLOYEES E1
GROUP BY
	E1.DEPARTMENT_ID
HAVING
	AVG(E1.SALARY)>(
	SELECT
		MIN(SALARY)
	FROM
		EMPLOYEES E2
	WHERE 
		E2.DEPARTMENT_ID <> E1.DEPARTMENT_ID);
```
> c. Find those department names which have the highest number of employees in service. Print department names. Use sub-query. You can use join in the sub-queries.<br>
```sql
SELECT
	DEPARTMENT_ID
FROM
	EMPLOYEES
GROUP BY
	DEPARTMENT_ID
HAVING
	COUNT(EMPLOYEE_ID)= (
	SELECT
		MAX(NUMBER_OF_EMPLOYEES)
	FROM
		(
		SELECT
			COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES
		FROM
			EMPLOYEES
		GROUP BY
			DEPARTMENT_ID) );
```
> d. Find those employees who worked in more than one department in the company. Print employee last names. You cannot use join in the main query. Use sub-query. You can use join in the sub-queries. <br>
```sql
SELECT
	E.EMPLOYEE_ID
FROM
	EMPLOYEES E
WHERE
	(
	SELECT
		COUNT(DISTINCT DEPARTMENT_ID)
	FROM
		JOB_HISTORY JH
	WHERE
		JH.EMPLOYEE_ID = E.EMPLOYEE_ID
		AND JH.DEPARTMENT_ID <> E.DEPARTMENT_ID )>= 1;
```
> e.  For each employee, find the minimum and maximum salary of his/her department. Print employee last name, minimum salary, and maximum salary. Do not use sub-query in WHERE clause. Use sub-query in FROM clause.<br>
```sql
SELECT
	E1.LAST_NAME,
	D.MIN_SALARY,
	D.MAX_SALARY
FROM
	EMPLOYEES E1,
	(
	SELECT
		E2.DEPARTMENT_ID,
		MAX(E2.SALARY) MAX_SALARY,
		MIN(E2.SALARY) MIN_SALARY
	FROM
		EMPLOYEES E2
	GROUP BY
		E2.DEPARTMENT_ID) D
WHERE
	E1.DEPARTMENT_ID = D.DEPARTMENT_ID;
```
> f. For each job type, find the employee who gets the highest salary. Print job title and last name of the employee. Assume that there is one and only one such employee for every job type.<br>
```sql 
SELECT
	E1.LAST_NAME ,
	(
	SELECT
		J.JOB_TITLE
	FROM
		JOBS J
	WHERE
		J.JOB_ID = E1.JOB_ID)
FROM
	EMPLOYEES E1
WHERE
	E1.SALARY = (
	SELECT
		MAX(E2.SALARY)
	FROM
		EMPLOYEES E2
	WHERE
		E2.JOB_ID = E1.JOB_ID );
```

# <a name="chapter-7">Chapter 7</a>

# [Section 7.1](#section-7.1)

# <a name="section-7.1">Section 7.1</a>
> a. Find EMPLOYEE_ID of those employees who are not managers. Use minus operator to perform this.<br>
```sql
(
SELECT
	EMPLOYEE_ID
FROM
	EMPLOYEES)
MINUS
(
SELECT
	DISTINCT MANAGER_ID
FROM
	EMPLOYEES);
```
> b. Find last names of those employees who are not managers. Use minus operator to perform this.<br>
```sql
SELECT
	LAST_NAME
FROM
	EMPLOYEES
WHERE
	EMPLOYEE_ID IN ((
	SELECT
		EMPLOYEE_ID
	FROM
		EMPLOYEES)
MINUS
(
	SELECT
		DISTINCT MANAGER_ID
	FROM
		EMPLOYEES));
```
> c. Find the LOCATION_ID of those locations having no departments.<br>
```sql
(
SELECT
	LOCATION_ID
FROM
	LOCATIONS)
MINUS
(
SELECT
	LOCATION_ID
FROM
	DEPARTMENTS);
```

# <a name="chapter-8">Chapter 8</a>

# [Section 8.1](#section-8.1)
# [Section 8.2](#section-8.2)
# [Section 8.3](#section-8.3)

# <a name="section-8.1">Section 8.1</a>
### No exercises

# <a name="section-8.2">Section 8.2</a>
```sql
CREATE TABLE TEMP_EMPLOYEES
AS
SELECT
	*
FROM
	EMPLOYEES;

ALTER TABLE TEMP_EMPLOYEES 
MODIFY COMMISSION_PCT NUMBER(8,2);

DROP TABLE TEMP_EMPLOYEES;

CREATE TABLE TEMP_LOCATIONS
AS
SELECT
	*
FROM
	LOCATIONS;

DROP TABLE TEMP_LOCATIONS;
```
> a. Update COMMISSION_PCT value to 0 for those employees who have NULL in that column.<br>
```sql
UPDATE
	TEMP_EMPLOYEES
SET
	COMMISSION_PCT = 0
WHERE
	COMMISSION_PCT IS NULL;
```
> b. Update salary of all employees to the maximum salary of the department in which he/she works.<br>
```sql
UPDATE
	TEMP_EMPLOYEES TE
SET
	SALARY = (
	SELECT
		MAX(E.SALARY)
	FROM
		EMPLOYEES E
	WHERE
		E.DEPARTMENT_ID = TE.DEPARTMENT_ID);
```
> c. Update COMMISSION_PCT to 𝑁 times for each employee where 𝑁 is the number of employees he/she manages. When 𝑁 = 0, keep the old value of COMMISSION_PCT column.<br>
```sql
UPDATE
	TEMP_EMPLOYEES TE
SET
	COMMISSION_PCT = ROUND(NVL(COMMISSION_PCT *(
	SELECT
		COUNT(*)
	FROM
		EMPLOYEES E1
	JOIN EMPLOYEES E2 ON
		E2.MANAGER_ID = E1.EMPLOYEE_ID
	GROUP BY
		E1.EMPLOYEE_ID
	HAVING
		E1.EMPLOYEE_ID = TE.EMPLOYEE_ID), COMMISSION_PCT), 2)
WHERE
	TE.EMPLOYEE_ID IN (
	SELECT
		DISTINCT E1.MANAGER_ID
	FROM
		EMPLOYEES E1);
```
> d. Update the hiring dates of all employees to the first day of the same year. Do not change this for those employees who joined on or after year 2000.<br>
```sql
UPDATE
	TEMP_EMPLOYEES
SET
	HIRE_DATE = TRUNC(HIRE_DATE, 'YEAR')
WHERE
	HIRE_DATE <'01-JAN-2000';
```

# <a name="section-8.3">Section 8.3</a>
> a. Delete those employees who earn less than 5k.<br>
```sql
DELETE
FROM
	TEMP_EMPLOYEES
WHERE
	SALARY<5000;
```
> b. Delete those locations having no departments.<br>
```sql
DELETE
FROM
	TEMP_LOCATIONS
WHERE
	LOCATION_ID NOT IN (
	SELECT
		DISTINCT L.LOCATION_ID
	FROM
		LOCATIONS L
	JOIN DEPARTMENTS D ON
		L.LOCATION_ID = D.LOCATION_ID);
```
> c. Delete those employees from the EMPLOYEES table who joined before the year 1997.<br> 
```sql
DELETE
FROM
	TEMP_EMPLOYEES
WHERE
	HIRE_DATE<'01-JAN-1997';
```