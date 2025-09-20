USE Main;


SELECT * FROM authors;

SELECT * FROM books limit 5; #limit 5. returns/shows 5 rows from top


#INNER JOIN or JOIN
SELECT * FROM authors # * selecting all columns from both tables
JOIN books 
ON authors.authorid = books.authorid; #Connecting 2 similar columns

SELECT books.title, authors.name FROM authors #Selecting required columns
JOIN books 
ON authors.authorid = books.authorid; #Connecting 2 similar columns

#LEFT JOIN
SELECT COALESCE(books.title, '-') AS title, authors.name FROM authors #Filling null/missing values with '-' Using COALESCE
LEFT JOIN books 
ON authors.authorid = books.authorid;

#Movies table
SELECT * FROM movies;

#Actors table
SELECT * FROM members;

#WHICH MOVIE BELONG TO WHICH GENRE/CATEGORY AND ACTORS?
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name, movies.Title, movies.category FROM movies
INNER JOIN members
ON movies.id = members.movieid;

#ALL MOVIES LIST/DATA AND THEIR ACTORS AND CATEGORIES
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name, movies.Title, movies.category FROM movies
LEFT JOIN members
ON movies.id = members.movieid;

#NULL/MISSING VALUES AS HYPHEN '-' USING IFNULL ON First_Name and Last_Name COLUMN
SELECT IFNULL(CONCAT(first_name, ' ', last_name), '-') AS Full_Name, movies.Title, movies.category FROM movies #LEFT TABLE movies
LEFT JOIN members #RIGHT TABLE MOVIES
ON movies.id = members.movieid;

#ALL ACTORS/MEMBERS LIST/DATA AND THEIR MOVIES AND CATEGORIES
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name, movies.Title, movies.category FROM movies
RIGHT JOIN members
ON movies.id = members.movieid;

#NULL/MISSING VALUES AS HYPHEN '-' USING IFNULL ON TITLE and CATEGORY COLUMN
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name, IFNULL(movies.Title, '-'), IFNULL(movies.category,'-') FROM movies
RIGHT JOIN members
ON movies.id = members.movieid;

#OUTER JOIN/FULL JOIN. Everything from both the Tables. filling null values with '-' in Full_Name, Title and Category
SELECT IFNULL(CONCAT(first_name, ' ', last_name), '-') AS Full_Name, movies.Title, movies.Category FROM movies #LEFT TABLE movies
LEFT JOIN members #RIGHT TABLE MOVIES
ON movies.id = members.movieid

UNION #To combine LEFT JOIN RIGHT JOIN and get FULL JOIN or FULL DATA OF BOTH TABLES

SELECT IFNULL(CONCAT(first_name, ' ', last_name), '-') AS Full_Name, IFNULL(movies.Title,'-'), COALESCE(movies.category,'-') FROM movies #LEFT TABLE movies
RIGHT JOIN members #RIGHT TABLE MOVIES
ON movies.id = members.movieid;

#New table first 5 records/rows
SELECT * FROM myemp LIMIT 5;

#How many rows we have
SELECT COUNT(*) AS 'ROWS' FROM myemp;

#Using EMP_ID and MGR_ID we want to find who is reporting to who?
#This is SELF JOIN. SELF JOIN means there is only 1 table to consider. we are considering 2 similar columns from 1 table.

SELECT a.EMP_ID, a.first_name, a.last_name, a.MGR_ID, b.first_name, b.last_name FROM myemp AS a
LEFT JOIN myemp as b
ON a.MGR_ID = b.EMP_ID; #Connecting Manager ID (MGR_ID) with Employee ID (EMP_ID)
#No manager/boss for Steven as he is CEO. Neenda reports to 100 EMP_ID which is Steven. Alexander Reports to 102 EMP_ID which os LEX DE HAAN and so on.

#Improving
SELECT a.EMP_ID, CONCAT(a.first_name,' ' ,a.last_name) AS Full_Name, a.MGR_ID, CONCAT(b.first_name, ' ',b.last_name) AS 'Reports_To/Manager' FROM myemp AS a #Select needed fields/columns
LEFT JOIN myemp as b
ON a.MGR_ID = b.EMP_ID; #Connecting Manager ID (MGR_ID) with Employee ID (EMP_ID). getting EMO_ID FROM b
#No manager/boss for Steven as he is CEO. Neenda reports to 100 EMP_ID which is Steven. Alexander Reports to 102 EMP_ID which os LEX DE HAAN and so on.

#-----SELF JOIN PRACTICE NEEDED------

#New Table
SELECT * FROM meals;

#New Table
SELECT * FROM drinks;

#---Cross Join---
/*When we do CROSS JOIN we don't need common column like INNER JOIN or LEFT JOIN or RIGHT JOIN etc. No condition like ON needed.
A CROSS JOIN is a type of join that returns the Cartesian product of two tables. 
This means that it combines each row from the first table with every row from the second table*/

SELECT * FROM drinks
CROSS JOIN meals; 

SELECT * FROM meals
CROSS JOIN drinks;  

SELECT *, meals.rate+drinks.rate AS Total_Price FROM meals #SELECTING ALL COLUMNS, Adding/sum rate column from Meals and rate column from Drinks AS Total_Price
CROSS JOIN drinks; #DERIVED Column (Total_Price). Creating new column using existing columns. We are not manipulating Real Database.


#---Practice SELF JOIN---
SELECT * FROM myemp;

SELECT a.EMP_ID, CONCAT(a.FIrst_name, ' ' , a.Last_Name) AS Names, a.MGR_ID, IFNULL(CONCAT(b.First_name, ' ' , b.last_name), '-') AS Manager FROM myemp AS a
LEFT JOIN myemp AS b
ON a.MGR_ID = b.EMP_ID;