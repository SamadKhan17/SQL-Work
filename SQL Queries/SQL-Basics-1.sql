#Basic SQL Commands/Queries

create database School; #creating database called as School. we can use caps or small letter for commands (create or database) as its NOT case sensitive.
-- Databases we have can be SEEN on SCHEMAS on left-side down.
-- In MySQL we have to end every query (create database School) with a semi-colon. this ;
-- After executing query to see the database which we created we have to CLICK on REFRESH BUTTON on RIGHT-SIDE of SCHEMAS which is located on TOP-LEFT CORNER.
-- NOTE: We cannot create database with just numeric values. either text or text with numeric
-- To EXECUTE query/statement we can use Thunderbolt icon above or CTRL+ENTER

-- school is a database and the items that are present in database such as tables or views or functions etc are called as Database Objects.

use school;  #accessing the database
-- use is command, school is database name
-- Now we are using school database, we can see on SCHEMAS that school database becomes BOLDER, indicating we will be using that particular database for further queries.

select 'Welcome to the session'; #Column name will be 'Welcome to the session' and also the row value 'Welcome to the session'

select 'Welcome to the session' as message; #'Welcome to the session' is row and its column is message. as means alias (like another name).

select 'Welcome to the session'  message; #If we don't give as it will consider message as a column.

#Creating multiple columns with its rows or records values
select 'Welcome to the session' as message, 'all of you' as audience, 50 audience ; #if we are using characters then only we should use '' quotation. after as give column name.
-- select command is DQL (Data Query Language) 'Welcome to the session' is a text or value or row or record or observation its string and message is its column name.
-- anything we want in text then only put in '' quotation otherwise numeric values should not be in quotation.

select 1+3; #if we do this then 1+3 will be column name and total of it 1+3 = 4 will be value or row
select 1+3 as sum;  #1+3 = 4 will be row or value and sum will be column name
Select 1+3 sum;
SELECT 1+3 'sum';

#Creating Table inside school database
create table students(sid int, name char(30), age int, course char(30));
#creating table & giving the table name as students(inside table we gave column names & there data type)
#sid (student ID) integer, name character of name max value is (30), age column integer, course column and its max letters/characters are (30));
#Now if we click on database school in SCHEMAS we can see Tables in that we can see students table is created with all the column names.

select * from students; 
#select * (in SQL * means everything/all) from students (table); #we will get table with their columns name and rows if created.

insert into students values(1,'Ram',26,'Tableau');
#insert is a command. 
#inserting row/values into students table and give values(student ID or sid 1, name is 'Ram', age is 26, course column first value/row is 'Tableau');

select * from students; #To see if we inserted the row/values in students tables or not	

insert into students values(2,'Satish',27,'MySQL'); #inserting another row or 2nd obervation/record or inserting the data/information

select * from students; #show everything from students table. rows columns everthing.

show databases; #shows all the databases we have. shows all databases names we have.

#-----------------------------------------------------------------------------------------------------------------

-- PRACTICE/HOMEWORK --

create database Top_5_movies;

use Top_5_movies;

create table Movies(Released_Year year, Movie char(50), Director varChar(50), Rating float(2,1)); 
#Year data type will only take 4  digit as input like year 2024 etc 
#float data type can be further specified how many numbers we want in that columns. float(2,1) means total 2 numbers and 1 decimal number.

insert into movies values(2023,'Jawan','Atlee',4.4333); #As we can see its float data type is not showing 4.4333 only limited to 2 numbers, 4.4
insert into Movies values(2022,'Pathan','Aditya',3.2);
insert into MoviEs values(2012,'Tiger','Kabir',4.1);
insert into MovIEs values(2010,'My Name is Khan','Karan Johar',4.8);
insert into MoVIEs values(2015,'Bajrangi Bhaijaan','Kabir',4.5);

select * from movies;
 
 
 #NOTE: TYPES OF WAYS TO WRITE COMMENTS #Three-Types are there:
 
 #1) First is using # (Hashtag) for one single sentence.
 
 -- 2) Second is -- (Hyphen Hyphen) for one single sentence.
 
 /* 3) we can use this for writing comments in two lines 
 like this we don't neet to put # or -- again and again*/
 
