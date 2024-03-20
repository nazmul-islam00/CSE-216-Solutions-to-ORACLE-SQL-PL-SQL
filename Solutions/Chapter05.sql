--5.1

--A
--For each employee print last name, salary, and job title. 
SELECT
	E.LAST_NAME,
	E.SALARY,
	J.JOB_TITLE
FROM
	EMPLOYEES E
JOIN JOBS J
ON
	E.JOB_ID = J.JOB_ID ;
	
--B
--For each department, print department name and country name it is situated in. 
SELECT
	D.DEPARTMENT_NAME ,
	C.COUNTRY_NAME
FROM
	DEPARTMENTS D
JOIN LOCATIONS L ON
	D.LOCATION_ID = L.LOCATION_ID
JOIN COUNTRIES C ON
	L.COUNTRY_ID = C.COUNTRY_ID;
	
--C
--For each country, finds total number of departments situated in the country.
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
	
--D
--For each employee, finds the number of job switches of the employee.
SELECT
	E.EMPLOYEE_ID,
	COUNT(JH.EMPLOYEE_ID) AS JOB_SWITCHES
FROM
	EMPLOYEES E
LEFT JOIN JOB_HISTORY JH ON
	E.EMPLOYEE_ID = JH.EMPLOYEE_ID
GROUP BY
	E.EMPLOYEE_ID;

--E
--For each department and job types, find the total number of employees working. Print department names, job titles, and total employees working. 
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

--F
--For each employee, finds the total number of employees those were hired before him/her. Print employee last name and total employees. 
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

--G
--For each employee, finds the total number of employees those were hired before him/her and those were hired after him/her. Print employee last name, total employees hired before him, and total employees hired after him.
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

--H
--Find the employees having salaries greater than at least three other employees
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

--I
--For each employee, find his rank, i.e., position with respect to salary. The highest salaried employee should get rank 1 and lowest salaried employee should get the last rank. Employees with same salary should get same rank value. Print employee last names and his/he rank.
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
	
--J
--Finds the names of employees and their salaries for the top three highest salaried employees. The number of employees in your output should be more than three if there are employees with same salary. 
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