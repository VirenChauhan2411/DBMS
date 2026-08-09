--Part – A: 

SELECT * FROM BOOK
SELECT * FROM AUTHOR
SELECT * FROM PUBLISHER



--1. List all books with their authors. 
SELECT * FROM BOOK B
INNER JOIN AUTHOR A
ON B.AUTHORID = A.AUTHORID

--2. List all books with their publishers. 
SELECT b.TITLE,p.PUBLISHERNAME
FROM BOOK b INNER JOIN  PUBLISHER p on
b.PUBLISHERID=p.PUBLISHERID

--3. List all books with their authors and publishers. 
SELECT b.TITLE,p.PUBLISHERID,a.AUTHORNAME
FROM BOOK b 
INNER JOIN AUTHOR a
ON b.AUTHORID = a.AUTHORID
INNER JOIN PUBLISHER p
ON b.PUBLISHERID = p.PUBLISHERID

--4. List all books published after 2010 with their authors and publisher and price
SELECT *FROM BOOK b 
INNER JOIN AUTHOR a
ON b.AUTHORID = a.AUTHORID
INNER JOIN PUBLISHER p
ON b.PUBLISHERID = p.PUBLISHERID
WHERE b.PUBLICATIONYEAR > 2010

--5. List all authors and the number of books they have written. 
SELECT
    a.AUTHORNAME,
    COUNT(b.BOOKID) AS TOTALBOOKS
FROM AUTHOR a
LEFT JOIN BOOK b
ON a.AUTHORID = b.AUTHORID
GROUP BY a.AUTHORNAME
--6. List all publishers and the total price of books they have published. 
SELECT
    p.PUBLISHERNAME,
    sum(b.BOOKID) AS TOTALBOOKS
FROM  PUBLISHER p
LEFT JOIN BOOK b
ON p.PUBLISHERID= b.PUBLISHERID
GROUP BY p.PUBLISHERNAME;
--7. List authors who have not written any books.
SELECT
    a.AUTHORNAME
FROM AUTHOR a
LEFT JOIN BOOK b
ON a.AUTHORID = b.AUTHORID
WHERE b.BOOKID IS NULL

--8. Display the total number of books written by each author along with the average price of their books.
SELECT A.AUTHORNAME, COUNT(B.BOOKID) AS TOTAL_BOOKS, AVG(B.PRICE) AS AVG_PRICE
FROM AUTHOR A
LEFT JOIN BOOK B ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest.
SELECT P.PUBLISHERNAME, COUNT(B.BOOKID) AS TOTAL_BOOKS
FROM PUBLISHER P
LEFT JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME
ORDER BY TOTAL_BOOKS DESC

--10. Display number of books published each year. 
SELECT PUBLICATIONYEAR, COUNT(*) AS TOTAL_BOOKS
FROM BOOK
GROUP BY PUBLICATIONYEAR
ORDER BY PUBLICATIONYEAR

--PART-B
--11. List the publishers whose total book prices exceed 500, ordered by the total price. 
SELECT p.PUBLISHERNAME, SUM(b.PRICE) AS TOTALBOOKS
FROM  PUBLISHER p
LEFT JOIN BOOK b
ON p.PUBLISHERID= b.PUBLISHERID
WHERE B.PRICE = 500
GROUP BY P.PUBLISHERNAME
ORDER BY SUM(B.PRICE);

--12. List most expensive book for each author, sort it with the highest price. 
SELECT p.PUBLISHERNAME, MAX(B.PRICE) AS TOTALBOOKS
FROM  PUBLISHER p
LEFT JOIN BOOK b
ON p.PUBLISHERID= b.PUBLISHERID
GROUP BY P.PUBLISHERNAME
ORDER BY TOTALBOOKS DESC; 

--13. Display publisher name and difference between maximum and minimum book price. 
SELECT p.PUBLISHERNAME, MAX(B.PRICE)-MIN(B.PRICE) AS TOTALBOOKS
FROM  PUBLISHER p
LEFT JOIN BOOK b
ON p.PUBLISHERID= b.PUBLISHERID
GROUP BY P.PUBLISHERNAME
ORDER BY TOTALBOOKS DESC; 

--14. List publisher name and total price of books published each year.
SELECT p.PUBLISHERNAME, SUM(B.PRICE) AS TOTALBOOKS
FROM  PUBLISHER p
LEFT JOIN BOOK b
ON p.PUBLISHERID= b.PUBLISHERID
GROUP BY P.PUBLISHERNAME,B.PUBLICATIONYEAR
ORDER BY TOTALBOOKS DESC; 

-- 15. Display author name and total price of books sorted by highest total price.

SELECT A.AUTHORNAME,SUM(B.PRICE) AS TOTALPRICE
FROM AUTHOR A
 JOIN BOOK B
ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME
ORDER BY SUM(B.PRICE) DESC;

--EMPLOYEE_MASTER

CREATE TABLE EMPLOYEE_MASTER
	(
		EmployeeNo VARCHAR(50),
		Name VARCHAR(50),
		ManagerNo VARCHAR(50)
	);

INSERT INTO EMPLOYEE_MASTER VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan',' E02'),
('E03' ,'Priya', 'E01'),
('E04', 'Milan' ,'E03'),
('E05' ,'Jay', 'E01'),
('E06' ,'Anjana', 'E04')


--Part – C:
--16. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT E.NAME AS EMPLOYEE,
       M.NAME AS MANAGER
FROM EMPLOYEE_MASTER E
LEFT JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO = M.EMPLOYEENO;
--17. Display employees who are managers.
SELECT DISTINCT M.NAME AS MANAGER
FROM EMPLOYEE_MASTER E
JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO = M.EMPLOYEENO;
--18. Display number of employees working under each manager.
SELECT M.NAME AS MANAGER,
       COUNT(E.EMPLOYEENO) AS EMPLOYEECOUNT
FROM EMPLOYEE_MASTER M
JOIN EMPLOYEE_MASTER E
ON M.EMPLOYEENO = E.MANAGERNO
GROUP BY M.NAME;
--19. Display the employee’s name along with their manager’s name and senior manager name.
SELECT E.NAME AS EMPLOYEE,
       M.NAME AS MANAGER,
       SM.NAME AS SENIOR_MANAGER
FROM EMPLOYEE_MASTER E
LEFT JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO = M.EMPLOYEENO
LEFT JOIN EMPLOYEE_MASTER SM
ON M.MANAGERNO = SM.EMPLOYEENO;
--20. Display managers and count of employees under them in descending order. 
SELECT M.NAME AS MANAGER,
       COUNT(E.EMPLOYEENO) AS EMPLOYEECOUNT
FROM EMPLOYEE_MASTER M
JOIN EMPLOYEE_MASTER E
ON M.EMPLOYEENO = E.MANAGERNO
GROUP BY M.NAME
ORDER BY COUNT(E.EMPLOYEENO) DESC;
