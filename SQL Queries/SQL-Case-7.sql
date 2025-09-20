USE main;

SELECT * FROM authors;

SELECT * FROM authors
WHERE name LIKE 'J%';  #All rows where Name column has starting letter with J to infinity characters. LIKE, NOT LIKE ARE WILD CARDS.

SELECT * FROM authors
WHERE name NOT LIKE 'J%'; #All rows where Name column NOT start from J.

SELECT * FROM authors 
WHERE Name IS NULL; #All rows where name column has NULL values.

SELECT * FROM authors 
WHERE Name IS NOT NULL; #All rows where name column DO NOT HAVE NULL values.

SELECT * FROM authors
ORDER BY Name; #A to Z for characters.

SELECT * FROM authors
ORDER BY Name DESC; #Z to A for characters.

#Imported new data from Wizard
SELECT * FROM nullpractice;

SELECT * FROM nullpractice 
WHERE Ship_Mode IS NULL; #All rows where ship_mode is null or missing values present

SELECT * FROM nullpractice
WHERE ship_mode IS NOT NULL; #All rows where ship_mode column has no null or missing values

#ISNULL
SELECT *, isnull(ship_mode) AS CheckingNull FROM nullpractice; #Create new column called CheckingNull, if null values is there it will show 1 or not there then 0.

SELECT SUM(ISNULL(ship_mode)) AS CheckingNull FROM nullpractice; #Total Null values present in Ship_mode column is 4.

#IFNULL
SELECT *,IFNULL(ship_mode,'Yes, There is Null Value.') AS Findings FROM nullpractice; #If null values is there it will say, 'Yes, There is Null Value.'
 
#Null
SELECT * FROM nullpractice
WHERE ship_mode IS NULL;

#---COALESCE FUNCTION--- PRONOUNCE as KOH-LES
#COALESCE tries to identifies first column/attribute/field NON-NULL VALUES means No Null Value.

SELECT *, COALESCE(ship_mode,segment) FROM nullpractice; #If ship_mode column has null value it will show us the value of segment column.
														 #If both has Null Values then it will show us Null Value present.
SELECT *, coalesce(ship_mode) FROM nullpractice; 

SELECT *, coalesce(Segment,State,region) FROM nullpractice; 
#First it will try to show us Segment values if its null then it will try to show us State value, if state column also has null in that row then it show us region column value
#if those 3 columns have null then it will shows us Null means Null Value is Present.

SELECT *, coalesce(State,Segment,ship_mode) AS Findings FROM nullpractice; 

#---Creating a Table---

CREATE TABLE CasePractice(Emp_ID INTEGER PRIMARY KEY, Salary INT);

INSERT INTO Casepractice VALUES(101, 90),
(102,87),(103,84),(104,83),(105,50),(106,86),(107,65),(108,95),(109,92),(110,82),(111,72),(112,66),(113,97),(114,86),(115,72);

DESCRIBE casepractice;

SELECT * FROM casepractice;

ALTER TABLE casepractice
	RENAME COLUMN Salary TO Salary_in_K; #Renaming/changing name of Salary to Salary_in_K
    
SELECT * FROM casepractice;

#--We want a NEW COLUMN Name TYPE, where Salary >=90 is treated as High and Salary >=70 is Medium and Anything else or salary >=50 is treated as Low.--
#Using CASE to categorised values.

SELECT *,
	CASE WHEN salary_in_k >= 90 THEN 'HIGH' #When salary column has values >= 90 then call it as 'HIGH'
		WHEN salary_in_k >=70 THEN 'MEDIUM'
		ELSE 'LOW'
	END AS Type1  							#giving the name Type1
    FROM casepractice; #Now we can EXPORT THIS DATA.
    
#PRACTICE/CHALLENGE
#Bonus for Salary < 70K is 10K
#For salary >= 70K to 90K < is 8K Bonus
#>=90K Salary get 5K bonus and GIVE THE COLUMN NAME AS Total_Salary AND COMBINE BONUS WITH SALARY

SELECT *,
	CASE WHEN Salary_in_k <=70 THEN 10
    WHEN Salary_IN_K BETWEEN 70 AND 89 THEN 8
    WHEN salary_in_k >= 90 THEN 5
    END AS Total_Salary
    FROM casepractice;	

#Another way
SELECT *,
	CASE WHEN Salary_in_k <=70 THEN Salary_in_k + 10
    WHEN Salary_IN_K BETWEEN 70 AND 89 THEN Salary_in_k + 8
    WHEN salary_in_k >= 90 THEN Salary_in_k + 5
    END AS Total_Salary
    FROM casepractice;	

#ChatGPT.    
SELECT *,
	Salary_in_k + CASE WHEN Salary_in_k <=70 THEN 10
    WHEN Salary_IN_K BETWEEN 70 AND 89 THEN 8
    WHEN salary_in_k >= 90 THEN 5
    END AS Total_Salary
    FROM casepractice;	    
    
    
#Salary => 90 5% Bonus, =>70K 8% Bonus, else or <70K 12% Salary Hike Bonus

SELECT *,
	CASE WHEN Salary_in_k >= 90 THEN Salary_in_k * 1.05 #5%
    WHEN Salary_in_K >=70 THEN Salary_in_K * 1.08 #8% Salary Hike
    ELSE Salary_in_K * 1.12 #12% Bonus
    END AS Bonus_Total_Salary
	FROM casepractice;
		
#Using 2 Cases, Types High, Medium, Low and Bonus Salary 10K, 8K, 5K       

SELECT *,
	CASE WHEN salary_in_k >= 90 THEN 'HIGH' #When salary column has values >= 90 then call it as 'HIGH'
		WHEN salary_in_k >=70 THEN 'MEDIUM'
		ELSE 'LOW'
	END AS Type1,  							#giving the name Type1
    CASE WHEN Salary_in_k <=70 THEN Salary_in_k + 10 #new case
    WHEN Salary_IN_K BETWEEN 70 AND 89 THEN Salary_in_k + 8
    WHEN salary_in_k >= 90 THEN Salary_in_k + 5
    END AS Total_Salary
    FROM casepractice; #Now we can EXPORT THIS DATA and DO VISUALIZATION.
    

#Giving 5%, 8%, 12& Salary Hikes and as well as Types of Salary High, Medium, Low.
SELECT *, 
	CASE WHEN Salary_IN_K >= 90 THEN Salary_IN_K * 1.05
    WHEN Salary_IN_K >= 70 THEN Salary_IN_K * 1.08
    ELSE Salary_IN_K * 1.12
    END AS Total_Salary_Bonus,
    
    CASE WHEN Salary_IN_K >= 90 THEN 'HIGH'
    WHEN Salary_IN_K >= 70 THEN 'MEDIUM'
    ELSE 'LOW'
    END AS Types1
    
    FROM casepractice;
    