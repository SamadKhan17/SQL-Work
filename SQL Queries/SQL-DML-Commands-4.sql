-- Practice DML Commands--
#DML Commands Insert Delete Update is going to work on Rows/Records/Observation. Values/Datapoint will be updated or changed using Update Command.
#Creating NEW DATABASE TO PRACTICE DML COMMANDS

create database db5;

use db5;

-- Create a table for practice
CREATE TABLE employees (
    employee_id INT PRIMARY KEY, #PRIMARY KEY means that column (employee_id) should not have any Null or Missing value Present and EACH VALUE SHOULD BE UNIQUE or DIFFERENT
    first_name VARCHAR(50),      #FROM EACH OTHER. for ex; if we give 1 then 1 value should not repeat on another row for that column.
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

/*What is a Constraint?
A constraint is a rule applied to columns in a database table to enforce data integrity. 
Constraints help ensure that the data entered into the table is accurate and reliable.

TYPES OF CONSTRAINTS:
PRIMARY KEY: A constraint that uniquely identifies each row in a table. It ensures that the column(s) cannot have NULL values and each value must be unique.

FOREIGN KEY: A constraint that establishes a link between the data in two tables. 
It ensures that values in one table match values in another table, maintaining referential integrity.

UNIQUE: A constraint that ensures all values in a column are unique. Unlike a primary key, it allows NULL values, but each non-null value must be unique.

NOT NULL: A constraint that ensures a column cannot have NULL values. Every row must have a valid value for this column.

CHECK: A constraint that ensures values in a column meet a specific condition or criteria. For example, 
a CHECK constraint might enforce that a numeric value must be greater than zero.
EX: Ensures that Age in a persons table must be greater than 0.

DEFAULT: A constraint that provides a default value for a column if no value is specified during row insertion.

INDEX: Although not a constraint in the strictest sense, an index is often used to improve query performance by creating a data structure that allows for faster 
retrieval of rows.

*/




-- Insert some sample data
INSERT INTO employees (employee_id, first_name, last_name, department, salary) 
VALUES 
(1, 'John', 'Doe', 'IT', 60000.00),
(2, 'Jane', 'Smith', 'HR', 55000.00),
(3, 'Alice', 'Johnson', 'Finance', 62000.00),
(4, 'Bob', 'Williams', 'IT', 58000.00);


-- Select all emp
SELECT * FROM employees;

set sql_safe_updates = 0; #0 to update/delete and 1 to not use these update/delete command anymore. This the command we use whenever we want to use DML Commands such as Update Delete etc Especially Update Delete i think. will do more research.

-- Update an employee's salary
UPDATE employees
SET salary = 63000.00
WHERE employee_id = 1;

SELECT * FROM employees;


-- fixing error.. for this use set sql_safe_updates=0

-- Delete an employee
DELETE FROM employees
WHERE employee_id = 4; #Deleting/Removing 4th ID row.

SELECT * FROM employees;

-- Insert a new employee
INSERT INTO employees (employee_id, first_name, last_name, department, salary) 
VALUES 
(5, 'Emily', 'Davis', 'Marketing', 60000.00);

-- Select all employees after modifications
SELECT * FROM employees;

-- Practice Exercises:
-- 1. Increase the salary of all employees in the IT department by 10%.
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT';

SELECT * FROM employees;

-- 2. Change the department of employee with ID 3 to "Operations".
UPDATE employees
SET department = 'Operations'
WHERE employee_id = 3;

SELECT * FROM employees;

-- 3. Delete all employees whose salary is less than 55000.
DELETE FROM employees
WHERE salary <= 55000.00; #Deleting rows where Salary <= 55000

SELECT * FROM employees;

-- 4. Insert a new employee with an ID of 6, first name "Michael", last name "Brown", department "Finance", and salary 65000.
INSERT INTO employees (employee_id, first_name, last_name, department, salary) 
VALUES 
(6, 'Michael', 'Brown', 'Finance', 65000.00);

SELECT * FROM employees;

-- 5. Select the first name and last name of all employees whose salary is greater than 60000.
SELECT first_name, last_name
FROM employees
WHERE salary > 60000.00;

/*
-- 6. Update the salary of the employee with the highest salary to 70000.
UPDATE employees
SET salary = 70000.00
WHERE salary = (SELECT MAX(salary) FROM employees);
*/
SELECT * FROM employees;

-- 7. Delete all employees from the IT department.
DELETE FROM employees
WHERE department = 'finance';

SELECT * FROM employees;

-- 8. Insert a new employee with an ID of 7, first name "Sophia", last name "Lee", department "IT", and salary 62000.
INSERT INTO employees (employee_id, first_name, last_name, department, salary) 
VALUES 
(7, 'Sophia', 'Lee', 'IT', 62000.00);

SELECT * FROM employees;

SELECT * FROM employees WHERE employee_id IS NOT NULL; #Gives us the data WHERE EMPLOYEE_ID COLUMN DO NOT HAS NULL OR MISSING VALUES. 

SELECT * FROM employees WHERE employee_id IS NULL; #Gives us the data WHERE EMPLOYEE_ID COLUMN HAS NULL OR MISSING VALUES.


#Modifying/Changing the location of Column/Field/Attribute

ALTER TABLE employees #Modifying table TableName
	MODIFY COLUMN employee_id INT AFTER department; #MODIFY COLUMN employee_id INT (DataType of Column) AFTER department (column); 
    
SELECT * FROM employees;


ALTER TABLE employees 
	MODIFY COLUMN employee_id INT FIRST; #Changing the Location of employee_id location to FIRST COLUMN in TABLE

SELECT * FROM employees;


#---Giving 5% or 0.05 BONUS TO EMPLOYEES USING SALARY COLUMN AS ITS NUMERIC COLUMN---

SELECT *,Salary*0.05 FROM employees; #,ColName*0.5 (5%) IT WILL CREATE WHOLE NEW COLUMN CALLED AS Salary*0.05 AS WE DID NOT GAVE NAME TO COLUMN
#AND THE COLUMN WILL BE VISIBLE FOR THIS QUERY ITSELF IT WILL NOT BE STORED PERMANENTLY ON OUR TABLE. ITS TEMPORARY.

SELECT * FROM employees;

SELECT *,Salary*0.05 'Bonus5%' FROM employees; #HERE GIVING NAME TO COLUMN AS Bonus5% 

SELECT *,Salary*0.05 as 'Bonus5%' FROM employees; #WE CAN ALSO GIVE COLUMN NAME BY CODING AS BEFORE COLUMN NAME

#--- Giving Multiple Bonus in SINGLE QUERY---

SELECT *,Salary*0.05 'Bonus5%', Salary*0.10 as 'Bonus10%' FROM employees; #5% or 0.05% Bonus and 10% or 0.10% Bonus

SELECT *,Salary*0.05 'Bonus5%', Salary*0.10 as 'Bonus10%', Salary+Salary*0.05 as TotalSalary FROM employees; #TOTAL SALARY OF EMPLOYEE WITH 5% or 0.05% HIKE

SELECT * FROM employees;


#---TOTAL SALARY OF ALL EMPLOYEES OR USERS COMBINED---
 
SELECT sum(salary) from employees; #SUM() FUNCTION. SUM means TOTAL. Total Salary of all Employees. SUM(NUMERIC COLUNM NAME)

SELECT sum(salary) as Total_Salary from employees; #Giving column name as Total

SELECT sum(salary) Total_Salary from employees; #Another way to give column name. (not writing AS)

SELECT sum(salary) 'Total_Salary' from employees; #We can also use QUOTATION ('') to write COLUMN NAME.