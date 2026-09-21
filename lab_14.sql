SELECT * FROM  DEPARTMENT D
SELECT * FROM PERSON P
--1. Combine information from Person and Department table using cross join or Cartesian product. 
	SELECT *FROM 
	PERSON P,DEPARTMENT D;
--2. Find all persons with their department name 
	SELECT D.DEPARTMENTNAME,P.PERSONNAME
	FROM DEPARTMENT D
	JOIN PERSON P
	ON D. DEPARTMENTID=P.DEPARTMENTID
--3. Find all persons with their department name & code. 
SELECT P.PersonName, D.DepartmentName, D.DepartmentCode
FROM PERSON P
JOIN DEPARTMENT D
ON P.DepartmentID = D.DepartmentID;
--4. Find all persons with their department code and location. 
	SELECT P.PersonName, D.DepartmentName, D.DepartmentCode,D.LOCATION
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DepartmentID = D.DepartmentID;
--5. Find the detail of the person who belongs to Mechanical department. 
	SELECT P.PERSONNAME,D.DEPARTMENTNAME
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID=D.DEPARTMENTID
	WHERE D.DEPARTMENTNAME='MECHANICAL'
--6. Final person’s name, department code and salary who lives in Ahmedabad city.  
SELECT P.PERSONNAME,D.DEPARTMENTCODE, P.SALARY,P.CITY
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE P.CITY='AHMEDABAD' 
--7. Find the person's name whose department is in C-Block
 SELECT P.PERSONNAME,D.DEPARTMENTNAME, P.SALARY,P.CITY
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE D.LOCATION='C-BLOCK'
--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT P.PERSONNAME,D.DEPARTMENTNAME, P.SALARY,P.CITY
FROM PERSON P JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE P.CITY='Jamnagar'
--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
SELECT P.PERSONNAME,D.DEPARTMENTNAME, P.SALARY,P.CITY
FROM PERSON P 
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE D.DEPARTMENTNAME='CIVIL' AND P.JOININGDATE>'2001-08-01'
--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 25 years. 
SELECT P.PERSONNAME,D.DEPARTMENTNAME, P.SALARY,P.CITY
FROM PERSON P 
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE DATEDIFF(YEAR,P.JOININGDATE,GETDATE())>25
--11. Find department wise person counts. 
SELECT D.DEPARTMENTNAME, COUNT(*) AS DEPARTEMNT_COUNT
FROM PERSON P 
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME

--12. Give department wise maximum & minimum salary with department name. 
SELECT D.DEPARTMENTNAME, MAX(P.SALARY) AS MAXSALARY,
MIN(P.SALARY) AS MINSALARY
FROM PERSON P 
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME
--13. Find city wise total, average, maximum and minimum salary. 
SELECT p.city, MAX(P.SALARY) AS MAXSALARY,
MIN(P.SALARY) AS MINSALARY,
SUM(P.SALARY),
AVG(P.SALARY)
FROM PERSON P 
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
GROUP BY P.CITY
--14. Find the average salary of a person who belongs to Ahmedabad city. 
SELECT 
AVG(P.SALARY) AS AVGSLARY
FROM PERSON P 
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
WHERE  P.CITY='Ahmedabad'
--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 

SELECT P.PERSONNAME + 'lives in' + P.CITY + 'and works in' + D.DEPARTMENTNAME + 'Department.'
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID=D.DEPARTMENTID
--Part – B: 
--16. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
SELECT P.PERSONNAME + ' earns ' + CAST(P.SALARY AS VARCHAR(20)) +
       ' from ' + D.DEPARTMENTNAME + ' department monthly.'
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID;
--17. Find city & department wise total, average & maximum salaries. 
SELECT P.CITY,
       D.DEPARTMENTNAME,
       SUM(P.SALARY) AS TOTALSALARY,
       AVG(P.SALARY) AS AVGSALARY,
       MAX(P.SALARY) AS MAXSALARY
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY P.CITY, D.DEPARTMENTNAME;
--18. Find all persons who do not belong to any department. 

SELECT P.PERSONNAME
FROM PERSON P
LEFT JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTID IS NULL;

--19. Find all departments whose total salary is exceeding 100000. 
	SELECT D.DEPARTMENTNAME,
       SUM(P.SALARY) AS TOTALSALARY
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME
HAVING SUM(P.SALARY) > 100000;
--Part – C: 
--20. List all departments who have no person. 

SELECT D.DEPARTMENTNAME
FROM DEPARTMENT D
LEFT JOIN PERSON P
ON D.DEPARTMENTID = P.PERSONID
WHERE P.PERSONID IS NULL;
--21. List out department names in which more than two persons are working. 
SELECT D.DEPARTMENTNAME,
       COUNT(P.PERSONID) AS PERSONCOUNT
FROM DEPARTMENT D
JOIN PERSON P
ON D.DEPARTMENTID = P.DEPARTMENTID
GROUP BY D.DEPARTMENTNAME
HAVING COUNT(P.PERSONID) > 2;
--22. Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE P
SET P.SALARY = P.SALARY * 1.10
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTNAME = 'COMPUTER';


--Check updated salary

SELECT P.PERSONNAME,
       P.SALARY,
       D.DEPARTMENTNAME
FROM PERSON P
JOIN DEPARTMENT D
ON P.DEPARTMENTID = D.DEPARTMENTID
WHERE D.DEPARTMENTNAME = 'COMPUTER';