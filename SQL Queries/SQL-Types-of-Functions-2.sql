#Types of Functions in SQL

select now(); #To view current Date & Time
select now() as CurrentTime ; #Giving column name as CurrentTime
select current_time(); #Shows current time according to our system
select current_date(); #Shows current date (yyyy-mm-dd)
select current_timestamp(); #Shows current date and current time

#-----------------------------------------------------------------------------------------------------------------

#Types of Date Functions we can use as Data Type for Column.
 
#1) Date: YYYY-MM-DD -- Can useful for D.O.B
#2) Datetime: YYYY-MM-DD H:M:S (Hours Min Seconds) -- Can be useful for Pateints Admission in Hospital
#3) Time: H:M:S 
#4) Year: YYYY
#5) Timestamp: it will use GMT.

-- We can use thess data type in table for particular column based on requirements.

#-----------------------------------------------------------------------------------------------------------------

#Types of fraction or decimals Data Type

#1)float - 4 bytes. we can also specify how many no. we want, for ex: ball price float(3,2) means 3 total number we can give and 1 decimal. 88.9 or 66.5
#2)double - 8 bytes. or double(2,1) 2 is total no. 1 is total decimal ex 4.2
#3)decimal - 16 bytes.  or decimal(4,1) 4 is total no. 1 is total decimal ex 365.2

#-----------------------------------------------------------------------------------------------------------------

#FUNCTIONS or COMMANDS

select date_format(now(), '%d-%m-%y'); #Changing the format instead of YYYY-MM-DD now its DD-MM-YYYY
select date_format(now(), '%y-%m-%d'); #YY-MM-DD

select DATEDIFF('2022-02-01', '2022-01-01'); 

select date_add('2022-01-01', interval 1 month);

select date_add('2022-01-01', INTERVAL 2 MONTH);

select concat('Hello', ' ', 'World'); #Concat is a function which will combine 2 words. For ex: if we have name column we can combine first and last name.

select concat('Hello', 'World');

select upper('hello'); #Convert all lower values to upper values

select lower('HElLo'); #Convert all upper case values to lower case

select length('heLLo'); #Tells about the lenght of the values. ex: 'hello' 5 words/values

