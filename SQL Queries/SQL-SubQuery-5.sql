#SUB-QUERY means within a QUERY another QUERY. (2 Query's in 1 Query)

USE practice3;

SELECT * FROM store;

/*DISTINCT means Unique Values
The SQL DISTINCT keyword is used to retrieve unique values from a specified column or set of columns in a database table*/

SELECT distinct Ship_Mode from store; #Distinct() FUNCTION gives us or retrieve UNIQUE VALUES/CATEGORIES present in a COLUMN.

SELECT DISTINCT(Regions) FROM store; #4 types of UNIQUE values is present in Regions COLUMN.


#---SUM(), MAX(), MIN() can be called as AGGREGATES. AND IT SHOULD ONLY BE USED ON NUMERICAL COLUMNS---

SELECT max(Profit) as Maximum_Profit, MIN(Profit) Minimum_Profit from store; #MAX() FUNCTION TO GET MAXIMUM OR BIGGEST VALUE PRESENT IN COLUMN.
																			 #MIN() FUNCTION TO GET MINIMUM OR SMALLEST VALUE PRESENT IN COLUMN.
      
      
#---Top Rows with Highest PROFIT---
SELECT * FROM STORE	ORDER BY Profit; #ORDER BY COLUMN NAME -> We will get Ascending Order, Small to Big.
SELECT * FROM STORE	ORDER BY Profit DESC; #ORDER BY COLUMN NAME DESC -> Use DESC to get Descinding Order, Big to Small
										  

#---TOP 2 Rows With Highest PROFIT---
SELECT * FROM Store ORDER BY PROFIT DESC LIMIT 2; #DESC LIMIT 2 -> TOP 2 ROWS WHICH ARE HAVING HIGHEST PROFIT(COLUMN).

SELECT * FROM STORE	ORDER BY Profit DESC;

#---FIRST HIGHEST PROFIT---
SELECT * FROM store ORDER BY PROFIT DESC LIMIT 0,1; #SKIP 0 ROWS, RETURN or SHOW 1 ROW

#---Second Highest PROFIT---
SELECT * FROM store ORDER BY profit DESC LIMIT 1,1; #DESC LIMIT Skip 1 ROW, Return 1 ROW;

SELECT * FROM STORE	ORDER BY Profit DESC;

#---Third and Fourth Highest PROFIT---
SELECT * FROM store ORDER BY profit DESC LIMIT 2,2; #Skip 2 rows, Return or Retireve or Show 2 rows

SELECT * FROM STORE	ORDER BY Profit DESC;

#---6th & 7th Highest PROFIT---
SELECT * FROM store ORDER BY profit DESC LIMIT 5,2; #SKIP 5 HIGHEST PROFIT ROWS, RETURN 2(6 and 7) HIGHEST PROFIT.
SELECT Profit FROM store ORDER by profit desc limit 5,2;

SELECT * FROM STORE	ORDER BY Profit DESC;

#---10th HIGHEST PROFIT---
SELECT * FROM store ORDER BY Profit DESC LIMIT 9,1; #SKIP ALL TOP 9 HIGHEST PROFIT, RETURN OR SHOW 1 (10th) ROW or HIGHEST PROFIT
select profit from store order by profit desc limit 9,1;

SELECT * FROM STORE	ORDER BY Profit DESC;


#---Top 3 Order_ID with Highest PROFIT---
SELECT Order_ID,profit FROM store ORDER BY PROFIT DESC LIMIT 3;

#---Top 3 Standard Class from Ship_Mode Column which are having HIGHEST PROFIT---
SELECT * from store #Select/Retrieving/Fetching All data
	WHERE Ship_Mode = 'Standard Class' #WHERE COLUMN HAS VALUES ONLY = 'Standard Class' 
									   #WE HAVE TO GIVE ''(QUOTATION) WHENEVER WE ARE TRYING TO ACCESS VALUE/DATAPOINT FROM A COLUMN. For EX HERE; 'Standard Class'
    ORDER BY PROFIT DESC LIMIT 3; #TOP 3 PROFITS
    
#--- Find ALL Row/Record/Observations for 4th Jan 2020---
SELECT * FROM store
	WHERE `Order_Date` = '04-01-2020';  #We are writing dates in ''(QUOTATION) BECAUSE Order_Date COLUMN DATA-TYPE is TEXT. iT SHOULD NOT BE TEXT.
    
