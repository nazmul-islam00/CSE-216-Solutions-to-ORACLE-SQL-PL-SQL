--11.3

--A
--Calculate the number of employees in different salary grades for each department using COUNT aggregation function instead of SUM. 
SELECT
	(CASE
		WHEN SALARY<5000 THEN 'C'
		WHEN SALARY<10000 THEN 'B'
		WHEN SALARY<15000 THEN 'A'
		ELSE 'A+'
	END) AS SALARY_GRADE
,
	COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM
	EMPLOYEES
GROUP BY
	(CASE
		WHEN SALARY<5000 THEN 'C'
		WHEN SALARY<10000 THEN 'B'
		WHEN SALARY<15000 THEN 'A'
		ELSE 'A+'
	END
)

--B
--Calculate the number of employees in different salary grades for each department using DECODE instead of CASE. 
SELECT
	DECODE(FLOOR(SALARY / 5000), 0, 'C', 1, 'B', 2, 'A', 'A+') AS SALARY_GRADE,
	COUNT(*) AS NUMBER_OF_EMPLOYEES
FROM
	EMPLOYEES
GROUP BY
	DECODE(FLOOR(SALARY / 5000), 0, 'C', 1, 'B', 2, 'A', 'A+');
	
--C
--Write the query to show total employees working in the employee’s department and in the employee’s manager’s department without using WITH clause. You can use subqueries in the FROM clause. 
SELECT
	E.EMPLOYEE_ID,
	D1.NUM AS NUMBER_OF_EMPLOYEES_IN_DEPT,
	D2.NUM AS NUMBER_OF_EMPLOYEES_IN_MANAGER_DEPT
FROM
	EMPLOYEES E,
	(
	SELECT
		DEPARTMENT_ID,
		COUNT(*) AS NUM
	FROM
		EMPLOYEES
	GROUP BY
		DEPARTMENT_ID) D1,
	(
	SELECT
		DEPARTMENT_ID,
		COUNT(*) AS NUM
	FROM
		EMPLOYEES
	GROUP BY
		DEPARTMENT_ID) D2
WHERE
	E.DEPARTMENT_ID = D1.DEPARTMENT_ID
	AND D2.DEPARTMENT_ID =(
	SELECT
		DEPARTMENT_ID
	FROM
		EMPLOYEES E1
	WHERE
		E1.EMPLOYEE_ID = E.MANAGER_ID);