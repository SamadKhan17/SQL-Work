#---Joins---
#JOINS is used to add/combine columns from 2 different table.

#---Append---
#APPEND is used for adding rows.

/*
1) INNER JOIN: Returns records that have matching values in both tables

-->OUTER JOIN's TYPE's: LEFT JOIN, RIGHT JOIN, FULL JOIN.

2) LEFT JOIN: Returns all records from the left table, and the matched records from the right table
3) RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
4) FULL JOIN (Maybe CROSS JOIN: Returns all records from both tables and matching information/data/rows from both tables.
*/


 USE main;
 
 #Creating Table 1
 CREATE TABLE Table1(Product_ID Char(2), Name VarChar(15));
 
 INSERT INTO table1 VALUES('A','TV'),('B','Phone'),('C','AC'),('D','Refrigerator'),('E','LED'),('F','Microwave');
 
 SELECT * FROM table1;
 
 #Creating Table 2
 CREATE TABLE Table2(product_ID Char(2), Price Double(6,2));
 
 INSERT INTO table2 VALUES('A',500),('B',600),('C',700),('D',900),('I',1100),('X',1200);
 
 SELECT * FROM table2;
 
 #Both above Table1 and Table2 have common/similar column/field/attribute which is Product_ID
 
 #---Inner Join or Join---
SELECT table1.product_id, table1.name, table2.price FROM table1 #LEFT TABLE is TABLE1
#SELECT columns we want from both TABLE's specify which Column is from which Table(name column is from table1 so Table1.name) then FROM Table1
INNER JOIN table2 #Inner join (or we can give just JOIN instead of INNER JOIN) on Table2. RIGHT TABLE is TABLE2.
ON table1.product_id = table2.product_id; #ON is keyword. ON product_id (similar/matching column or information which both tables have) 

#This query will return only those rows where there is a matching product_id in both table1 and table2.

#WE CAN ALSO GIVE TABLE2 first then join it with TABLE1 if we are using INNER JOIN
SELECT table1.product_id, table1.name, table2.price FROM table2 
INNER JOIN table1 
ON table2.product_id = table1.product_id; 

#WE CAN ALSO GIVE AS (ALIAS) TO WRITE SHORT NAMES FOR TABLE's
SELECT T1.product_id, T1.name, T2.price FROM table1 AS T1 #Giving short name AS T1
INNER JOIN table2 AS T2 #Giving short name AS T2 for Table2
ON T1.product_id = T2.product_id; 


#Creating Table 3 with Different COLUMN NAME but has SAME/MATCHING information in that COLUMN ID
 CREATE TABLE Table3(ID Char(2), Price Double(6,2));
 
 INSERT INTO table3 VALUES('A',500),('B',600),('C',700),('D',900),('I',1100),('X',1200);
 
 SELECT * FROM table3;
 
 
  #---Inner Join with DIFFERENT COLUMN NAME but has SAME INFORMATION ON BOTH DIFFERENT TABLE's on Product_ID COLUMN FROM TABLE 1 AND ID COLUMN FROM TABLE 3---
SELECT table1.product_id, table1.name, table3.price FROM table1 
#SELECT columns we want from both TABLE's specify which Column is from which Table(name column is from table1 so Table1.name) then FROM Table1
INNER JOIN table3 #Inner join on Table3
ON table1.product_id = table3.id; #ON is keyword. ON product_id (similar/matching column or information which both tables have) 


#Selecting/Fetching one column from table
SELECT table1.product_id FROM table1;

SELECT product_ID FROM table1;


#---LEFT JOIN---
SELECT table1.product_id, table1.name, table2.price FROM table1 #All the information of TABLE1
LEFT JOIN table2 #LEFT JOIN. Matching Information of TABLE2
ON table1.product_id = table2.product_id; 

SELECT * FROM table1;

#---RIGHT JOIN---
SELECT table1.product_id, table1.name, table2.price FROM table1 #Matching Information of TABLE1
RIGHT JOIN table2 #RIGHT JOIN. All the information of TABLE2
ON table1.product_id = table2.product_id; 

SELECT * FROM table2;

#---FULL JOIN (its NOT working so we will use UNION and Combine LEFT JOIN AND RIGHT JOIN to GET FULL INFORMATION/DATA OF BOTH TABLES AS WELL AS MATCHING INFORMATION/DATA)---
SELECT table1.product_id, table1.name, table2.price FROM table1 
LEFT JOIN table2 #LEFT JOIN
ON table1.product_id = table2.product_id
UNION #UNION
SELECT table1.product_id, table1.name, table2.price FROM table1 
RIGHT JOIN table2 #RIGHT JOIN 
ON table1.product_id = table2.product_id;

#===Interview Question: WHAT IS DIFFERENCE BETWEEN UNION AND UNION ALL?===
/*UNION: IF we have 2 tables from those 2 tables only Common data/values will return 1 time or once.
  UNION ALL: If we have 2 tables it will take all the values data from those 2 tables even the repeated data.

  UNION: Combines the results from two or more tables, returning only unique values. If there are duplicates, each distinct value appears only once.
  UNION ALL: Combines the results from two or more tables and includes all values, including duplicates.
  So, if you want to eliminate duplicates, use UNION; if you want to keep all occurrences, use UNION ALL.
*/

#Creating New Employees Table

CREATE TABLE Employees_Details(Emp_ID int UNIQUE, Name VarChar(25), Department Varchar(20) NOT NULL, Salary decimal(7,2), Manager_ID integer);

INSERT INTO employees_details(Emp_ID,Name,Department,Salary) VALUES(100, 'Hari', 'CEO', 25000); 	

SELECT * FROM employees_details;

INSERT INTO employees_details VALUES(101, 'Krishna', 'IT', 12000, 100),
									(102, 'Rahul', 'IT', 12000, 101),
                                    (103, 'Shyam', 'Sales', 10000, 105),
                                    (104, 'Preeti', 'Sales', 10000, 105),
                                    (105, 'Swathi', 'Sales', 10000, 100),
                                    (106, 'Priyanka', 'Marketing', 9000, 105),
                                    (107, 'Bhargav', 'HR', 9500, 109),
                                    (108, 'Chetan', 'HR', 9500, 109),
                                    (109, 'Ram', 'Finance', 10000, 100);
								
SELECT * FROM employees_details;

#Using Employee ID and Manager ID we want to find who is reporting to who?
#This is SELF JOIN. SELF JOIN means there is only 1 table to consider.
SELECT a.Name, b.Name as Reports_To FROM employees_details as a
LEFT JOIN employees_details b
ON a.Manager_ID = b.emp_id; #Connecting 2 columns

#Giving Condition
SELECT a.Name, b.Name as Reports_To FROM employees_details as a
LEFT JOIN employees_details b
ON a.Manager_ID = b.emp_id
WHERE a.Salary >10000;
 
									