--8.2

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



--A
--Update COMMISSION_PCT value to 0 for those employees who have NULL in that column. 
UPDATE
	TEMP_EMPLOYEES
SET
	COMMISSION_PCT = 0
WHERE
	COMMISSION_PCT IS NULL;
	
--B
--Update salary of all employees to the maximum salary of the department in which he/she works.
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
		
--C
--Update COMMISSION_PCT to 𝑁 times for each employee where 𝑁 is the number of employees he/she manages. When 𝑁 = 0, keep the old value of COMMISSION_PCT column.
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
	
--D
--Update the hiring dates of all employees to the first day of the same year. Do not change this for those employees who joined on or after year 2000. 
UPDATE
	TEMP_EMPLOYEES
SET
	HIRE_DATE = TRUNC(HIRE_DATE, 'YEAR')
WHERE
	HIRE_DATE <'01-JAN-2000';


--8.3

--A
--Delete those employees who earn less than 5k. 
DELETE
FROM
	TEMP_EMPLOYEES
WHERE
	SALARY<5000;

--B
--Delete those locations having no departments. 
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
	
--C
--Delete those employees from the EMPLOYEES table who joined before the year 1997. 
DELETE
FROM
	TEMP_EMPLOYEES
WHERE
	HIRE_DATE<'01-JAN-1997';





