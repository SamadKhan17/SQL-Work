USE main;


SELECT * FROM myemp;

#SELF JOIN

SELECT a.EMP_ID, a.First_Name, a.MGR_ID, b.First_name FROM myemp a #SELECTING COLUMN WE WANT
LEFT JOIN myemp b #Left join
ON a.MGR_ID = b.EMP_ID; #CONNECTING 2 SIMILAR COLUMN from a.MGR_ID and from b.EMP_ID

SELECT a.EMP_ID, a.First_Name, a.MGR_ID, b.First_name FROM myemp a
INNER JOIN myemp b #Inner join
ON a.MGR_ID = b.EMP_ID;

SELECT a.EMP_ID, a.First_Name, a.MGR_ID, b.First_name FROM myemp a
RIGHT JOIN myemp b #Right join
ON a.MGR_ID = b.EMP_ID;

#Using UNION to get OUTER JOIN
SELECT a.EMP_ID, a.First_Name, a.MGR_ID, b.First_name FROM myemp a
LEFT JOIN myemp b #Left join
ON a.MGR_ID = b.EMP_ID
UNION #UNION
SELECT a.EMP_ID, a.First_Name, a.MGR_ID, b.First_name FROM myemp a
RIGHT JOIN myemp b #Right join
ON a.MGR_ID = b.EMP_ID;


SELECT * FROM authors; #Here AuthorID column is like Primary Key (NOT NULL and UNIQUE)

SELECT * FROM books; #Here AuthorID column is like Foreign Key
#Foreign Key is going to be Primary Key of some table. FK can have duplicates while PK cannot have duplicates values.


#Task: Find out Authors of ALL books
SELECT a.Name, IFNULL(b.Title,'-') AS Title FROM Authors a
LEFT JOIN Books b #Left join
ON a.AuthorID = b.Authorid
UNION #UNION
SELECT a.Name, b.Title FROM Authors a
RIGHT JOIN Books b #Right join
ON a.AuthorID = b.Authorid;


#---Buffer and Cache OR TCL (Transaction Control Language)--- 

#INTERVIEW QUESTION: What is ACID?
#ACID stands for Atomicity, Consistency, Isolation, and Durability These properties collectively ensure the reliability and integrity of transactions, 
#even in the face of system failures or errors. #MORE ON 15th CLASS

SET AUTOCOMMIT = 0;  #Autocommit off (0) to use TCL (Savepoint,Rollback,Commit)

START TRANSACTION; #Transaction has started.  

#Creating New Table
CREATE TABLE Sample(`Name` Varchar(2));

SELECT * FROM sample; #No data/rows

SAVEPOINT s1; #savepoint is created called as s1

#Doing Manipulation
INSERT INTO sample VALUES('a');
INSERT INTO sample VALUES('b');
INSERT INTO sample VALUES('c'),('d');

SAVEPOINT s2; #Another savepoint is created called as s2

INSERT INTO sample VALUES('E'),('F');

SELECT * FROM sample; #Now we don't want data 'E' and 'F'. we want a,b,c,d

#---ROLLBACK--- We don't want data 'E' and 'F'. we want a,b,c,d. We will be using ROLLBACK

rollback to s2; #Rollaback to s2 savepont where table has values a,b,c,d

SELECT * FROM sample; #now we only have a,b,c,d values E and F values is not present.

SELECT * FROM sample ORDER BY `Name` LIMIT 1,1; 

#Using Myemp Table
SELECT * FROM myemp;

#People earning more than 50k
SELECT CONCAT(First_name, ' ', Last_Name) AS `Name` FROM myemp
WHERE Salary > 50000; #NO ONE IS THERE WHO IS EARNING MORE THAN 50K

#People earning more than 15K
SELECT CONCAT(first_name, ' ' , Last_name) AS 'Name', Salary FROM myemp
WHERE Salary > 15000;

#Average Salary of employees
SELECT AVG(salary) AS AVG_Salary FROM myemp;

#find all the employees who earn more than Average Salary
SELECT * FROM myemp
WHERE Salary > 6456.60; #One method is this as we already know Average salary from above Query.

SELECT * FROM myemp 
WHERE Salary > (Select AVG(salary) FROM myemp); #Another way we can find out who is earning more than average salary of all employees.
#Here we are using Query in another Query so it is called as Sub-Query.

#Find all employees who earns Minimum/lowest salary
SELECT * FROM myemp
WHERE salary = (SELECT MIN(Salary) FROM myemp);

#Find all employees who earns Maximum/highest salary
SELECT * FROM myemp
WHERE salary = (SELECT MAX(Salary) FROM myemp);

#Find Second Maximum Salary
SELECT * FROM myemp
ORDER BY Salary DESC LIMIT 1,1; #one method is using ORDER BY and DESC LIMIT

SELECT * FROM myemp
WHERE salary < (SELECT MAX(Salary) FROM myemp) LIMIT 1; #Using Sub-Query (Query in another Query)

#Find Third Maximum Salary
SELECT * FROM myemp
ORDER BY Salary DESC LIMIT 2,1; 

SELECT * FROM myemp
WHERE Salary < (SELECT MAX(salary) FROM myemp) LIMIT 1,1; #Another method

#Find out employees salary between 15000 and 25000
SELECT * FROM myemp
WHERE salary BETWEEN 15000 AND 25000;

#Find all books along with their Authors
SELECT * FROM authors;
SELECT * FROM books;

SELECT a.Name, b.Title FROM books AS b
INNER JOIN authors AS a
ON a.AuthorID = b.Authorid;

SELECT a.Name, IFNULL(b.Title, 'No Book Found') AS Title FROM books AS b
RIGHT JOIN authors AS a
ON a.AuthorID = b.Authorid;

#Find all authors who have written more than 3 books
SELECT DISTINCT(AuthorID), COUNT(authorid) AS Counts FROM books #Author id 1 have written more than 3 books. DISTINCT tells us different values present 
GROUP BY authorid; #while COUNT how many times value appears.

#Find all books written by Chetan Bhagat
SELECT a.Name, b.Title FROM books AS b
INNER JOIN authors AS a
ON a.AuthorID = b.Authorid
WHERE name = 'Chetan Bhagat';

SELECT * FROM books WHERE authorid = (SELECT authorid FROM authors WHERE `Name` = 'Chetan Bhagat'); #Using Sub-Query

#Find all books written by Chetan Bhagat and Jane Austen
SELECT a.Name, b.Title FROM books AS b
INNER JOIN authors AS a
ON a.AuthorID = b.Authorid
WHERE a.Name = 'Chetan Bhagat' OR a.Name = 'Jane Austen';

SELECT * FROM books WHERE authorid IN(SELECT authorid FROM authors WHERE Name IN('Chetan Bhagat', 'Jane Austen')); #USING Sub-Query

#Find all books written by Chetan Bhagat or Oscar Wilde
SELECT a.Name, b.Title FROM books AS b
INNER JOIN authors AS a
ON a.AuthorID = b.Authorid
WHERE a.Name = 'Chetan Bhagat' OR a.Name = 'Oscar Wilde';

SELECT * FROM books WHERE authorid IN(SELECT authorid FROM authors WHERE Name IN('Chetan Bhagat', 'Oscar wilde')); #USING Sub-Query
