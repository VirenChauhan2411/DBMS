
--Implement User Defined Functions (UDF) in SQL (Intermediate)

--Part – A:
--1. Implement scalar function to return "Welcome to DBMS Lab".
CREATE FUNCTION wel()
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'Welcome to DBMS Lab';
END;

--2. Implement scalar function to calculate simple interest.
CREATE OR ALTER FUNCTION SP 
(@P INT,
@R INT,
@T INT)
RETURNS INT
AS
BEGIN
    DECLARE @ANS INT
    SET @ANS = (@P*@R*@T)/100
    RETURN @ANS
END

SELECT DBO.SP(80,89,90)

--3. Implement scalar function to find difference in days between two dates.
CREATE FUNCTION DAYSDIFFRENCES
(@DATE1 DATETIME, @DATE2 DATETIME)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, @DATE1, @DATE2);
END;

SELECT DBO.DAYSDIFFRENCES('2007-11-08','2007-11-12')

--4. Implement scalar function to check whether number is odd or even.
CREATE FUNCTION ODD_EVENS
(@N INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @ANS VARCHAR(20)
    IF @N%2=0
        BEGIN
            SET @ANS='EVEN'
        END
    ELSE
        BEGIN
            SET @ANS='ODD'
        END

   RETURN @ANS
END;

SELECT DBO.1_TO_N

--5. Implement scalar function to print numbers from 1 to N.
CREATE OR ALTER FUNCTION ONE_TO_N
(@N INT) RETURNS VARCHAR(100)
AS
BEGIN
DECLARE @I INT = 1,@TEMP VARCHAR(100) = ''
WHILE @I <= @N
BEGIN
SET @TEMP = @TEMP+', ' + CAST(@I AS VARCHAR)
SET @I = @I + 1
END

RETURN @TEMP
  
END;

SELECT DBO.ONE_TO_N(10)


--Part – B:

--6. Implement scalar function to calculate factorial of given number.
CREATE FUNCTION FACTORIAL(@NUM INT)
RETURNS BIGINT
AS
BEGIN
    DECLARE @FACT BIGINT = 1, @I INT = 1;
    WHILE @I <= @NUM
    BEGIN
        SET @FACT = @FACT * @I;
        SET @I = @I + 1;
    END
    RETURN @FACT;
END;

SELECT DBO.FACTORIAL(10)


--7. Implement scalar function to check palindrome number.
CREATE OR ALTER
FUNCTION ISPALINDROME(@NUM INT)
RETURNS VARCHAR(15)
AS
BEGIN
    DECLARE @REV INT = 0, @TEMP INT = @NUM;
    WHILE @TEMP > 0
    BEGIN
        SET @REV = @REV * 10 + @TEMP % 10;
        SET @TEMP = @TEMP / 10;
    END
    RETURN CASE WHEN @REV = @NUM THEN 'PALINDROME' ELSE 'NOT PALINDROME' END;
END;

SELECT DBO.ISPALINDROME(10)


--8. Implement scalar function to find maximum of three numbers.
CREATE OR ALTER FUNCTION MAX_THREE(@A INT,@B INT,@C INT)
RETURNS INT
AS
    MAX(@A,SELECT MAX(@B,@C)
BEGIN
END;

--9. Implement scalar function to calculate square and cube of a number.
CREATE FUNCTION SQUARECUBE(@NUM INT)
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'SQUARE=' + CAST(@NUM*@NUM AS VARCHAR) +
           ',CUBE=' + CAST(@NUM*@NUM*@NUM AS VARCHAR);
END;

SELECT DBO.SQUARECUBE(10)

--From the table EMPLOYEE perform the following queries:
--Part – C:
--10. Employee full details by EID
CREATE OR ALTER FUNCTION EMP_DETAILS(@EID INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @DETAILS VARCHAR(MAX);
    SELECT @DETAILS = CONCAT(EID, ' - ', FIRSTNAME, ' ', LASTNAME,
                             ', Dept: ', DEPARTMENT,
                             ', City: ', CITY,
                             ', Salary: ', SALARY)
    FROM EMPLOYEE WHERE EID = @EID;
    RETURN @DETAILS;
END;
SELECT DBO.EMP_DETAILS(101);

--11. Highest salary in department
CREATE OR ALTER FUNCTION HIGHEST_SALARY(@DEPT VARCHAR(50))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT = @DEPT);
END;
SELECT DBO.HIGHEST_SALARY('HR');

--12. Total employees
CREATE OR ALTER FUNCTION TOTAL_EMPLOYEES()
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM EMPLOYEE);
END;
SELECT DBO.TOTAL_EMPLOYEES();

--13. Experience of employee
CREATE OR ALTER FUNCTION EMP_EXPERIENCE(@EID INT)
RETURNS INT
AS
BEGIN
    DECLARE @EXP INT;
    SELECT @EXP = YEAR(GETDATE()) - JoiningYear
    FROM EMPLOYEE WHERE EID = @EID;
    RETURN @EXP;
END;
SELECT DBO.EMP_EXPERIENCE(101);

--14. Employees in department
CREATE OR ALTER FUNCTION DEPT_EMP_COUNT(@DEPT VARCHAR(50))
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM EMPLOYEE WHERE DEPARTMENT = @DEPT);
END;
SELECT DBO.DEPT_EMP_COUNT('Finance');

--15. Employees from city
CREATE OR ALTER FUNCTION CITY_EMP_COUNT(@CITY VARCHAR(50))
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM EMPLOYEE WHERE CITY = @CITY);
END;
SELECT DBO.CITY_EMP_COUNT('Rajkot');