Describe Store; #Describe Column names of our table and theri Data-Type


#---ETL (Extract Transform Load)---

#EXTRACT -> Extract or pull data from various sources such as web from url etc and explore data whose having more sales etc
#TRANSFORM -> Transforming/Converting Data-Type from int to small int or from text to varchar etc. Dealing with NULL or MISSING VALUES etc. CLEANING THE DATA.
#LOAD -> Load data into Bi-Tool do visualization of data, create charts or graphs based on requirements.


#---Find Profit accross Ship Mode (Total Profit of each Class present in Ship_Mode Column)---
SELECT DISTINCT(Ship_Mode) FROM store; #3 Types of Categories or Class type of Data present in Ship_Mode COLUMN/FIELD/ATTRIBUTE

#Doing one by one
SELECT sum(profit) FROM store WHERE ship_mode = 'Standard Class'; 
SELECT sum(profit) Total_Second_Class FROM store WHERE ship_mode = 'Second Class'; #Giving column name as Total_Second_Class
SELECT sum(profit) AS Total_First_Class FROM store WHERE ship_mode = 'First class';

SELECT sum(profit) FROM store; #Total Profit

#---Using GROUP BY KEYWORD---
/*The GROUP BY statement in MySQL is used to arrange identical data into groups.
 This is typically used with aggregate functions like COUNT, SUM, AVG, MAX, or MIN to perform a calculation on each group of data. Combine multiple parts together.

 FOR EX: 

SELECT column_name(s), aggregate_function(column_name)
FROM table_name
WHERE condition
GROUP BY column_name(s);
*/


SELECT Ship_mode, sum(profit) FROM store 
GROUP BY Ship_Mode;  #Grouping by Ship_Mode column. Ascending Order (small to big)

SELECT Ship_mode, sum(profit) FROM store 
GROUP BY Ship_Mode ORDER BY sum(profit) DESC; #Descending Order (big to small)


#---Find Profit accross Regions (Total Profit of each Region present in Regions Column)---
SELECT Regions, sum(profit) AS Total_Profit  FROM store 
	GROUP BY Regions;
		
SELECT Regions, sum(profit) AS Total_Profit  FROM store 
	GROUP BY Regions 
    ORDER BY sum(profit) DESC; #(Big to small)
	
    
/* Order on how to remember commands when to use
1. SELECT Columns or * (Everything)
2. FROM TableName
3. WHERE Clause we can give OR we can also Use HAVING instead of WHERE Clause
4. Grouping (Group By)
5. Order By and Limit */


#---Find Profit accross Regions on Jan 3rd 2020
SELECT * FROM store; 
SELECT Regions, sum(profit) AS Total_Profit FROM store
    WHERE Order_Date = '03-01-2020'
    GROUP BY Regions;    

#---Find Profit accross Regions on Jan 3rd 2020 in the State Texas
SELECT * FROM store;
SELECT Regions, sum(profit) AS Total_Profit FROM store
    WHERE Order_Date = '03-01-2020' AND State = 'Texas'
    GROUP BY Regions;    
    
    
#---Find Profit accross Regions on Jan 13th 2020 
SELECT * FROM store; 
SELECT Regions, sum(profit) AS Total_Profit FROM store
    WHERE Order_Date = '13-01-2020' 
    GROUP BY Regions;        
    
#---Find Profit accross Regions on Jan 13th 2020 in the State Louisiana
SELECT * FROM store; 
SELECT Regions, sum(profit) AS Total_Profit 
	FROM store
    WHERE Order_Date = '13-01-2020' AND State = 'Louisiana'
    GROUP BY Regions;

    
#---Only those Rows which consist values from Ship_Mode COLUMN class of First Class and Segment COLUMN Class of Corporate    
SELECT * FROM store
WHERE Ship_Mode = 'First Class' AND Segment = 'Corporate';
#Use = when you are filtering by a single value.

#---Only those Rows which consist values from Ship_Mode COLUMN class of First Class & Standard Class and Segment COLUMN Class of Corporate    
SELECT * FROM store
WHERE Ship_Mode IN ('First Class', 'Standard Class') AND Segment = 'Corporate';
#Use IN when you need to filter by multiple possible values in a column.


