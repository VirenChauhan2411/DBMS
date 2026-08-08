	USE CSE_3A_204

--Perform SQL Pattern Searching Using LIKE Operator

--1. Display employees detail whose FIRST_NAME starts with ‘H’.

SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'H%'

--2. Display employees detail whose FIRST_NAME consists of exactly 5 characters.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '_____'

--3. Display employees detail whose CITY ends with ‘T’ and has 6 characters.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE '_____T'

--4. Display employees detail whose LASTNAME ends with ‘EL’.
SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE '%EL'

--5. Display employees detail whose FIRST_NAME starts with ‘R’ and ends with ‘A’.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%A' AND FIRST_NAME LIKE 'R%'

--6. Display employees detail whose FIRST_NAME starts with ‘V’ and third character is ‘S’.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'V%' AND FIRST_NAME LIKE '__S%'

--7. Display employees detail whose CITY is NULL and FIRST_NAME has 6 characters.
SELECT * FROM EMPLOYEE
WHERE CITY IS NULL AND FIRST_NAME LIKE '______'

--8. Display employees detail whose FIRST_NAME contains ‘AR’.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%AR%'

--9. Display employees detail whose CITY starts with ‘R’ or ‘B’.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE 'R%' OR CITY LIKE '%B'

--10. Display employees detail whose DEPARTMENT is NOT NULL.
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT IS NOT NULL

--11. Display employees detail whose FIRST_NAME starts from alphabet A to H.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '[A-H]%'

--12. Display employees detail whose second character of FIRST_NAME is a vowel.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME NOT LIKE '_[AEIOU]%'

--13. Display employees detail whose FIRST_NAME length ≥ 5.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '_____%'

--14. Display employees detail whose LASTNAME starts with ‘PA’
SELECT * FROM EMPLOYEE
WHERE LASTNAME LIKE 'PA%'

--15. Display employees detail whose CITY does not start with ‘B’.
SELECT * FROM EMPLOYEE
WHERE CITY NOT LIKE 'B%'

--16. Display employees whose second character of FIRST_NAME is a not vowel.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME NOT LIKE '_[AEIOU]%'

--17. Display employees whose JOINING YEAR last digit is 4 or 6.
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR  LIKE '%4' OR JOININGYEAR  LIKE '%6' 

--18. Display employees detail whose FIRST_NAME starts with ‘H’, ends with ‘I’, and CITY contains ‘RA’.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME  LIKE 'H%' AND  FIRST_NAME  LIKE '%I' AND CITY LIKE '%RA%'

--19. Display employees detail whose FIRST_NAME contains ‘A’, CITY ends with ‘D’, and DEPARTMENT is NOT NULL.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME  LIKE '%A%' AND DEPARTMENT IS NOT NULL AND CITY LIKE '%D'

--20. Display employees whose second and third characters of FIRST_NAME are vowels and CITY starts with ‘R’.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME  LIKE '_[AEIOU]%' AND  FIRST_NAME  LIKE '__[AEIOU]%' AND CITY LIKE 'R%'

--21. Display employees whose CITY contains ‘RA’ and salary less than 13000 and joining year last digit is 6.
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR LIKE '___6' AND  SALARY < 13000 AND CITY LIKE '%RA%'

--22. Display employees whose SALARY between 10000 and 15000 and CITY name contains 'KO' andFIRST_NAME start with H.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'H%' AND  SALARY BETWEEN 10000 AND 15000 AND CITY LIKE '%KO%'

--23. Display employees whose FIRST_NAME starts with ‘A’ or ‘D’ and SALARY greater than 12000.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE 'A%' AND FIRST_NAME LIKE 'D%' AND SALARY > 12000

--24. Display employees whose CITY contains ‘N’ and SALARY less than 15000.
SELECT * FROM EMPLOYEE
WHERE CITY LIKE '%N%' AND SALARY < 15000

--25. Display employees whose FIRST_NAME length = 6 and CITY ends with ‘AR’.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '______' AND CITY LIKE '%AR'

--26. Display employees whose FIRST_NAME ends with a vowel, department name start with vowel, and SALARY is between 10000 and 15000.
SELECT * FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%A' OR  FIRST_NAME LIKE '%E' OR  FIRST_NAME LIKE '%I' OR  FIRST_NAME LIKE '%O' OR  FIRST_NAME LIKE '%U'
AND (DEPARTMENT LIKE 'A%' OR  DEPARTMENT LIKE 'E%' OR  DEPARTMENT LIKE 'I%' OR  DEPARTMENT LIKE 'O%' OR  DEPARTMENT LIKE 'U%') 
AND SALARY BETWEEN 10000 AND 15000

