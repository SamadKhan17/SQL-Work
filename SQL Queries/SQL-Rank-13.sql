#---STORED PROCEDURE---
USE main;

#NOTE: We can also CREATE STORED PROCEDURE BY RIGHT CLICKING ON STORED PROCEDURE UNDER DATABASE THEN WRITE QUERY AND APPLY.

CALL new_procedure; #Created PROCEDURE using upper method. WE JUST HAVE TO GIVE QUERY AND PROCEDURE NAME when we use this method

#INTERVIEW QUESTION: WHAT IS THE DIFFERENCE BETWEEN RANK AND DENSE RANK? 
#CHECK SS ON DESKTOP TO KNOW ABOUT RANK AND DENSE RANK.

#Index: Whenever we are using Constraints like Unique and Primary Key we are creating a Index as each value is different/unique from each other.
#Indexes are used to speed data Retrieval process. 

#how to write query: SELECT FROM WHERE (CLAUSE) GROUP BY HAVING (CLAUSE) ORDER BY LIMIT;


#Get EMP_ID Full Name and Salary Order by salary big to small top 10
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary FROM myemp
ORDER BY salary 
DESC LIMIT 10;

#Order by EMP_ID
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary FROM myemp
ORDER BY EMP_ID 
DESC LIMIT 10;

#Creating row number
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary, 
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS `Row_Number` #creating row number column based on salary column in descending order (big to small)
FROM myemp;

#---RANK--- RANK() is a function. () this is Syntax.
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary, 
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS `Row_Number`, 
RANK() OVER (ORDER BY salary desc) AS 'Rank' #RANK() FUNCTION. HIGHEST salary 1st Rank
FROM myemp;

#---DENSE RANK--- DENSERANK() is a FUNCTION.
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary, 
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS `Row_Number`, #creating row number column based on salary column in descending order (big to small)
RANK() OVER (ORDER BY salary desc) AS 'Rank', #RANK() FUNCTION
DENSE_RANK() OVER (ORDER BY salary desc) AS 'Dense_Rank' #DENSE_RANK() FUNCTION. HIGHEST salary 1st Rank
FROM myemp;

#Rank 
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary, 
RANK() OVER (ORDER BY salary desc) AS 'Rank' #HIGHEST salary 1st Rank
FROM myemp; 

#Dense Rank
SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary, 
DENSE_RANK() OVER (ORDER BY salary DESC) AS 'Dense_Rank' #HIGHEST salary 1st Rank
FROM myemp; 

#																DENSE RANK & RANK
#---IF 2 people get SAME SALARY, they will get SAME RANK'S lets say 2nd but next person in DENSE RANK IS CALLED 3rd. WHILE IN RANK THAT PERSON IS CONSIDERED AS 4th RANK.---

#Find employee who has 3rd highest salary using DENSE RANK and Sub-Query
SELECT * FROM 
(SELECT EMP_ID, CONCAT(first_name, ' ',last_name) AS `Name`, Salary, #Sub-Query. Creating a table. 
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS `Row_Number`, #creating row number column based on salary column in descending order (big to small)
RANK() OVER (ORDER BY salary desc) AS 'Rank', #RANK() FUNCTION
DENSE_RANK() OVER (ORDER BY salary desc) AS `Dense_Rank` #DENSE_RANK() FUNCTION. HIGHEST salary 1st Rank
FROM myemp) AS RANK_TABLE 
WHERE `Dense_Rank` = 3;

#Sub-Query that we used for creating table
SELECT * FROM
(SELECT * FROM myemp WHERE EMP_ID > 180) AS NewTable;  #Sub-Query. In Query another Query.

#Using COUNT aggregation.
SELECT * FROM nullpractice; #1 Null/Missing value in Region. Total 9 rows including missing/null value.

SELECT COUNT(Region) FROM nullpractice; #8 rows or values we have in Region column. total 9, 1 is null value so total given values are 8.

#---Unique Index---
#UNIQUE INDEX means we won't have duplicate rows for ex: Name = rajesh, Phone = 55458. Repeat again in same table with same name and phone. But we can have different name
#and same phone and different phone no. and same name

#Unique Constraint that we used on column is for individual column values here we are talking about Unique Index.