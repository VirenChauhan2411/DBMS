USE CSE_3A_204


--Perform SQL Queries for ALTER, RENAME, DELETE, TRUNCATE, and DROP Commands


--1. Add column state varchar(20).
	ALTER TABLE DEPOSITE
	ADD STATE VARCHAR(20);

	SELECT * FROM DEPOSITE

--2. Add two more columns city varchar(20) and pincode int.
ALTER TABLE DEPOSITE 
ADD CITY VARCHAR(20),PINCODE INT 


--3. Change the size of cname column from varchar(50) to varchar(35).
ALTER TABLE DEPOSITE
ALTER COLUMN CNAME VARCHAR(35)

--4. Change the data type of amount from decimal to int.
ALTER TABLE DEPOSITE
ALTER COLUMN AMOUNT INT 


--5. Delete column city from the DEPOSIT table.
ALTER TABLE DEPOSITE
DROP COLUMN CITY 

--6. Rename column actno to ano.
SP_RENAME 'DEPOSITE.ACTNO','ANO';


--7. Rename column bname to branch_name.
SP_RENAME 'DEPOSITE.BNAME','BRANCH_NAME'

--8. Rename table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME 'DEPOSITE','DEPOSITE_DETAIL'

SELECT * FROM DEPOSITE_DETAIL


--9. Add column ifsc_code varchar(15).
ALTER TABLE DEPOSITE_DETAIL 
ADD IFSC_CODE VARCHAR(15)

--10. Change the size of bname column from varchar(50) to varchar(30).
ALTER TABLE DEPOSITE_DETAIL
ALTER COLUMN BRANCH_NAME VARCHAR(35)

--11. Rename column adate to aopendate.
SP_RENAME 'DEPOSITE_DETAIL.ADATE','AOPENDATE'

--12. Delete column aopendate from DEPOSIT_DETAIL table.
ALTER TABLE DEPOSITE_DETAIL 
DROP COLUMN AOPENDATE
SELECT * FROM DEPOSITE_DETAIL

--13. Rename column cname to customer_name.
SP_RENAME 'DEPOSITE_DETAIL.CNAME','CUSTOMER_NAME'

--14. Add column country varchar(20).
ALTER TABLE DEPOSITE_DETAIL
ADD COUNTRY VARCHAR(20)

--15. Add column account_type varchar(15).
ALTER TABLE DEPOSITE_DETAIL
ADD ACCOUNT_TYPE VARCHAR(15)

--16. Change data type of pincode from int to bigint.
ALTER TABLE DEPOSITE_DETAIL
ALTER COLUMN PINCODE BIGINT 

--17. Delete column account_type.
ALTER TABLE DEPOSITE_DETAIL
DROP COLUMN ACCOUNT_TYPE

--18. Rename column amount to balance.
SP_RENAME 'BANK_DEPOSIT.AMOUNT','BALANCE'


--19. Add column status varchar(10).
ALTER TABLE DEPOSITE_DETAIL
ADD STATUS VARCHAR(10)

--20. Change table name deposit_detail to bank_deposit.
SP_RENAME 'DEPOSITE_DETAIL','BANK_DEPOSIT'
SELECT * FROM BANK_DEPOSIT

--21. Delete all the records having amount <= 3000
DELETE FROM DEPOSITE
WHERE AMOUNT <= 3000;
SELECT * FROM DEPOSITE

--22. Delete all the accounts of ‘BEDI’ branch customer
DELETE FROM DEPOSITE
WHERE BNAME = 'BEDI';
SELECT * FROM DEPOSITE


--23. Delete all the accounts having account number > 102 and < 109
DELETE FROM DEPOSITE
WHERE ACTNO > 102 AND ACTNO < 109;
SELECT * FROM DEPOSITE

--24. Delete all the accounts whose branch is ‘BEDI’ or ‘MADHAPAR’
DELETE FROM DEPOSITE
WHERE BNAME IN ('BEDI','MADHAPAR');
SELECT * FROM DEPOSITE

--25. Delete all the accounts details where amount = 8000 and account open after 1-1-2025
DELETE FROM DEPOSITE
WHERE AMOUNT = 8000 AND ADATE > '2025-01-01';
SELECT * FROM DEPOSITE

--26. Delete all the accounts whose account branch is NULL
DELETE FROM DEPOSITE
WHERE BNAME IS NULL;

--27. Delete all the accounts details where amount = 7000 and name = 'CHARMI' and branch = 'SHITAL PARK'
DELETE FROM DEPOSITE
WHERE AMOUNT = 7000 AND CNAME = 'CHARMI' AND BNAME = 'SHITAL PARK';
SELECT * FROM DEPOSITE

--28. Delete all the remaining records using DELETE command
DELETE FROM DEPOSITE;
SELECT * FROM DEPOSITE

--29. Delete all the records of DEPOSITE table (Use TRUNCATE)
TRUNCATE TABLE DEPOSITE;
SELECT * FROM DEPOSITE

--30. Remove DEPOSITE table (Use DROP)
DROP TABLE DEPOSITE;
SELECT * FROM DEPOSITE

--31. Delete all the students whose stdid > 105
DELETE FROM STUDENT
WHERE STDID > 105;
SELECT * FROM DEPOSITE

--32. Delete the records whose branch is NULL and sname is not NULL
DELETE FROM STUDENT
WHERE BRANCH IS NULL AND SNAME IS NOT NULL;
SELECT * FROM DEPOSITE

--33. Delete the records whose SPI < 9 and city = 'RAJKOT'
DELETE FROM STUDENT
WHERE SPI < 9 AND CITY = 'RAJKOT';
SELECT * FROM DEPOSITE

--34. Delete the records whose branch name is not empty
DELETE FROM STUDENT
WHERE BRANCH <> '';

--35. Delete all the records of STUDENT table (Use TRUNCATE)
TRUNCATE TABLE STUDENT;
SELECT * FROM DEPOSITE
