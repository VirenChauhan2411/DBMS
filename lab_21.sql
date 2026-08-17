

--Lab 21 Implement Intermediate Common Table Expressions (CTE) for Query Simplification

--STDID (int, null)
--SNAME (varchar(50), null)
--CITY (varchar(50), null)
--SPI (decimal(4,2), null)
--BRANCH (varchar(50), null)

--Part – A:
--1. Display all students whose SPI is greater than 8.
WITH STD_SPI AS (
SELECT * FROM STUDENT
WHERE SPI >= 8
)
SELECT * FROM STD_SPI

--2. Display average SPI of all students.
WITH SPI_AVG AS (
SELECT AVG(SPI) AS SPI_AVG
FROM STUDENT
)
SELECT * FROM SPI_AVG

--3. Display total number of students in each branch.
WITH SPI_AVG AS (
SELECT  BRANCH,COUNT(*) AS SPI_AVG
FROM STUDENT
GROUP BY BRANCH
)
SELECT * FROM SPI_AVG

--4. Display students who belong to RAJKOT city.
WITH STD_SPI AS (
SELECT * FROM STUDENT
WHERE CITY = 'RAJKOT'
)
SELECT * FROM STD_SPI

--5. Find branch names that appear more than once.
WITH STD_SPI AS (
SELECT COUNT(BRANCH) AS STD_BRANCH FROM STUDENT
)
SELECT * FROM STD_SPI 
WHERE STD_BRANCH > 1

--6. Display row number for each student.
WITH ROW_STD AS (
    SELECT *,ROW_NUMBER() OVER(ORDER BY STDID) AS COUNT_ID
    FROM STUDENT
)
SELECT * FROM ROW_STD;

--7. Display top 3 students based on SPI.
WITH TOP_3 AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY SPI DESC) AS COUNT_ID
    FROM STUDENT
)
SELECT * FROM TOP_3
WHERE COUNT_ID <= 3;


--8. Display students having maximum SPI.
WITH MAX_SPI AS (
    SELECT MAX(SPI) AS MAX_SPI
    FROM STUDENT
)
SELECT * FROM STUDENT AS S,MAX_SPI AS M
WHERE S.SPI = M.MAX_SPI

--9. Display students having minimum SPI.
WITH MIN_SPI AS (
    SELECT MIN(SPI) AS MIN_SPI
    FROM STUDENT
)
SELECT * FROM STUDENT AS S,MIN_SPI AS M
WHERE S.SPI = M.MIN_SPI

--10. Display branch -wise rank of students.
WITH RANK_BR AS (
    SELECT STDID, SNAME, BRANCH, SPI,
           RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS BRANCH_RANK
    FROM STUDENT
)
SELECT * FROM RANK_BR

--Part – B:
--11. Display students SPI average belonging to Computer branch.
WITH AVG_SPI AS (
    SELECT BRANCH,AVG(SPI) AS AVG_SPI
    FROM STUDENT
    WHERE BRANCH = 'COMPUTER'
    GROUP BY BRANCH
    )
SELECT * FROM AVG_SPI

--12. Display students whose SPI is greater than average SPI of his/her branch.
WITH CTE AS (
    SELECT AVG(SPI) AS AVG_SPI
    FROM STUDENT
    GROUP BY BRANCH
    )
SELECT * 
FROM STUDENT S,CTE C
WHERE S.SPI>C.AVG_SPI

--13. Display branch having more than 2 students.
WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS COUNTT
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT BRANCH FROM CTE 
WHERE COUNTT > 2;

--14. Display branches having average SPI between 7 and 9
WITH CTE AS (
    SELECT BRANCH, AVG(SPI) AS AVG_SPI
    FROM STUDENT
    GROUP BY BRANCH
    )
SELECT BRANCH FROM STUDENT
WHERE SPI between 7 and 9

--15. Display students whose SPI is lower than overall average SPI.
WITH CTE AS (
    SELECT AVG(SPI) AS AVG_SPI 
    FROM STUDENT
)
SELECT * FROM STUDENT
WHERE SPI < (SELECT AVG_SPI FROM CTE);

--Part – C:
--16. Display branches having exactly one student.
WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS COUNTT
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT BRANCH FROM CTE 
WHERE COUNTT = 1;

--17. Display branch having highest average SPI.
WITH CTE AS (
    SELECT BRANCH, AVG(SPI) AS AVG_SPI
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT TOP 1 BRANCH
FROM CTE
ORDER BY AVG_SPI DESC;

--18. Display branch having lowest average SPI.
WITH CTE AS (
    SELECT BRANCH, AVG(SPI) AS AVG_SPI
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT TOP 1 BRANCH
FROM CTE
ORDER BY AVG_SPI ASC;

--19. Display students whose SPI is lower than branch average SPI.
WITH CTE AS (
SELECT AVG(SPI) AS AVGG
FROM STUDENT
GROUP BY BRANCH

)
SELECT * FROM STUDENT S,CTE C
WHERE S.SPI>C.AVGG

--20. Display branches having maximum number of students.
WITH CTE AS (
    SELECT BRANCH, COUNT(*) AS CNT
    FROM STUDENT
    GROUP BY BRANCH
)
SELECT BRANCH
FROM CTE
WHERE CNT = (SELECT MAX(CNT) FROM CTE);