
--Implement Window Functions for Advanced Data Analysis

--STDID (int, null)
--SNAME (varchar(50), null)
--CITY (varchar(50), null)
--SPI (decimal(4,2), null)
--BRANCH (varchar(50), null)

--1. Display rank of students based on SPI.
SELECT SNAME , SPI,
RANK() OVER (ORDER BY SPI DESC) AS RANKING
FROM STUDENT

--2. Display dense rank of students based on SPI.
SELECT SNAME , SPI,
DENSE_RANK() OVER (ORDER BY SPI DESC) AS RANKING
FROM STUDENT

--3. Display sequential number for each student record.
SELECT SNAME , SPI,
ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RANKING
FROM STUDENT

--4. Display branch-wise rank of students.
SELECT SNAME , SPI, BRANCH,
RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS RANKING
FROM STUDENT

--5. Display branch-wise dense ranking of students.
SELECT SNAME , SPI, BRANCH,
DENSE_RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS RANKING
FROM STUDENT

--6. Display branch-wise sequential numbering of students.
SELECT SNAME , SPI, BRANCH,
ROW_NUMBER() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS RANKING
FROM STUDENT

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of SPI.
SELECT SNAME , SPI,
LAG(SPI) OVER (ORDER BY SPI DESC) AS PREV_SPI,
(SPI-LAG(SPI) OVER (ORDER BY SPI ASC)) AS DEFF_SPI
FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.
SELECT SNAME , SPI,
LAG(SPI) OVER (ORDER BY SPI DESC) AS PREV_SPI,
(SPI-LAG(SPI) OVER (ORDER BY SPI DESC)) AS DEFF_SPI
FROM STUDENT

--9. Display top 3 students based on SPI.

SELECT SNAME,SPI
FROM
(SELECT SNAME , SPI,
DENSE_RANK() OVER (ORDER BY SPI DESC) AS TOP_3
FROM STUDENT) AS DATA
WHERE TOP_3 <=3	

--10. Display top 2 students from each branch.
SELECT SNAME,SPI,BRANCH
FROM
(SELECT SNAME , SPI,BRANCH,
DENSE_RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS TOP_2
FROM STUDENT) AS DATA
WHERE TOP_2 <=2

--11. Display 5th highest SPI.
SELECT SNAME,SPI
FROM
(SELECT SNAME , SPI,
DENSE_RANK() OVER (ORDER BY SPI DESC) AS HIGHEST_SPI
FROM STUDENT) AS DATA
WHERE HIGHEST_SPI=5	

--12. Display 6th highest SPI.
SELECT SNAME,SPI
FROM
(SELECT SNAME , SPI,
DENSE_RANK() OVER (ORDER BY SPI DESC) AS HIGHEST_SPI
FROM STUDENT) AS DATA
WHERE HIGHEST_SPI=6

--13. Display students having same ranking.
SELECT STDID, SNAME, SPI, RANKING
FROM (
    SELECT STDID, SNAME, SPI,
           RANK() OVER (ORDER BY SPI DESC) AS RANKING
    FROM STUDENT
) T
WHERE RANKING IN (
    SELECT RANKING
    FROM (
        SELECT SPI, RANK() OVER (ORDER BY SPI DESC) AS RANKING
        FROM STUDENT
    ) X
    GROUP BY RANKING
    HAVING COUNT(*) > 1
);




--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI.
SELECT SNAME,
       LAG(SPI) OVER (ORDER BY SPI ASC) AS PREV_SPI,
       SPI AS CURRENT_SPI,
       LEAD(SPI) OVER (ORDER BY SPI ASC) AS NEXT_SPI
FROM STUDENT;
                    
--15. Display topper of each branch.
SELECT *
FROM (
    SELECT STDID, SNAME, BRANCH, SPI,
           RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS BRANCH_RANK
    FROM STUDENT
) T
WHERE BRANCH_RANK = 1;

--16. Display students whose SPI is greater than the previous student and less than the next student.
SELECT SNAME, SPI
FROM (
    SELECT SNAME, SPI,
           LAG(SPI) OVER (ORDER BY SPI ASC) AS PREV_SPI,
           LEAD(SPI) OVER (ORDER BY SPI ASC) AS NEXT_SPI
    FROM STUDENT
) T
WHERE SPI > PREV_SPI AND SPI < NEXT_SPI;


--17. Display branch-wise second topper students.
SELECT *
FROM (
    SELECT STDID, SNAME, BRANCH, SPI,
           RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS BRANCH_RANK
    FROM STUDENT
) T
WHERE BRANCH_RANK = 2;

--18. Display students whose rank and dense rank are different.
SELECT STDID, SNAME, SPI,
       RANK() OVER (ORDER BY SPI DESC) AS RANKING,
       DENSE_RANK() OVER (ORDER BY SPI DESC) AS DENSE_RANKING
FROM STUDENT
WHERE RANK() OVER (ORDER BY SPI DESC) <> DENSE_RANK() OVER (ORDER BY SPI DESC);

--19. Display consecutive students having same branch ordered by SPI.
SELECT STDID, SNAME, BRANCH, SPI
FROM (
    SELECT STDID, SNAME, BRANCH, SPI,
           LAG(BRANCH) OVER (ORDER BY SPI ASC) AS PREV_BRANCH
    FROM STUDENT
) T
WHERE BRANCH = PREV_BRANCH;

--20. Display students whose SPI difference with previous student is maximum.
SELECT SNAME, SPI, DIFF_WITH_PREV
FROM (
    SELECT SNAME, SPI,
           SPI - LAG(SPI) OVER (ORDER BY SPI ASC) AS DIFF_WITH_PREV
    FROM STUDENT
) T
WHERE DIFF_WITH_PREV = (
    SELECT MAX(SPI - LAG(SPI) OVER (ORDER BY SPI ASC))
    FROM STUDENT
);