--27. Display employees whose LASTNAME contains ‘A’ at least twice, gender is male, and SALARY is not equalto 14000.
SELECT * FROM EMPLOYEE
WHERE SALARY != 14000
AND GENDER = 'MALE'
AND LAST_NAME LIKE '%A%A%'

--28. Display employees whose FIRST_NAME second character is vowel and LASTNAME ends with ‘R’ and SALARY less than 12000.
SELECT * FROM EMPLOYEE
WHERE SALARY < 12000
AND LAST_NAME LIKE '%R'
AND (FIRST_NAME LIKE '_A%' OR FIRST_NAME LIKE 'E%' OR  FIRST_NAME LIKE '_I%' OR  FIRST_NAME LIKE '_O%' OR  FIRST_NAME LIKE '_U%')

--29. Display employees whose CITY is NOT NULL and FIRST_NAME does not start with vowel and DEPARTMENT not in (‘HR’, ‘IT’).
SELECT * FROM EMPLOYEE
WHERE CITY IS NOT NULL
AND (FIRST_NAME NOT LIKE 'A%' 
OR   FIRST_NAME NOT LIKE 'E%' 
OR   FIRST_NAME  NOT LIKE 'I%' 
OR   FIRST_NAME  NOT LIKE 'O%' 
OR   FIRST_NAME NOT LIKE 'U%')
AND DEPARTMENT NOT IN ('HR', 'IT');

--30. Display employees whose CITY is not NULL, FIRST_NAME ends with vowels, and DEPARTMENT is neither ‘HR’ nor ‘IT’.
SELECT * FROM EMPLOYEE
WHERE CITY IS NOT NULL
AND (FIRST_NAME LIKE '%A' 
OR   FIRST_NAME LIKE '%E' 
OR   FIRST_NAME LIKE '%I' 
OR   FIRST_NAME LIKE '%O' 
OR   FIRST_NAME LIKE '%U')
AND DEPARTMENT NOT IN ('HR', 'IT')


--************** EXTRA ****************--


--1. Find all records where the PatientName starts with 'A' and ends with 'h'.
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME LIKE 'A%' AND PATIENTNAME LIKE '%H'

--2. Find all records where the DiagnosisCode starts with 'abc' and ends with '9'.
SELECT * FROM PATIENTRECORDS
WHERE DIAGNOSISCODE LIKE 'ABC%' AND DIAGNOSISCODE LIKE '%9'

--3. Find all records where the PatientName starts with 'C' and is exactly 11 characters long.
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME LIKE 'C%' AND PATIENTNAME LIKE '___________%'

--4. Find all records where the DiagnosisCode ends with a literal percent sign %.
SELECT * FROM PATIENTRECORDS
WHERE DIAGNOSISCODE LIKE '%[%]' 

--5. Find all records where the TreatmentPlan ends with a period ‘.’.
SELECT * FROM PATIENTRECORDS
WHERE TREATMENTPLAN LIKE '[.]%' 

--6. Find all records where the PatientName begins with any letter from A through C.
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME LIKE '[A-C]%' 

--7. Find all records where the DiagnosisCode starts with a letter between X and Z.
SELECT * FROM PATIENTRECORDS
WHERE DIAGNOSISCODE LIKE '[X-Z]%' 

--8. Find all records where the DiagnosisCode contains a 3-digit number starting with 4 (i.e., 400 to 499).
SELECT * FROM PATIENTRECORDS
WHERE DIAGNOSISCODE LIKE '4[0-9][0-9]%'

--9. Find all records where the PatientName does NOT start with any letter between A and C.
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME NOT LIKE '[A-C]%' 

--10. Find all records where the PatientName starts with a number.
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME  LIKE '[0-9]%'

--11. PatientName starts with a number
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME LIKE '[0-9]%';

--12. Second letter of PatientName is a lowercase vowel
SELECT * FROM PATIENTRECORDS
WHERE PATIENTNAME LIKE '_[aeiou]%';

--13. DiagnosisCode starts with a letter followed by two digits
SELECT * FROM PATIENTRECORDS
WHERE DIAGNOSISCODE LIKE '[A-Za-z][0-9][0-9]%';

--14. Last character of DiagnosisCode is NOT a letter or number
SELECT * FROM PATIENTRECORDS
WHERE DIAGNOSISCODE LIKE '%[^A-Za-z0-9]';