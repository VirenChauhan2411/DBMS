USE CSE_3A_204

-- Implement SQL Joins to Combine Multiple Tables

--1. Combine information from Student and Result table using cross join (Cartesian product). 
	select *from
	 STUDENT_INFO S , Result R

--2. Perform inner join on Student and Result tables. 
	SELECT * FROM 
	 STUDENT_INFO S
	 INNER JOIN  Result R
	 ON  S.RNO=R.RNO

--3. Perform the left outer join on Student and Result tables. 
	select * from 
	STUDENT_INFO S
	 LEFT OUTER JOIN RESULT R
	 ON   R.RNO=S.RNO

--4. Perform the right outer join on Student and Result tables. 
	select * from 
	RESULT AS R
	 LEFT OUTER JOIN STUDENT_INFO AS S
	 ON   R.RNO=S.RNO

	 SELECT*FROM RESULT
	 SELECT *FROM student_info

--5. Perform the full outer join on Student and Result tables. 
SELECT * FROM STUDENT_INFO S 
LEFT OUTER JOIN RESULT R
ON   R.RNO=S.RNO

--6. Display Rno, NAMEE, Branch and SPI of all students. 
		SELECT S.RNO,S.NAMEE, S.BRANCH, R.SPI
		FROM STUDENT_INFO S JOIN   RESULT R
		ON  S.RNO= R.RNO

--7. Display Rno, NAMEE, Branch and SPI of CE branch students only. 
		SELECT S.RNO,S.NAMEE, S.BRANCH , R.SPI
 		FROM STUDENT_INFO S JOIN RESULT R
		ON  S.RNO=R.RNO

--8. Display Rno, NAMEE, Branch and SPI of students other than EC branch. 
	SELECT S.RNO,S.NAMEE, S.BRANCH , R.SPI 
	 FROM STUDENT_INFO S JOIN RESULT R
	 ON  S.RNO=R.RNO
	  WHERE S.BRANCH='EC'

--9. Display Rno, NAMEE and SPI of students whose SPI is greater than 8. 
SELECT S.RNO,S.NAMEE, S.BRANCH , R.SPI 
	 FROM STUDENT_INFO S JOIN RESULT R
	 ON  S.RNO=R.RNO
	  WHERE R.SPI>8

--10. Display Rno, NAMEE and Branch of students whose SPI is less than 8. 

SELECT S.RNO,S.NAMEE, S.BRANCH , R.SPI 
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
WHERE R.SPI<8

--11. Display average result of each branch. 
	SELECT AVG(SPI) AS RESULT
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH

--12. Display average result of CE and ME branch. 
SELECT AVG(SPI) AS RESULT
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
WHERE S.BRANCH  IN ('CE','ME')

--13. Display maximum and minimum SPI of each branch.
SELECT MAX(SPI) AS MAXSPI,
MIN(SPI) AS MINSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH

--14. Display branch-wise student count in descendi
SELECT COUNT(*) COUNT_S
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
ORDER BY S.BRANCH DESC


--16. Display branch-wise number of students having SPI greater than 8.
SELECT COUNT(*) COUNT_S
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
WHERE SPI>8
GROUP BY S.BRANCH

--17. Display branch-wise number of students having SPI less than 8. 
SELECT COUNT(*) COUNT_S
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
WHERE SPI<8
GROUP BY S.BRANCH

--18. Display branch-wise average SPI greater than 7. 
SELECT AVG(SPI) AVGSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
HAVING AVG(SPI)>7

--19. Display branches having more than 1 students.
SELECT  COUNT(*) AS STU_COUNT,S.BRANCH
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
HAVING COUNT(*) >1

--20. Display branches where maximum SPI is greater than 9.
SELECT MAX(SPI) AVGSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
HAVING MAX(SPI)>9

--21. Display average result of each branch and sort them in ascending order by SPI. 
SELECT AVG(SPI) AS AVGSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
ORDER BY AVG(SPI) ASC
--22. Display highest SPI from each branch and sort them in descending order. 
SELECT max(SPI) AS AVGSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
ORDER BY max(SPI) DESC
--23. Display average result of each branch and sort them in ascending order by SPI. 
SELECT AVG(SPI) AS AVGSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
ORDER BY AVG(R.SPI)
--24. Display highest SPI from each branch and sort them in descending order. 
SELECT max(SPI) AS AVGSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH
ORDER BY max(SPI) DESC
--25. Display branches where difference between max and min SPI is greater than 1.
SELECT MAX(SPI) AS MAXSPI,
	MIN(SPI) AS MINSPI
FROM STUDENT_INFO S JOIN RESULT R
ON  S.RNO=R.RNO
GROUP BY S.BRANCH 
HAVING  MAX(SPI)-MIN(SPI) >1

