USE main;

#---CONSTRAINT'S or DOMAIN CONSTRAINT'S---

#---Constraint UNIQUE---
CREATE TABLE DUMMY(ID INT UNIQUE); #Creating Table name DUMMY. Giving Column Name as ID and its Data-Type as INT (INTEGER) and using UNIQUE Constraint.

#Two techniques to Describe the table
DESCRIBE dummy; 
DESC dummy; 
#Field/Attribute/Column is giving Table column Name.
#Type indicates Data-Type of that column.
#Null means Null values can be given in that column
#Key indicated Constraint that we give here it shows UNI means UNIQUE Constraint we gave.
#Default, in here it shows NULL means no Default Constrain we gave.
#Extra means NO EXTRA INFORMATION WE GAVE.

SELECT * FROM dummy;

INSERT INTO dummy VALUES(1); #Inserting 1 value

SELECT * FROM dummy;

INSERT INTO dummy values(2),(3),(4),(5); #Inserting multiple values

SELECT * FROM dummy;

#---Constraint NOT NULL--- In Whichever Column we are using NOT NULL Constraint that Column should not have NULL VALUES/MISSING VALUES.
CREATE TABLE DUMMY2(ID INTEGER, Name VarChar(15) NOT NULL); #Creating Table name DUMMY2. Giving Column Name as Name and its Data-Type as VarChar and using NOT NULL Constraint.

INSERT INTO dummy2 VALUES(6, 'John');

SELECT * FROM dummy2;

#Inserting Values in Particular Column from Table
INSERT INTO dummy2(ID) VALUES(7),(8); #Error Because we are not giving any Name or values into NAME COLUMN as its NOT NULL Column.

INSERT INTO dummy2(ID,NAME) VALUES(7, 'Soniya'),(8,'Ruheena'); #Here we also giving value to NOT NULL Column which is Name.

SELECT * FROM dummy2;

INSERT INTO dummy2(Name) VALUES('Shaheen'); #We can give values to Name column which is NOT NULL and give Null to ID Column as its not compulsory to give.

SELECT * FROM dummy2;


#---Constraint CHECK---
#Check Constraint can be used to maintain consistent data in our database. Using Check we are giving a Condition to column.
CREATE TABLE dummy3(Age INT CHECK(Age>18)); #Here we are Creating column called as Age which Data-Type is INTEGER and Check(AGE>18) means Age value that we give
											#should be Greater than 18.
                                            
INSERT INTO dummy3 VALUES(17); #We cannot give Age values <= 18

INSERT INTO dummy3 VALUES(19),(20),(23); #Age values should be Greater > than 18 as we give CHECK Constarint saying accept only those AGE values where age is > 18.

SELECT * FROM Dummy3;


#---Constraint DEFAULT---
#DEFAULT Constraint can be used if we don't give any values then by DEFAULT it is going to give some value.
CREATE TABLE dummy4(ID int, `Name` Varchar(20), Course VARCHAR(30) DEFAULT('Data Science')); 
#IF Course Column value is not given then by DEFAULT or AUTOMATICALLY it will give 'Data Science' Value.

INSERT INTO dummy4(ID,NAME) VALUES(1,'Khan'),(2,'Adi'); #WE ARE NOT GIVING COURSE COLUMN VALUES SO BY DEFAULT CONSTRAINT IT WILL TAKE COURSE VALUE AS 'DATA SCIENCE'

SELECT * FROM dummy4;

INSERT INTO dummy4 VALUES(3,'Suhana','Data Analyst'),(4,'Saniya','SQL'); #HERE WE ARE GIVING THE COURSE NAME's or VALUES 

SELECT * FROM dummy4;


SHOW TABLES; #Show's all the Tables names we have in Database we are working on.


#--Task: Create new table called Students---

/*#     ---NOTE: We can have MULTIPLE CONSTRAINTS FOR COLUMN. FOR EX: Email Column or Phone No. Field UNIQUE NOT NULL
#		 		 While for Primary Key (PK) we can ONLY HAVE 1 PK for a COLUMN. WE CANNOT GIVE PK FOR MULTIPLE COLUMNS in our TABLE.
#		  		 Each table can only have ONE Primary Key*/	

CREATE TABLE Students(ID integer unique, `Name` varchar(20) NOT NULL, Age int CHECK(age>=18), Course VarChar(30) DEFAULT('Data Science'));
#ID should have UNIQUE values, Name should not be NULL VALUE, Age should be >= 18, Course value not given then by DEFAULT it will take 'Data Science', 

ALTER TABLE students #Adding new column called as Fees.
ADD COLUMN Fees decimal(7,2); #Fees column should have 7 total values where 2 are decimals/fractions.


INSERT INTO students(ID,Name,Age,Fees) VALUES(1,'Samar', 18, 50000); #By DEFAULT or AUTOMATICALLY it give COURSE VALUE as 'Data Science'.

SELECT * FROM students;

INSERT INTO students VALUES(2,'Hasan',25,'SQL',30000),(3,'Sona',21,'Java',45000),(5,'Cris',26,'Tableau',30000.75),(4,'Sara',19,'Data Analytics',50000);

SELECT * FROM students;

#---NORMALIZATION Means converting Raw data into Tabular form in rows and column. Using Normalization methods we convert raw data into tables.---

#--FOREIGN KEY (One of the Constraint) is the PRIMARY KEY of some other Table.---
#Dependent Table is called as Child (which has Foreign Key) while Independent Table (Which has Primary Key) who has same column in Dependent Table is called as Parent.
