CREATE DATABASE ORG


USE ORG

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);



INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001,'Monika','Arora', 100000,14-02-20,'HR'),
(002,'Niharika','Verma', 500000,11-08-22,'Admin'),
(003,'Vishal','Hegde', 200000,14-03-20,'HR'),
(004,'Amitabh','Singh', 100000,14-04-20,'Admin'),
(005,'Vivek','Bhati', 100000,14-05-20,'Admin'),
(006,'Vipul','Diwan', 100000,14-06-20,'Account'),
(007,'Satish','Kumar', 100000,14-06-20,'Account'),
(008,'Geetika','Chauhan', 100000,14-06-20,'Admin')



select * from Worker

select * from Worker where WORKER_ID=1

--1. SQL query to fetch “FIRST_NAME” from Worker table using the alias name as &lt;WORKER_NAME&gt;.
select FIRST_NAME as WORKER_NAME from Worker 

--2. SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(FIRST_NAME) from Worker

--3. SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct DEPARTMENT from Worker 

--4. SQL query to print the first three characters of FIRST_NAME from Worker table.
select substring(FIRST_NAME,1,3) FIRST_NAME from Worker

--5. SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct len(DEPARTMENT) DEPARTMENT from Worker 


--6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select CONCAT(FIRST_NAME,'',LAST_NAME) as COMPLETE_NAME from Worker

--7 SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
Select * from Worker where FIRST_NAME in ('Vipul','Satish');

--8 SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from Worker where DEPARTMENT='Admin'

--9 SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select * from Worker where FIRST_NAME like '%a' 

--SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select * from Worker where FIRST_NAME like '%a%'
