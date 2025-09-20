USE main;

SELECT * FROM Authors;

SELECT * FROM authors
WHERE authorid IN (4,5); #All data where Rows which are having ID of 4 and 5.

SELECT * FROM myemp;

#--- Select Full Name and their Salary ---

SELECT First_Name,Last_Name,Salary FROM myemp;

SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, Salary FROM myemp; #USING CONCAT. '' means CONCAT/JOINING both columns, First_Name and Last_Name.

#--- Full Name and their salary for those who are from Dep_ID 50 ---

SELECT CONCAT(First_name, ' ' , last_name) AS Full_Name, Salary FROM myemp
WHERE dep_id = 50;

SELECT CONCAT(First_name, ' ' , last_name) AS Full_Name, Salary, dep_id FROM myemp
WHERE dep_id = 50;

#--- Full Name and their salary for those who are from Dep_ID 50 Who earn more than 5K ---

SELECT CONCAT(First_Name, ' ' , Last_name) AS Full_Name, Salary, dep_id FROM myemp
WHERE dep_id = 50 AND salary > 5000;

#--- How many Departments are there? ---

SELECT DISTINCT(dep_id) FROM myemp;

SELECT COUNT(DISTINCT(dep_id)) FROM myemp; #TOTAL DIFFERENT CATEGORIES OR UNIQUE VALUES PRESENT.

#--- Find Total Salary for each Department ---

SELECT sum(salary) AS Total_Salary, dep_id FROM myemp
	GROUP BY dep_id;

#---Second Highest Salary ---

SELECT * FROM myemp
	ORDER BY salary DESC LIMIT 1,1;

SELECT * FROM myemp
	ORDER BY salary DESC;
    
#--- Average Salary of Each Department ---
    
SELECT AVG(salary) AS Average_Salary, dep_id FROM myemp
	GROUP BY dep_id ORDER BY Average_Salary DESC;
    
#--- Find Total Salary using Aggregration Functions Sum,Max,Min,Count,AVG ---

SELECT SUM(Salary) AS Total_Salary, COUNT(*) AS Count, MAX(Salary) AS Max_Salary, MIN(Salary) Min_Salary, AVG(Salary) AS Avg_Salary FROM myemp;
# * in COUNT means EVERY ROW/RECORD. Here Count Column showing 106 means 106 rows are there in the Table myemp.

#Grouping by Deparments
SELECT SUM(Salary) AS Total_Salary,
 COUNT(*) AS Count,
 MAX(Salary) AS Max_Salary,
 MIN(Salary) Min_Salary,
 AVG(Salary) AS Avg_Salary, dep_id FROM myemp
GROUP BY dep_id;

#--- How Many records we have---
SELECT COUNT(*) FROM myemp; #106 rows

#--- How Many records we have for every deparment---

SELECT COUNT(*), dep_id FROM myemp
GROUP BY dep_id; #90 Department we have 3 rows, 50th Department we have 45 rows/records.


#---Round(), Removing decimals/fractions from numeric values---

SELECT SUM(salary) AS Total_Salary, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, AVG(salary) AS Avg_Salary, dep_id FROM myemp
GROUP BY dep_id; #NOT APPLIED ROUND

SELECT SUM(salary) AS Total_Salary, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, ROUND(AVG(salary),0) AS Avg_Salary, dep_id FROM myemp
GROUP BY dep_id;  #APPLIED ROUND() TO Avg_Salary and removed unnecessary decimals/fractions. 0 in round means we want 0 or NO DECIMALS/FRACTIONS VALUES.

SELECT SUM(salary) AS Total_Salary, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, ROUND(AVG(salary),2) AS Avg_Salary, dep_id FROM myemp
GROUP BY dep_id;  #We want 2 decimals/fraction values for Average_salary column


#--- All rows/data where salary is between 15K to 20K---

SELECT * FROM myemp;

SELECT * FROM myemp
WHERE salary BETWEEN 15000 AND 20000; #Using BETWEEN, AND OPERATOR. Between is used for Range of Values, can be used only on Numeric columns.


#---All rows where First Name starts with 'Ne"---

SELECT * FROM myemp 
WHERE First_Name LIKE 'Ne%';

#---All rows where First Name should not start with 'Ne'---

SELECT * FROM myemp
WHERE First_name NOT LIKE 'Ne%';

#---Null/Missing Values---

SELECT * FROM myemp WHERE salary IS NULL; #All Data in Column Salary where its having Null or Missing values.

SELECT * FROM myemp WHERE salary IS NOT NULL; #All Data in Column salary where its NOT having Null or Missing values.

#---ORDER BY on Character's type of data---

SELECT * FROM myemp
ORDER BY First_name; # A to Z.

SELECT * FROM myemp
ORDER BY First_name DESC; # Z to A.

SELECT * FROM myemp 
ORDER BY First_Name LIMIT 1,1; #SECOND ROW FROM A to Z Order.

SELECT * FROM myemp 
ORDER BY First_Name DESC LIMIT 2,1; #THIRD ROW FROM Z to A Order.
