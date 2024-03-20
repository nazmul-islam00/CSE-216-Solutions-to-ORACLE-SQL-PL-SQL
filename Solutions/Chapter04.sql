--4.1

--A
--For all managers, find the number of employees he/she manages. Print the MANAGER_ID and total number of such employees.
SELECT
	MANAGER_ID ,
	COUNT(*) AS EMPLOYEES_MANAGED
FROM
	EMPLOYEES
GROUP BY
	MANAGER_ID;

--B
--For all departments, find the number of employees who get more than 30k salary. Print the DEPARTMENT_ID and total number of such employees. 
SELECT
	DEPARTMENT_ID ,
	COUNT(*) AS NUMBER_OF_EMPLOYEES_WITH_MORE_THAN_30K
FROM
	EMPLOYEES
WHERE
	SALARY >30000
GROUP BY
	DEPARTMENT_ID;

--C
--Find the minimum, maximum, and average salary of all departments except DEPARTMENT_ID 80. Print DEPARTMENT_ID, minimum, maximum, and average salary. Sort the results in descending order of average salary first, then maximum salary, then minimum salary. Use column alias to rename column names in output for better display. 
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


--4.2

--A
--Find for each department, the average salary of the department. Print only those DEPARTMENT_ID and average salary whose average salary is at most 50k. 
SELECT
	DEPARTMENT_ID,
	AVG(SALARY) AS AVG_SALARY
FROM
	EMPLOYEES
GROUP BY
	DEPARTMENT_ID
HAVING
	AVG(SALARY)<= 50000;


--4.3

--A
--Find number of employees in each salary group. Salary groups are considered as follows. Group 1: 0k to <5K, 5k to <10k, 10k to <15k, and so on. 
SELECT 
	TRUNC((SALARY / 5000))+ 1 AS SALARY_GROUP,
	COUNT(*) EMPLOYEE_COUNT
FROM
	EMPLOYEES
GROUP BY
	TRUNC((SALARY / 5000));

--B
--Find the number of employees that were hired in each year in each job type. Print year, job id, and total employees hired.
SELECT
	TO_CHAR(HIRE_DATE, 'YYYY') AS YEAR,
	JOB_ID,
	COUNT(*) AS NUMBER_OF_EMPLOYEES_HIRED
FROM
	EMPLOYEES
GROUP BY
	TO_CHAR(HIRE_DATE, 'YYYY'),
	JOB_ID;

