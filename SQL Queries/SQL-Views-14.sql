#INTERVIEW QUESTION: What is Partition in SQL?
#PARTITION BY will group departments/categories based on column we say then we use ORDER BY.
#Partition will create a group and within that group values are going to be ordered.

#INTERVIEW QUESTION: What is ACID? THIS ACID IS ONLY FOR KNOWLEDGE PURPOSE.
#ACID stands for Atomicity, Consistency, Isolation, and Durability These properties collectively ensure the reliability and integrity of transactions, 
#even in the face of system failures or errors.

#Atomic tells when we start transaction there is only 2 possibility, SUCCESS/commit OR FAIILURE/rollback.
#Consistent=cy, maintain consistent in transaction.
#Isolation, every transaction is different from each other.	1st transaction commit or rollback, 2nd transtaction commit or rollback.
#Durability 

USE main;
 
#New data member who watched movies
SELECT * FROM members;

#New data movies
SELECT * FROM movies;

#LEFT JOIN
SELECT CONCAT(mem.first_name, ' ', mem.Last_name) AS Names, IFNULL(movies.Title, 'No Movies Found') AS Movies FROM members as mem 
LEFT JOIN movies
ON mem.movieid = movies.id;

SELECT * FROM members
LEFT JOIN movies
ON members.movieid = movies.id;

SELECT b.id, b.title, b.category, m.first_name FROM members AS m
LEFT JOIN movies b #LEFT TABLE WHICH IS members WILL BE TAKEN AND SIMILAR/COMMON ITEMS/VALUES FROM RIGHT TABLE WHICH IS movies
ON m.movieid = b.id;

#We don't want to see null values we want - (hyphen) instead of null
SELECT b.id, b.title, b.category, m.first_name FROM members AS m
RIGHT JOIN movies b #RIGHT TABLE WHICH IS movies WILL BE TAKEN AND SIMILAR/COMMON ITEMS/VALUES FROM LEFT TABLE WHICH IS members
ON m.movieid = b.id;

#no null values present in First_name
SELECT b.id, b.title, b.category, IFNULL(m.first_name, '-') AS Name FROM members AS m
RIGHT JOIN movies b
ON m.movieid = b.id;

#LEFT JOIN ON movies TABLE
SELECT a.id, a.title, a.category, IFNULL(m.first_name, '-') AS Name FROM movies AS a
LEFT JOIN members m
ON m.movieid = a.id;

#---VIEW---
#We can see VIEWS under DATABASE (IN SCHEMAS). WHICH IS ONE OF THE DATABASE OBJECT LIKE TABLE, STORED PROCEDURE AND FUNCTIONS.
#WHEN WE DON'T WANT TO GIVE USER/EMPLOYEE DO DML (Insert Update Delete) Operations WE CAN GIVE THAT PERSON VIEW. HE CAN OBLY VIEW TABLE/DATA AND CANNOT MAKE CHANGES.

CREATE VIEW rental AS #Creating VIEW as rental
	SELECT a.id, a.title, a.category, IFNULL(m.first_name, '-') AS Name FROM movies AS a
	LEFT JOIN members m
	ON m.movieid = a.id; #Giving this query so that person can view this table only and can't make any changes or manipulate the table/data.
#Now we can see under main DATABASE VIEWS Object has drop down and it has CREATED A VIEW CALLED rental.

#The person who can see this data has to use this query
SELECT * FROM rental; #It is a temporary table. VIEWS DOES NOT OCCUPY SPACE FROM DATABASE.


#TASK: Create a VIEW showing Employees from Department 60 using myemp Table
SELECT * FROM myemp;
 
SELECT * FROM myemp
WHERE DEP_ID = 60;
    
#Creating view
CREATE VIEW dep60_emp AS
	SELECT * FROM myemdep60_empp
	WHERE DEP_ID = 60;

SELECT * FROM dep60_emp; #VIEW IS CREATED.

#Total salary odep60_empf all departments in descending order (big to small)
SELECT dep_id, sum(salary) AS Total_salary FROM myemp
GROUP BY dep_id ORDER BY total_salary DESC;

#Dropped rental view
DROP VIEW rental;

#Dropping New_procedure (STORED PROCEDURE)
CALL New_Procedure;

DROP PROCEDURE new_procedure;

#---Auto_increment---
#USE AUTO_INCREMENT AFTER PRIMARY KEY CONSTRAINT WHILE CREATING COLUMN
#Auto_Increment will basically create values automatically without having to write it.
#Creating NEW TABLE using AUTO_INCREMENT
CREATE TABLE students_2(ID INT PRIMARY KEY Auto_Increment, Name VARCHAR(20), Course VARCHAR(30));

INSERT INTO students_2(Name, Course) VALUES('Suresh','SQL'),('Priya', 'Power BI'),('Riha','Data Analytics');

SELECT * FROM students_2; #ID values we did not gave but still it took ID values because of Auto_Increment.
 
ALTER TABLE students_2 AUTO_INCREMENT = 1000; #STARTNG ATUO_INCREMENT COLUMN FROM students_2 ID COLUMN VALUES FROM 1000

INSERT INTO students_2(Name, Course) VALUES('Ruheena','Data Science'),('Suhana', 'Data Engineer'),('Meerab','Data Science');

SELECT * FROM students_2; #Automatically starting ID Values from 1000

INSERT INTO students_2 VALUES (500, 'Samiya', 'Tableau'); #We can also give values in ID Column even if we use Auto_increment.

SELECT * FROM students_2;


#DML - Delete
#Before using DML commands like Delete Update we have to turn off SQL Safe
SET sql_safe_updates = 0;

#Deleting/removing 500 ID from students_2 table
DELETE FROM students_2 
WHERE ID = 500;

-- DELETE FROM students_2; #THIS STEP WILL DELETE ALL THE ROWS FROM OUR TABLE ONE BY ONE. 
-- TRUNCATE students_2; #TRUNCATE WILL BASICALLY DELETE ALL THE DATA/ROWS AT ONCE.

SELECT * FROM students_2; #500 ID row/record is deleted.