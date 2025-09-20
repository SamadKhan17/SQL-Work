/*#Data-Type 
Float(7,2) -> 
Double(7,2) -> 
Decimal(7,2) -> If we want everything to be precise then we use Decimals. When we deal with bank data when currency is there then we use Decimal to be accurate.

Date, DateTime, Now() is also Data-types
 
#Command is also known as Query,Statement. any command/query/statement we have to end it with a ; (semi-colon).
Commands in SQL > DDL, DQL, DML, TCL, DCL.
*/ 

#DCL (Data Query Language)

#GRANT SELECT ON Main TO Zara; #We can use this to grant access to a User (zara) the Database Main to work on.

#REVOKE can be used to Revoke/remove Zara from accessing Main Database.

#Importing New data to work

USE Main;

SHOW tables; #1Data and 2Data is Imported.

DESC 1data; #Undertanding column names data-type of 1Data

DESCRIBE 2data; #Undertanding column names data-type of 2Data

#1Data Table
SELECT * FROM 1data;

#2Data Table
SELECT * FROM 2data;

#---SET operation in SQL which includes UNION, UNION ALL, MINUS, INTERSECT.---
#UNION --> Everything is going to be consider from 2 Table with No Repetition. Unique RECORD/ROWS/OBSERVATION from both Tables will come.
#UNION ALL --> Everything is going to be considered from 2 tables even duplicates values.
#MINUS/EXCEPT --> The MINUS/EXCEPT operator returns the unique element from the first table/set, which is not found in the second table/set.
#INTERSECT --> Any rows which is common in both tables will returns.
#ALL THIS SET OPERATOR'S IS GOING TO WORK ON ROWS/RECORDS/OBSERVATION.

#UNION
SELECT * FROM 1data; #25 rows
SELECT * FROM 2data; #36 rows

SELECT * FROM 1data
UNION 
SELECT * FROM 2data; #no duplicates rows

#UNION ALL
SELECT * FROM 1data
UNION ALL
SELECT * FROM 2data; #duplicates rows repeated.

#MINUS/EXCEPT
SELECT * FROM 1data
EXCEPT
SELECT * FROM 2data; #Everything from 1data EXCEPT/Don't consider 2data 

SELECT * FROM 2data
EXCEPT
SELECT * FROM 1data; #Everything from 2data EXCEPT/Don't consider 1data 

#INTERSECT
SELECT * FROM 1data
INTERSECT
SELECT * FROM 2data; #anything which is common/similar values/rows in both tables

#Myemp Table
SELECT COUNT(*) FROM myemp; #Total 106 rows in myemp table

#---Delimiter---
#DELIMITER $$ #delimiter means semi-colon ; #here we are telling the system use $$ as delimiter/semi-colon

#SELECT * FROM myemp$$ #Now instead of ; to end query we are using $$ delimiter.

#DELIMITER ; #bringing it back to ;

#SELECT * FROM myemp;


#---Under SCHEMAS, then UNDER DATABASE WE CAN SEE STORED PROCEDURES.---

#When we have to repeat a query again and again we can save it Stored Procedures and use it without typing all the query again.

#Creating Procedure
DELIMITER $$ #WE NEED TO USE DELIMITER BEFORE BUILDING A FUNCTION.

CREATE PROCEDURE get_emps() #Procedure named as get_emps() #while creating Procedure we need to add () parenthesis.
BEGIN
	SELECT * FROM myemp; #Indent -> can be given using TAB on Keyboard.
END $$ #This where we are using DELIMITER WE NAMED AS $$

DELIMITER ; #bringing back ; 

#In STORED PROCEDURES we can see FUNCTION IS CREATED

#INTERVIEW QUESTION: WHY DELIMITER SHOULD BE CHANGED? WHY DO YOU CHANGE DELIMITER WHEN WE CREATE PROCEDURE?	
/*
IF WE DONT'T CHANGED DELIMITER TO $$ or // IT WILL THROW ERROR AS WE HAVE TO END THE QUERY WE ARE BULDING WITH ; AS WELL AS THE PROCUDURE SO TO AVOID CONFUSION
WE CHANGE OUR DELIMITER TO $$ or // FOR A WHILE THEN CHANGE IT BACK TO ; 
*/

CALL get_emps(); #We just need to call Procedure. we don't have to tyoe entire query again and again.

#Dropping/removing/deleting Procedure
DROP PROCEDURE get_emps;

#Creating Procedure again. NO COMMENTS AFTER DELIMITER.
DELIMITER $$

CREATE PROCEDURE get_emps()
BEGIN
    SELECT * FROM myemp WHERE salary > 9000
    AND First_Name LIKE '_%';
END $$

DELIMITER ;

#Calling Procedure
CALL get_emps();

#Creating another procedure
DELIMITER $$
CREATE PROCEDURE Title()
BEGIN
SELECT a.Name, IFNULL(b.Title, 'No Book Found') AS Title FROM books AS b
RIGHT JOIN authors AS a
ON a.AuthorID = b.Authorid;
END $$
DELIMITER ;

#Calling procedure Title
CALL title;

/*
HOW TO CREATE STORED PROCEDURE?
1. Use database where we want to Create Procedure
2. DELIMITER $$ or // SET SOME NEW DELIMITER
3. CREATE PROCEDURE NAME()
4. BEGIN
5. WRITE THE QUERY;
6. END $$ or // THE DELIMITER WE CREATED
7. DELIMITER ; SET THE DELIMITER TO DEFAULT ; SEMI-COLON
8. CALL NAME(); CALL THE PROCEDURE
*/

#---To See what PROCEDURES we have, we can under database and STORED PROCEDURE or WE CAN USE SHOW PROCEDURE STATUS;---
SHOW PROCEDURE STATUS;

#CREATING ANOTHER PROCEDURE
SELECT * FROM myemp WHERE `EMP_ID` = 102;

DELIMITER $$
CREATE PROCEDURE getemp(IN id INT) #IN means INPUT BOX. Giving some name as ID. Data-Type INT or INTEGER
BEGIN
	SELECT * FROM myemp WHERE `EMP_ID` = id; #HERE WE ARE USING THAT id WE CREATED IN PROCEDURE.
END $$
DELIMITER ;

CALL getemp(115); #Give any ID no. it will show that row/record from data.

CALL title();

CALL get_emps();


#Creating another procedure
DELIMITER $$
CREATE PROCEDURE getsal(IN id INT) #IN means INPUT BOX. Giving some name as ID. Data-Type INT or INTEGER
BEGIN
	SELECT Salary FROM myemp WHERE `EMP_ID` = id; #HERE WE ARE USING THAT id WE CREATED IN PROCEDURE.
END $$
DELIMITER ;

CALL getsal(100);
#NOTE: Instead of using CALL to get Procedure that we created, WE CAN SIMPLE CLICK ON STORED PROCEDURE UNDER DATABASE THEN SELECT PROCEDURE AND RUN IT (IT HAS THUNDER BUTTON)