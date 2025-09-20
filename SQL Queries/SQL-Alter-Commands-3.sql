-- Create DB and Table in thst DB

create database Practice3;

use Practice3;
	
create table Product(ProductID int, Name Char(50), Price float(8,2));

insert into Product values(101,'TV',500),
(102, 'Phone', 600),
(103, 'AC', 700),
(104, 'Refrigerator', 900),
(105, 'LED', 1100),
(106, 'Microwave', 1200),
(107, 'Laptop', 1800);

select * from product;


-- ALTER Command -- IT CAN BE USEFUL FOR ADD COLUMN, REMOVE COLUMN, DROP COLUMN, MODIFY DATA-TYPE OF COLUMN, RENAME COLUMN etc.
#ADDING NEW COLUMN/ATTRIBUTE/FIELD/VARIABLE/FEATURE/DIMENSION

alter table product #First We are altering this (product) table
add column Quantity int; #Adding new column in PRODUCT TABLE as Quantity and giving the data type Integer;

select * from product; #Now we can see in the table, NEW COLUMN is added using Alter Command


-- Rename Command --
#Renaming the already existing column in the table

Alter table product #Altering/modifying this table product
rename column quantity to Quant; #Changed the Quantity name column to Quant

select * from product; #Fetching the table		


-- Dropping Columns Command -- 
#Dropping/Deleting/Removing the already existing column in the table

alter table product
drop quant; #Dropping/Removing Quant Column/Attribute/Field

SELECT * from product;


-- Adding Multiple Column at once --
#Adding more than 1 column in single Query

alter table product
add column Quantity int, add column Quant int, add column Quants int; #add column and then ColumnName DataType;

Select * from product;


-- Renaming Multiple Column at once --
#Renaming more than 1 column in single Query

Alter table product #Altering/modifying this table product
rename column quantity to Quantity1, rename column Quant to Quant1, Rename Column Quants to Quants1; #Renaming multiple column name in single Query

select * from product; #Fetching the table		


-- Dropping Multiple Columns at once -- 
#Dropping/Deleting/Removing more than 1 column in the table in single Query

alter table product
drop Quantity1, Drop Quant1, DROP Quants1; #Dropping/Removing Multiple Column/Attribute/Field at once

SELECT * FROM PRODUCT;


-- Rename Table Name from DataBase(DB) --
#Renaming the already existing Table name

rename Table Product to Product1; #Rename Table Product to Product1 simple.

select * from product1; #Now we can see in the schemas in practice3 database in tables, the table name changed from Product to Product1		

-- Rename DataBase(DB) --
#Renaming the already existing Database

#RENAME DATABASE practice3 TO NewDatabaseName;

-- Modifying The DATA TYPE of a Column/Field/Attribute --
#Updating/changing data type of a already existing column in our table

ALTER TABLE product1 #Altering this table which we want to change or modify the data type
MODIFY COLUMN Name varchar(25); #Modifying/changing data type of column NAME from Char(25) previously to VarChar(25); we can see it in schemas database in table the data type of field. 

SELECT * FROM product1;

-- Dropping the DATABASE by Query if not using SCHEMAS and deleting their by Mouse --
#Drop database practice3;

-- Dropping the TABLE by Query if not using SCHEMAS and deleting their by Mouse --
#Drop Table Product1;
