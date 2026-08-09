
--1. Display the details of students whose SPI is greater than the average SPI.
SELECT * FROM STUDENT
WHERE SPI > (SELECT AVG(SPI) FROM STUDENT);

--2. Display the names of students whose SPI is less than the average SPI.
SELECT SNAME,SPI FROM STUDENT
WHERE SPI < (SELECT AVG(SPI) FROM STUDENT);

--3. Display the student details who has the highest SPI.
SELECT * FROM STUDENT
WHERE SPI = (SELECT MAX(SPI) FROM STUDENT);

--4. Display the student details who has the lowest SPI.
SELECT * FROM STUDENT
WHERE SPI = (SELECT MIN(SPI) FROM STUDENT);

--5. Display the students whose SPI is greater than SPI of student DHARMIK.
SELECT * FROM STUDENT
WHERE SPI > (SELECT SPI FROM STUDENT
			WHERE SNAME = 'DHARMIK');

--6. Display the students whose SPI is less than SPI of student RIYA.
SELECT * FROM STUDENT
WHERE SPI < (SELECT SPI FROM STUDENT
			WHERE SNAME = 'RIYA');

--7. Display the students who belong to the same branch as KRUNAL.
SELECT * FROM STUDENT
WHERE BRANCH = (SELECT BRANCH FROM STUDENT
			WHERE SNAME = 'KRUNAL');

--8. Display the students whose branch is different from HETVI.
SELECT * FROM STUDENT
WHERE BRANCH != (SELECT BRANCH FROM STUDENT
			WHERE SNAME = 'HETVI');

			SELECT * FROM RESULT
--9. Display the second highest SPI from RESULT table.
SELECT MAX(SPI) FROM RESULT
WHERE SPI < (SELECT MAX(SPI) FROM RESULT);

--10. Display the second lowest SPI from RESULT table.
SELECT MIN(SPI) FROM RESULT
WHERE SPI > (SELECT MIN(SPI) FROM RESULT);

--11. Display the names of students whose SPI is above branch-wise average SPI.
SELECT SNAME FROM STUDENT S
WHERE SPI >(SELECT AVG(SPI) FROM STUDENT S1
WHERE S.BRANCH=S1.BRANCH
)


--12. Display the branch having maximum average SPI.
SELECT BRANCH,AVG(SPI) AS SPI FROM STUDENT 
GROUP BY BRANCH
HAVING AVG(SPI) = (SELECT MAX(SPI) FROM STUDENT);


--13. Display the branch having minimum average SPI.
SELECT SNAME,BRANCH,AVG(SPI) AS SPI FROM STUDENT 
GROUP BY BRANCH,SNAME
HAVING AVG(SPI) = (SELECT MIN(SPI) FROM STUDENT);

--14. Display the students whose SPI is greater than all students of ME branch.

SELECT * FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE SPI > ALL (SELECT SPI FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE BRANCH='ME'
);

--15. Display the students whose SPI is less than any student of ME branch.

SELECT * FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE SPI < ALL (SELECT SPI FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE BRANCH='ME'
);

--16. Display the student details whose SPI is not equal to any SPI of EC branch students.
SELECT * FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE SPI != ALL (SELECT SPI FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE BRANCH='EC'
);

--17. Display the names of students who scored higher SPI than student of RNO 103.
SELECT * FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE SPI > ALL (SELECT SPI FROM STUDENT_INFO S JOIN RESULT R
ON S.RNO=R.RNO
WHERE S.RNO = 103
);
--18. Display the students whose SPI is greater than average SPI of their own branch.
SELECT * FROM STUDENT_INFO S1 JOIN RESULT R
ON S1.RNO=R.RNO
WHERE SPI > ALL (SELECT AVG(SPI) FROM STUDENT_INFO S2 JOIN RESULT R
ON S2.RNO=R.RNO
WHERE S1.BRANCH = S2.BRANCH
);

-- 19. Students whose SPI > avg SPI of CE branch AND > max SPI of ME branch
SELECT S.RNO, S.NAMEE, S.BRANCH, R.SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI > (
    SELECT AVG(R2.SPI)
    FROM STUDENT_INFO S2
    JOIN RESULT R2 ON S2.RNO = R2.RNO
    WHERE S2.BRANCH = 'CE'
)
AND R.SPI > (
    SELECT MAX(R3.SPI)
    FROM STUDENT_INFO S3
    JOIN RESULT R3 ON S3.RNO = R3.RNO
    WHERE S3.BRANCH = 'ME'
);

-- 20. Branches with avg SPI > overall avg SPI
SELECT S.BRANCH
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY S.BRANCH
HAVING AVG(R.SPI) > (
    SELECT AVG(SPI) FROM RESULT
);

-- 21. Students with max SPI in their branch
SELECT S.RNO, S.NAMEE, S.BRANCH, R.SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI = (
    SELECT MAX(R2.SPI)
    FROM STUDENT_INFO S2
    JOIN RESULT R2 ON S2.RNO = R2.RNO
    WHERE S2.BRANCH = S.BRANCH
);

-- 22. Students whose SPI > branch avg AND > overall avg
SELECT S.RNO, S.NAMEE, S.BRANCH, R.SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI > (
    SELECT AVG(R2.SPI)
    FROM STUDENT_INFO S2
    JOIN RESULT R2 ON S2.RNO = R2.RNO
    WHERE S2.BRANCH = S.BRANCH
)
AND R.SPI > (SELECT AVG(SPI) FROM RESULT);
-- 23. Students whose SPI > at least one student of every branch
SELECT S.RNO, S.NAMEE, S.BRANCH, R.SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE NOT EXISTS (
    SELECT 1
    FROM STUDENT_INFO S2
    JOIN RESULT R2 ON S2.RNO = R2.RNO
    WHERE R.SPI <= ALL (
        SELECT R3.SPI
        FROM STUDENT_INFO S3
        JOIN RESULT R3 ON S3.RNO = R3.RNO
        WHERE S3.BRANCH = S2.BRANCH
    )
);

-- 24. Students whose SPI < all students of CE branch
SELECT S.RNO, S.NAMEE, S.BRANCH, R.SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI < ALL (
    SELECT R2.SPI
    FROM STUDENT_INFO S2
    JOIN RESULT R2 ON S2.RNO = R2.RNO
    WHERE S2.BRANCH = 'CE'
);

-- 25. Branch containing student with highest SPI
SELECT S.BRANCH
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI = (SELECT MAX(SPI) FROM RESULT);

-- 26. Students whose SPI < all CE branch AND > all ME branch
SELECT S.RNO, S.NAMEE, S.BRANCH, R.SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
WHERE R.SPI < ALL (
    SELECT R2.SPI
    FROM STUDENT_INFO S2
    JOIN RESULT R2 ON S2.RNO = R2.RNO
    WHERE S2.BRANCH = 'CE'
)
AND R.SPI > ALL (
    SELECT R3.SPI
    FROM STUDENT_INFO S3
    JOIN RESULT R3 ON S3.RNO = R3.RNO
    WHERE S3.BRANCH = 'ME'
);
