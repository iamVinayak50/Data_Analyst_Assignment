-- 1. DataBase Created(assignments)
create database assignments;
use assignments;

-- 2. Create the tables from assignment_tables.sql and enter the records as specified in it. -- 
-- countries Table  --
create table countries (name varchar(50), population integer, capital varchar(25));
INSERT INTO countries VALUES("China",1382,"Beijing"),
("India",1326,"Delhi"),
("United States",324,"Washington D.C."),
("Indonesia",260,"Jakarta"),
("Brazil",209,"Brasilia"),
("Pakistan",193,"Islamabad"),
("Nigeria",187,"Abuja"),
("Bangladesh",163,"Dhaka"),
("Russia",143,"Moscow"),
("exico",128,"Mexico City"),
("Japan",126,"Tokyo"),
("Philippines",102,"Manila"),
("Ethiopia",101,"Addis Ababa"),
("Vietnam",94,"Hanoi"),
("Egypt",93,"Cairo"),
("Germany",81,"Berlin"),
("Iran",80,"Tehran"),
("Turkey",79,"Ankara"),
("Congo",79,"Kinshasa"),
("France",64,"Paris"),
("United Kingdom",65,"London"),
("Italy",60,"Rome"),
("South Africa",55,"Pretoria"),
("Myanmar",54,"Naypyidaw");

-- Add a couple of countries of your choice--
INSERT INTO countries VALUES("Belgium",78,"Brussuels");

-- Change ‘Delhi' to ‘New Delhi'--
SET SQL_SAFE_UPDATES = 0;
UPDATE countries
SET capital ="New Delhi"
WHERE name = "India";

-- Rename the table countries to big_countries .--
select* from countries;
ALTER TABLE countries RENAME big_countries;
select* from big_countries;

-- Create the following tables. Use auto increment wherever applicable--
CREATE TABLE Products (product_id SERIAL PRIMARY KEY, 
					   product_name VARCHAR(50) NOT NULL UNIQUE,
					   description VARCHAR(250),
					   supplier_id INTEGER);
					   
CREATE TABLE Suppliers(supplier_id SERIAL PRIMARY KEY,
					   supplier_name VARCHAR(50),
					   location VARCHAR(200));
					   
CREATE TABLE Stock(id SERIAL PRIMARY KEY,
				   product_id INTEGER NOT NULL,
				   balance_stock INTEGER);
                   
 -- Enter some records into the three tables. --
 INSERT INTO Products(product_name, description, supplier_id)
VALUES
('IPhone', 'IPhone is the best', 2),
('Redmi', 'Redmi is the best', 7),
('Samsung', 'Samsung is the best', 6),
('Iball', 'Iball is the best', 4),
('Sony', 'Sony is the best', 1);

INSERT INTO Suppliers(supplier_name, location)
VALUES
('Gary', 'CA'),
('David', 'NY'),
('Wil', 'OR'),
('Smith', 'IL'),
('Bruce', 'IN');

INSERT INTO Stock(product_id, balance_stock)
VALUES
(2,45),
(7,25),
(1,82),
(5,12),
(3,47);

-- Modify the supplier table to make supplier name unique and not null.--
ALTER table suppliers
modify supplier_name varchar(60) NOT NULL UNIQUE;

-- Modify the emp table as follows--
-- a. Add a column called deptno
-- b. Set the value of deptno in the following order
--   	       deptno = 20 where emp_id is divisible by 2
--   	       deptno = 30 where emp_id is divisible by 3
--   	       deptno = 40 where emp_id is divisible by 4
--   	       deptno = 50 where emp_id is divisible by 5
--   	       deptno = 10 for the remaining records.

-- emp table --
CREATE TABLE  emp(
   emp_no  int(11) NOT NULL,
   birth_date  date NOT NULL,
   first_name  varchar(14) NOT NULL,
   last_name  varchar(16) NOT NULL,
   gender  enum('M','F') NOT NULL,
   hire_date  date NOT NULL,
   salary  float(8,2) DEFAULT 7850.00
) ;

INSERT INTO  emp  VALUES (10012,'1960-10-04','Patricio','Bridgland','M','1992-12-18',3475.00),(10013,'1963-06-07','Eberhardt','Terkki','M','2020-02-23',7850.00);

drop table emp;
select* from emp;

ALTER TABLE emp ADD COLUMN deptno int;
UPDATE emp SET deptno = ( CASE
WHEN (emp_no % 2) THEN 20
WHEN (emp_no % 3) THEN 30
WHEN (emp_no % 4) THEN 40
ELSE 10
END);

-- Create a unique, index on the emp_id column
	CREATE UNIQUE INDEX uni_index ON emp(emp_no);
    
-- reate a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
select emp_no,first_name,last_name,max(salary) from emp
Group By emp_no
order by salary DESC;