#---Creating NEW TABLE---

#After Data-Type EX; INT or VARCHAR(). All are called as Constraints. PRIMARY KEY, NOT NULL, UNIQUE, CHECK, DEFAULT 0 etc
CREATE TABLE EmployeesData(Employee_ID INT PRIMARY KEY,
							First_Name VarChar(50) NOT NULL, #NOT NULL: means this column should not have any missing or null values present.
                            Last_Name VARCHAR(50) NOT NULL, #NOT NULL: means no empty value should be present or else it will throw error
                            EMAIL VARCHAR(100) UNIQUE, #UNIQUE: Every value should be Unique or Different from each other. NOTE: It can have Null Values.
                            Hire_Date DATE, 
                            Department_ID INT,
                            CHECK (Hire_Date >= '2000-01-01'), #CHECK: It means we need to put Hiring date of a person greater than > 2001-01-01. Will throw error if we give
															   #1999-01-01 #Check is like Validating the Data.
                            Salary DECIMAL(10,2) DEFAULT 0); #DEFAULT: Means if values not given for this Salary Column, it should not be Null or Missing Values, it will
															 #take the value automically as 0 if value not given for this data.
                            
DESCRIBE Employeesdata; #Columns and their data types

SELECT * FROM employeesdata;	  

insert into EmployeesData values(1005, 'Raj', 'Kumar', 'raj443@gmail.com', '2020-02-01', 14, 65000);

#---Using TRUNCATE Command and Removing/Deleting ALL THE ROWS/OBSERVATION FROM OUR DATASET BUT NOT THE STRUCTURE OF DATA LIKE COLUMNS AND ITS DATA-TYPE.---
TRUNCATE EmployeesData;

SELECT * FROM employeesdata;	  

#Inserting VALUES into Table
insert into EmployeesData values(1005, 'Raj', 'Kumar', 'raj443@gmail.com', '2020-02-01', 14, NULL); #Giving Salary as NULL VALUE/ MISSING VALUE.

SELECT * FROM employeesdata;	  

insert into EmployeesData(Employee_ID, First_Name, Last_Name, Email, HIRE_DATE, Department_ID) #Naming Columns which we want to insert data into. To take advantage of DEFAULT Constraint
values(1006, 'Karan', 'Khanna', 'karan526@gmail.com', '2020-02-01', 14); #In Salary Column not we are not including any value so by DEFAULT it will the value of 0.
#As when we created Salary COLUMN we specified if Salary of a person is not given take value 0 by DEFAULT.

SELECT * FROM employeesdata;	  

SELECT * FROM employeesdata ORDER BY Salary DESC; #Descending order BIG TO SMALL VALUE. Ascending is SMALL TO BIG.
  
SELECT * FROM employeesdata ORDER BY Salary; #Ascending order SMALL TO BIG.

SELECT * FROM employeesdata ORDER BY Salary LIMIT 1,1; #Accesing 2nd row from our table. 1 skip row, 1 return or show row from table.

SELECT * FROM employeesdata;	  

insert into EmployeesData(Employee_ID, First_Name, Last_Name, Email, HIRE_DATE, Department_ID, Salary) 
values(1004, 'Surabhi', '', 'surabhi12@gmail.com', '2020-02-01', 13, 25000); #Not Giving any LAST NAME. its not NULL/MISSING VALUE as we are using '' or "" Quotation.
#Its Blank VALUE, not NULL or MISSING VALUE.

SELECT * FROM employeesdata;	  

insert into employeesdata values(1003, 'Ahmed', 'Hussain', 'ahmed894@hotmail.com', '2018-05-15', 13, 60000);

SELECT * FROM employeesdata;	  

insert into employeesdata values(1002, 'Sara', 'K H', 'Sara6874@hotmail.com', '2019-08-29', 15, 40000);

SELECT * FROM employeesdata; #In end we see NULL NULL for all columns, it means NOTHING TO SHOW. Its not null or missing value.

INSERT INTO employeesdata VALUES(1007, 'Sharvaria', 'Kumari', 'shar4477@yahoo.com', '2023-10-29', 16, 60000);

SELECT * FROM employeesdata;