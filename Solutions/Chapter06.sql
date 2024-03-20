--6.1

--A
--Find the last names of all employees that work in the SALES department.
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
		
--B
--Find the last names and salaries of those employees who get higher salary than at least one employee of SALES department. 
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
			
--C
--Find the last names and salaries of those employees whose salary is higher than all employees of SALES department. 
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

--D
--Find the last names and salaries of those employees whose salary is within ± 5k of the average salary of SALES department. 
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
			
		
--6.2
		
--A
--Find those employees whose salary is higher than at least three other employees. Print last names and salary of each employee. You cannot use join in the main query. Use sub-query in WHERE clause only. You can use join in the sub-queries. 
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
		
--B
--Find those departments whose average salary is greater than the minimum salary of all other departments. Print department names. Use sub-query. You can use join in the sub-queries. 
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
	
--C
--Find those department names which have the highest number of employees in service. Print department names. Use sub-query. You can use join in the sub-queries.
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
			
--D
--Find those employees who worked in more than one department in the company. Print employee last names. You cannot use join in the main query. Use sub-query. You can use join in the sub-queries. 
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
	
--E
--For each employee, find the minimum and maximum salary of his/her department. Print employee last name, minimum salary, and maximum salary. Do not use sub-query in WHERE clause. Use sub-query in FROM clause. 
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

--F
--For each job type, find the employee who gets the highest salary. Print job title and last name of the employee. Assume that there is one and only one such employee for every job type. 
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
