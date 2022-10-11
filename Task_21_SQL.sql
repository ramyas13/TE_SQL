create table salesman
(salesman_id int primary key, 
name varchar(20), 
city varchar(20), 
commission float(10)
);

insert into salesman values(5001, 'James Hoog', 'New York', 0.15)
insert into salesman values(5002, 'Nail Knite', 'Paris', 0.13)
insert into salesman values(5005, 'Pit Alex', 'London', 0.11)
insert into salesman values(5006, 'Mc Lycon', 'Paris', 0.14)
insert into salesman values(5007, 'Paul Adam', 'Rome', 0.13)
insert into salesman values(5003, 'Lauson Hen', 'San Jose', 0.12)

select * from salesman

--1. From the following table, create a view for those salespeople who belong to the city of New York.
create view sales_man
as
select * from salesman where city='New York'

select * from sales_man

--2 From the following table, create a view for all salespersons. Return salesperson ID, name, and city.
create view sales_man2
as
select salesman_id,city,name from salesman

select * from sales_man2

--3 From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.
CREATE VIEW sales_man3
AS SELECT city, COUNT(DISTINCT salesman_id) salesman_id
FROM salesman
GROUP BY city;

select * from sales_man3


CREATE TABLE customers
( customer_id int PRIMARY KEY,
  cust_name varchar(50),
  city varchar(50),
  grade int,
  salesman_id int
);

insert into customers values(3002,'Nick Rimando','New York',100,5001)
insert into customers values(3007,'Brad Davis','New York',200,5001)
insert into customers values(3005,'Graham Zusi','California',200,5002)
insert into customers values(3008,'Julian Green','London',300,5002)
insert into customers values(3004,'Fabian Johnson','Paris',300,5006)
insert into customers values(3009,'Geoff Cameron','Berlin',100,5003)
insert into customers values(3003,'Jozy Altidor','Moscow',200,5007)

select * from customers
--4. From the following table, create a view that counts the number of customers in each grade.
CREATE VIEW countgrade (grade, count)
AS SELECT grade, COUNT(*)
FROM customers
GROUP BY grade;

select * from countgrade

CREATE TABLE orders
( ord_no int PRIMARY KEY,
  purch_amt float(10),
  ord_date Date,
  customer_id int,
  salesman_id int
);

insert into orders
(ord_no, purch_amt, ord_date,customer_id,salesman_id) values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001)

select * from orders

--5. From the following tables, create a view to get the salesperson and customer by name. Return order name, purchase amount, salesperson ID, name, customer name.
CREATE VIEW ord_er
AS SELECT ord_no, purch_amt, a.salesman_id, name, cust_name
FROM orders a, customers b, salesman c
WHERE a.customer_id = b.customer_id
AND a.salesman_id = c.salesman_id;

select * from ord_er


