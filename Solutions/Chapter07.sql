--7.1

--A
--Find EMPLOYEE_ID of those employees who are not managers. Use minus operator to perform this.
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
	
--B
--Find last names of those employees who are not managers. Use minus operator to perform this. 
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
		
--C
--Find the LOCATION_ID of those locations having no departments. 
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
	
