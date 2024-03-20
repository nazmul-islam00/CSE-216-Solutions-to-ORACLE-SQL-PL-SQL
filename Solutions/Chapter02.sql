--2.1

--A
--Write an SQL query to retrieve all country names. 
SELECT 
	COUNTRY_NAME
FROM
	COUNTRIES;

--B
--Write an SQL query to retrieve all job titles.
SELECT 
	JOB_TITLE
FROM
	JOBS;

--C
--Write an SQL query to retrieve all MANAGER_IDs. 
SELECT 
	DISTINCT MANAGER_ID
FROM
	EMPLOYEES;

--D
--Write an SQL query to retrieve all city names. Remove duplicate outputs.
SELECT 
	DISTINCT CITY
FROM
	LOCATIONS;

--E
--Write an SQL query to retrieve LOCATION_ID, ADDRESS from LOCATIONS table. The ADDRESS should print each location in the following format: STREET_ADDRESS, CITY, STATE_PROVINCE, POSTAL_CODE.
SELECT 
	LOCATION_ID,
	STREET_ADDRESS || ',' || CITY || ',' || STATE_PROVINCE || ',' || POSTAL_CODE AS ADDRESS
FROM
	LOCATIONS;


--2.2

--A
--Select names of all employees who have joined before January 01, 1998. 
SELECT 
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM 
	EMPLOYEES
WHERE 
	HIRE_DATE <'01-JAN-2098';

--B
--Select all locations in the following countries: Canada, Germany, United Kingdom.
SELECT 
	*
FROM
	LOCATIONS
WHERE 
	COUNTRY_ID IN ('CA', 'DE', 'UK');

--C
--Select first names of all employees who do not get any commission. 
SELECT 
	FIRST_NAME
FROM 
	EMPLOYEES
WHERE 
	COMMISSION_PCT IS NULL;

--D
--Select first names of employees whose last name starts with an 'a'. 
SELECT 
	FIRST_NAME
FROM
	EMPLOYEES
WHERE 
	LAST_NAME LIKE 'A%';

--E
--Select first names of employees whose last name starts with an 's' and ends with an 'n'. 
SELECT
	FIRST_NAME
FROM
	EMPLOYEES
WHERE 
	LAST_NAME LIKE 'S%n';

--F
--Select all department names whose MANAGER_ID is 100. 
SELECT 
	DEPARTMENT_NAME
FROM 
	DEPARTMENTS
WHERE
	MANAGER_ID = 100;

--G
--Select all names of employees whose job type is 'AD_PRES' and whose salary is at least 23000. 
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM
	EMPLOYEES
WHERE
	JOB_ID = 'AD_PRES'
	AND SALARY >= 23000;

--H
--Select names of all employees whose last name do not contain the character 's'. 
SELECT
	FIRST_NAME || ' ' || LAST_NAME
FROM
	EMPLOYEES
WHERE
	LOWER(LAST_NAME) NOT LIKE '%s%';

--I
--Select names and COMMISSION_PCT of all employees whose commission is at most 0.30. 
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME,
	COMMISSION_PCT
FROM
	EMPLOYEES
WHERE
	COMMISSION_PCT IS NULL
	OR COMMISSION_PCT <= 0.30;

--J
--Select names of all employees who have joined after January 01, 1998.
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM
	EMPLOYEES
WHERE
	HIRE_DATE >'01-JAN-1998';

--K
--Select names of all employees who have joined in the year 1998. 
SELECT
	FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM
	EMPLOYEES
WHERE
	HIRE_DATE BETWEEN '01-JAN-1998' AND '31-DEC-1998';
	

--2.3

--A
--Select names, salary, and commissions of all employees of job type 'AD_PRES'. Sort the result in ascending order of commission and then descending order of salary. 
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
	
--B
--Retrieve all country names in lexicographical ascending order.
SELECT
	COUNTRY_NAME
FROM
	COUNTRIES
ORDER BY
	COUNTRY_NAME ASC;