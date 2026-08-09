USE CSE_3A_204

--Implement SQL In-Built Functions for Date and Time Handling

--1. Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() AS TODAY_DATE

--2. Write a query to find new date after 365 day with reference to today.
SELECT DATEADD(d,365 , GETDATE()) AS ADDEDATE

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT FORMAT(GETDATE(),'MMM D YYYY hh:mm:ss ') AS ADDEDDATE

--4. Display the current date in a format that appears as 03 Jan 1995.
SELECT FORMAT (GETDATE(),'03/JAN/1995') AS DATE

--5. Display the current date in a format that appears as Jan 04, 96.
SELECT FORMAT (GETDATE(),'JAN/04/96') AS DATE

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF (MONTH,'31-Dec-08' , '31-Mar-09') AS DATE

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF (HOUR,' 25-Jan-12 7:00' , '26-Jan-12 10:30') AS DATE

--8. Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DAY('12/MAY/2016') AS DAY
SELECT MONTH('12/MAY/2016') AS MONTH
SELECT YEAR('12/MAY/2016') AS YEAR


--9. Write a query that adds 5 years to current date.
SELECT DATEADD(YEAR,5 , GETDATE()) AS YEAR


--10. Write a query to subtract 2 months from current date.
SELECT DATEADD(MONTH,-2 , GETDATE()) AS DATE 

--11. Extract month from current date using datename () and datepart () function.
SELECT DATEPART(MONTH,GETDATE()) AS MONTH 

--12. Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE(),-1) as 'End Of Current Month'

--13. Calculate your age in years and months.
SELECT DATEDIFF(YEAR, '2007-11-24', '2026-07-13')

--14. Display all records where account date is in the year 2025.
SELECT * FROM DEPOSITE
WHERE YEAR(ADATE) = 2025

--15. Display all records where account date is in the month of March.
SELECT * FROM DEPOSITE
WHERE MONTH(ADATE) = 3

--16. Display records where account date is after ‘01-Jan-2025’.
SELECT * FROM DEPOSITE
WHERE MONTH(ADATE) > 1

--17. Display records where account date is before ‘01-Jan-2025’.
SELECT * FROM DEPOSITE
WHERE MONTH(ADATE) < 1


--18. Display records where day of account date is 1.
SELECT * FROM DEPOSITE
WHERE DAY(ADATE) = 1

--19. Display records where month of account date is greater than 6.
SELECT * FROM DEPOSITE
WHERE DAY(ADATE) > 6

--20. Display records where year of account date is 2026.
SELECT * FROM DEPOSITE
WHERE YEAR(ADATE) = 2026

--21. Display number of accounts opened in each year.
SELECT COUNT(ACTNO) AS ACTNO
FROM DEPOSITE
GROUP BY YEAR(ADATE)

--22. Display number of accounts opened in each month.
SELECT COUNT(ACTNO) AS ACTNO
FROM DEPOSITE
GROUP BY MONTH(ADATE)

--23. Display maximum amount deposited in each year.
SELECT MAX(AMOUNT) AS AMOUNT
FROM DEPOSITE
GROUP BY YEAR(ADATE)

--24. Display minimum amount deposited in each month.
SELECT MIN(AMOUNT) AS AMOUNT
FROM DEPOSITE
GROUP BY MONTH(ADATE)

--25. Display total amount deposited in each year.
SELECT MIN(AMOUNT) AS AMOUNT
FROM DEPOSITE
GROUP BY YEAR(ADATE)

--26. Display records where account date is between ‘01-Mar-2025’ and ‘31-Dec-2025’.
SELECT * FROM DEPOSITE
WHERE ADATE BETWEEN '2025-03-01' AND '2025-12-31'


