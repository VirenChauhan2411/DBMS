USE CSE_3A_204


--Perform SQL Queries Using Aggregate Functions with GROUP BY Clause (Without HAVING)


--1. Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively.
SELECT MAX(SALARY) AS SALARY,MIN(SALARY) AS SALARY
FROM EMPLOYEE

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively.
SELECT SUM(SALARY) AS TOTAL_SALARY, AVG(SALARY) AS AVERAGE_SALARY 
FROM EMPLOYEE
--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) AS TOTAL_EMPLOYEE
FROM EMPLOYEE

--4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS SALARY
FROM EMPLOYEE
	WHERE CITY = 'RAJKOT'

--5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT'

--6. Count employee department is HR.
SELECT COUNT(*) AS TOTAL_EMPLOYEE
FROM EMPLOYEE
WHERE DEPARTMENT = 'HR'

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'ADMIN'


--8. Display total salary of HR department.
SELECT SUM(SALARY) AS SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'HR'

--9. Count total number of cities of employee without duplication.
SELECT COUNT(distinct CITY) AS SALARY
FROM EMPLOYEE


--10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) AS DEPARTMENT
FROM EMPLOYEE

--11. Display minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS SALARY
FROM EMPLOYEE
WHERE CITY = 'AHEMDABAD'

--12. Find city wise highest salary.
SELECT CITY,MAX(SALARY) AS SALARY
FROM EMPLOYEE
GROUP BY CITY

--13. Find department wise lowest salary.
SELECT DEPARTMENT,MIN(SALARY) AS DEPARTMENT
FROM EMPLOYEE
GROUP BY DEPARTMENT

--14. Display minimum salary in each city.
SELECT DISTINCT CITY,MIN(SALARY) AS SALARY
FROM EMPLOYEE
GROUP BY  CITY

--15. Display average salary of employees from Surat.
SELECT CITY,AVG(SALARY) AS SALARY
FROM EMPLOYEE
WHERE CITY = 'SURAT'
GROUP BY CITY

--16. Display total salary of female employees.
SELECT SUM(SALARY) AS SALARY
FROM EMPLOYEE
WHERE GENDER = 'FEMALE'


--17. Count number of male employees.
SELECT COUNT(EID) AS GENDER
FROM EMPLOYEE
WHERE GENDER = 'MALE'

SELECT * FROM EMPLOYEE

--18. Display city with the total number of employees belonging to each city.
SELECT CITY,COUNT(EID) AS EMPLOYEE
FROM EMPLOYEE
GROUP BY CITY

--19. Count number of employees in each city where gender is MALE.
SELECT CITY,COUNT(EID) AS EMPLOYEE
FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY CITY

--20. Display maximum salary in each department where city is not Ahmedabad.
SELECT MAX(SALARY) AS EMPLOYEE
FROM EMPLOYEE
WHERE CITY <> 'AHRMDABAD'
GROUP BY DEPARTMENT

--21. Display minimum salary in each city where gender is FEMALE.
SELECT MIN(SALARY) AS SALARY
FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY CITY

--22. Give total salary of each department of EMPLOYEE table.
SELECT COUNT(SALARY) AS EMPLOYEE
FROM EMPLOYEE
GROUP BY CITY

--23. Average salary of each department without displaying department name
SELECT AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

--24. Count the number of employees for each department in every city
SELECT DEPARTMENT, CITY, COUNT(*) AS EMP_COUNT
FROM EMPLOYEE
GROUP BY DEPARTMENT, CITY;

--25. Calculate the total salary distributed to male and female employees
SELECT GENDER, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY GENDER;

--26. City wise maximum and minimum salary of female employees
SELECT CITY, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY CITY;

--27. Department, city, and gender wise average salary
SELECT DEPARTMENT, CITY, GENDER, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT, CITY, GENDER;

--28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE
SELECT (MAX(SALARY) - MIN(SALARY)) AS DIFFERENCE
FROM EMPLOYEE;

--29. Display sum of salaries department wise where department name consist 5 letters
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE
WHERE DEPARTMENT LIKE '_____' 
GROUP BY DEPARTMENT

--30. Find the Maximum salary department & city wise in which city name starts with ‘R’
SELECT DEPARTMENT,CITY, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEE
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY


--************** EXTRA ****************--
 
--I.	Display the total fine amount collected for each book genre.
SELECT SUM(FINEAMOUNT) AS AMOUNT
 FROM LIBRARYBORROWING

--II.	Find the average number of days borrowed for each book genre.
SELECT AVG(DaysBorrowed) AS DAY
FROM LIBRARYBORROWING
GROUP BY BOOKGENRE

--III.	Display the number of borrowing records for each member.
SELECT COUNT(BORROWID) AS AMOUNT
FROM LIBRARYBORROWING
GROUP BY MEMBERNAME

--IV.	Find the maximum fine amount paid in each book genre.
SELECT MAX(FINEAMOUNT) AS AMOUNT
FROM LIBRARYBORROWING
GROUP BY BOOKGENRE

--V.	Display the minimum days borrowed for each book genre.
SELECT min(DaysBorrowed) AS DAYSB
FROM LIBRARYBORROWING
GROUP BY BOOKGENRE

--VI.	Find the total number of days books were borrowed by each member.
SELECT COUNT(DaysBorrowed) AS DAYSB
FROM LIBRARYBORROWING
GROUP BY MEMBERNAME

--VII.	Display the average fine amount paid by each member.
SELECT AVG(FINEAMOUNT) AS AMT
FROM LIBRARYBORROWING
GROUP BY MEMBERNAME

--VIII.	Find the highest number of days borrowed by each member.
SELECT MAX(DaysBorrowed) AS DAYSB
FROM LIBRARYBORROWING
GROUP BY MEMBERNAME

--IX.	find the difference between the highest and lowest fine for each genre.
SELECT MAX(FINEAMOUNT) - MIN(FINEAMOUNT) AS DIFF_AMT
FROM LIBRARYBORROWING
GROUP BY BOOKGENRE

--X.	Find how many times has each member borrowed a book
SELECT COUNT(DaysBorrowed) AS BORR_NAME
FROM LIBRARYBORROWING

