--Part – A: 

--Implement SQL In-Built Functions for Mathematical and String Operations

--1. Display the result of 5 multiply by 30. 
SELECT 5*30

--2. Find out the absolute value of -25, 25, -50 and 50. 
SELECT ABS(-25),ABS(25),ABS(-50),ABS(50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 
SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2)	

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
SELECT (5%2),(5%3)

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
SELECT POWER(3,2),POWER(4,3)

--7. Find out the square root of 25, 30 and 50. 
SELECT SQRT(25),SQRT(30),SQRT(50)

--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5),SQUARE(15),SQUARE(25)

--9. Find out the value of PI. 
SELECT PI() AS PI_VALUES

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.  
SELECT ROUND(157.732,2),ROUND(157.732,0),ROUND(157.732,-2)

--11. Find out exponential value of 2 and 3. 
SELECT EXP(2),EXP(3)

--12. Find out logarithm having base e of 10 and 2. F
SELECT LOG(10),LOG(2)

--13. Find logarithm base 10 of 5 and 100 
SELECT LOG10(5),LOG10(100)

--14. Find sine, cosine and tangent of 3.1415. 
SELECT SIN(3.1415),COS(3.1415),TAN(3.1415)

--15. Find sign of -25, 0 and 25. 
SELECT SIGN(-25),SIGN(0),SIGN(25)

--16. Generate random number using function.
SELECT RAND()



--String functions 
--Part – A: 


--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
SELECT LEN(NULL),LEN('  HELLO   '),LEN('BLANK')

--2. Display your name in lower & upper case. 
SELECT LOWER('YUG'),UPPER('YUG')

--3. Display first three characters of your name. 
SELECT LEFT('YUGKASUNDRA',3)

--4. Display 3rd to 10th character of your name
SELECT SUBSTRING('YUGKASUNDRA',3,7)

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
SELECT REPLACE('abc123efg','123','XYZ'),REPLACE('abcabcabc','c','5')

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII(0),ASCII(9)

--7. Write a query to display character based on number 97, 65,122,90,48,57. 
SELECT CHAR(97),CHAR(65),CHAR(122),CHAR(90),CHAR(48),char(57)

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
SELECT LTRIM('hello word')

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 
SELECT RTRIM('hello word')

-- 10. Display first 4 & Last 5 characters of ‘SQL Server’
SELECT LEFT('SQL Server', 4) AS FirstFour, RIGHT('SQL Server', 5) AS LastFive;

-- 11. Convert string ‘1234.56’ to a number using CAST and CONVERT
SELECT CAST('1234.56' AS DECIMAL(6,2)) AS CastResult;
SELECT CONVERT(DECIMAL(6,2), '1234.56') AS ConvertResult;

-- 12. Convert float 10.58 to an integer using CAST and CONVERT
SELECT CAST(10.58 AS INT) AS CastResult;
SELECT CONVERT(INT, 10.58) AS ConvertResult;

-- 13. Put 10 spaces before your name (Replace 'YourName' with your actual name)
SELECT SPACE(10) + 'YourName' AS SpacedName;

-- 14. Combine two strings using + sign and CONCAT()
SELECT 'SQL ' + 'Server' AS PlusCombined;
SELECT CONCAT('SQL ', 'Server') AS ConcatCombined;

-- 15. Find the reverse of “Darshan”
SELECT REVERSE('Darshan') AS ReversedString;

-- 16. Repeat your name 3 times (Replace 'YourName' with your actual name)
SELECT REPLICATE('YourName', 3) AS RepeatedName;

--17. Display FIRST_NAME and LAST_NAME in lowercase and uppercase
SELECT LOWER(FIRST_NAME) AS FIRST_NAME_LOWER,
       LOWER(LAST_NAME) AS LAST_NAME_LOWER,
       UPPER(FIRST_NAME) AS FIRST_NAME_UPPER,
       UPPER(LAST_NAME) AS LAST_NAME_UPPER
FROM EMPLOYEE;

--18. Display full name by combining FIRST_NAME and LAST_NAME
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULLNAME
FROM EMPLOYEE;

--19. Display FIRST_NAME with first 3 characters only
SELECT SUBSTRING(FIRST_NAME, 1, 3) AS FIRST3
FROM EMPLOYEE;

--20. Display LAST_NAME with last 2 characters only
SELECT RIGHT(LAST_NAME, 2) AS LAST2
FROM EMPLOYEE;

--21. Display length of each employee’s FIRST_NAME
SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS NAME_LENGTH
FROM EMPLOYEE;

--22. Display FIRST_NAME after replacing ‘A’ with ‘@’
SELECT REPLACE(FIRST_NAME, 'A', '@') AS MODIFIED_NAME
FROM EMPLOYEE;

--23. Display FIRST_NAME and LAST_NAME with - between them using CONCAT
SELECT CONCAT(FIRST_NAME, '-', LAST_NAME) AS FULLNAME_WITH_DASH
FROM EMPLOYEE;

--24. Display FIRST_NAME without first and last character
SELECT SUBSTRING(FIRST_NAME, 2, LEN(FIRST_NAME)-2) AS NAME_TRIMMED
FROM EMPLOYEE;

--25. Display FIRST_NAME after replacing vowels with '*'
SELECT REGEXP_REPLACE(FIRST_NAME, '[AEIOUaeiou]', '*') AS NAME_NO_VOWELS
FROM EMPLOYEE;

--26. Display employees where combined length of FIRST_NAME and LAST_NAME is greater than 10
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEE
WHERE LEN(FIRST_NAME + LAST_NAME) > 10;


--27. Display FIRST_NAME and its reverse
SELECT FIRST_NAME, REVERSE(FIRST_NAME) AS REVERSED_NAME
FROM EMPLOYEE;

--28. Display employees whose FIRST_NAME and LAST_NAME start with same character using LEFT()
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEE
WHERE LEFT(FIRST_NAME,1) = LEFT(LAST_NAME,1);


