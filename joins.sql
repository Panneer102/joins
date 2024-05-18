

------------CREATE DATABASE and TABLES------------

CREATE DATABASE Organization;
USE Organization;

-- DROP DATABASE Organization;

------------Table 1-----------------
CREATE TABLE Department (
	Id INT PRIMARY KEY ,
	Name VARCHAR(30),
	Address VARCHAR(200)
);

INSERT INTO Department VALUES(1,'Panneer','16, vallalar Road, Trichy');
INSERT INTO Department VALUES(2,'Selvam','16/80, 15th Block, Rainbow Apartment, Chennai');
INSERT INTO Department VALUES(3,'Seetha','161, 1st floor OMR Road, Chennai');
INSERT INTO Department VALUES(4,'Murugan','32 villianur, pondicherry'); 


-- SELECT TABLE Department;

SELECT * FROM Department;


------------Table 2-----------------
CREATE TABLE Sales (
Id INT PRIMARY KEY ,
Name VARCHAR(30) NOT NULL,
salary INT,
DepartmentId INT,
CONSTRAINT FK_DepartmentId FOREIGN KEY(DepartmentId) REFERENCES Department(Id)
);

INSERT INTO Sales 
			VALUES
			 (1,'Ram',1000000,2),
			 (2,'Harini',2500000,1),
			 (3,'George',2000000,1),
			 (4,'Ramya',1300000,2),
			 (5,'Meena',2000000,3),
			 (6,'Ashok',3000000,2),
			 (7,'Abdul',2000000,4),
			 (8,'Ramya',1000000,4),
			 (9,'Raghu',8000000,3),
			 (10,'Arvind',2800000,3),
			 (11,'Akshay',1000000,3),
			 (12,'John',2200000,1),
			 (13,'Abinaya',2100000,1),
			 (14,'Vidya',2200000,1),
			 (15,'Ranjani',2100000,3)

SELECT * FROM Sales

------------Table 3-----------------
CREATE TABLE clients (
	Id INT PRIMARY KEY,
	Location VARCHAR(30) NOT NULL,
	Address VARCHAR(200) 
);

INSERT INTO clients 
			VALUES
			(1,'NewYork','25 10th Block'),
			(2,'Coimbatore','120 15th Block'),
			(3,'London','21 ABC Road')

SELECT * FROM clients

--------------------------JOINS-----------------------------------
-- Create the Cricket table
CREATE TABLE Cricket (
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

-- Create the Football table
CREATE TABLE Football (
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
)
--Inner Join: Retrieves rows that have matching values in both tables
SELECT *
FROM Cricket
INNER JOIN Football ON Cricket.Name = Football.Name


--Left Join (or Left Outer Join): Retrieves all rows from the left table (Cricket) and 
--the matched rows from the right table (Football)
SELECT *
FROM Cricket
LEFT JOIN Football ON Cricket.Name = Football.Name


--Right Join (or Right Outer Join): Retrieves all rows from the right table (Football) and 
--the matched rows from the left table (Cricket).
SELECT *
FROM Cricket
RIGHT JOIN Football ON Cricket.Name = Football.Name


--Full Outer Join (or Full Join): Retrieves all rows from both tables
SELECT *
FROM Cricket
FULL OUTER JOIN Football ON Cricket.Name = Football.Name


--Cross Join (or Cartesian Join): Produces the Cartesian product of both tables, meaning 
--it combines each row from the first table with every row from the second table
SELECT *
FROM Cricket
CROSS JOIN Football


--A self join is when a table is joined with itself

SELECT c1.name AS player1_name, c2.name AS player2_name, c1.age
FROM Cricket c1
JOIN Cricket c2 ON c1.age = c2.age
WHERE c1.name <> c2.name; -- Ensures we don't match a player with themselves

---------------------UNION vs UNION ALL---------------------

SELECT * FROM cricket
SELECT * FROM football

-- The UNION operator it removes duplicate rows from the combined result set.

SELECT * FROM cricket
UNION 
SELECT * FROM football;

-- UNION ALL which retains all rows, including duplicates.

SELECT * FROM cricket
UNION ALL
SELECT * FROM football;

----------ORDER BY----------

SELECT * FROM Sales
ORDER BY salary        -- order by salary asc

SELECT * FROM Sales
ORDER BY salary ASC    -- order by salary asc

SELECT * FROM Sales
ORDER BY salary DESC    -- order by salary desc

SELECT * FROM Sales
WHERE DepartmentId = 4
ORDER BY salary DESC   -- order the salary  in desc order by DepartmentId

SELECT * FROM Sales
ORDER BY salary,DepartmentId

----------ORDER BY----------

SELECT Name, AVG(salary) AS avg_salary
FROM Sales
GROUP BY Name     -- shows avg salary Group By Name  

SELECT Name, COUNT(Name) countvalue
FROM Sales
GROUP BY Name 

----------HAVING----------

SELECT Name,COUNT(Name) AS count -- using as for alias
FROM Sales
GROUP BY Name
HAVING COUNT(Name)>1 

SELECT Name,COUNT(Name) AS count
FROM Sales
GROUP BY Name
HAVING Name = 'Ramya'
ORDER BY Name;  


