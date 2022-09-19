use demo;
DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(empid int primary key,
empname varchar(100),
department varchar(100),
contactno bigint,
emailid varchar(100),
empheadid int
);
select * from employee;
INSERT INTO employee (empid,empname,department,contactno,emailid,empheadid)
values
(2,'Parag','IT',1234567890,'abc@gmail.com',123 ),
(4, 'Rahul', 'IT', 12343567890,'abc@gmail.com',124),
(7,'Rohit','CSE',9994567890,'def@gmail.com',125),
(9,'Ram','DS',774567890,'123@yahoo.com',126),
(10,'Renuka','DS',6664567890,'999@gmail.com',127);

DROP TABLE IF EXISTS empdept;
CREATE TABLE empdept
(deptid varchar(50) primary key,
deptname varchar(100),
dept_off varchar(100),
depthheadid VARCHAR(100));

INSERT INTO empdept(deptid,deptname,dept_off,depthheadid)
values
('IT03','IT','Nsmpally','HYD'),
('IT02','IT','Monikonda','HYD'),
('DS01','DS','Kukatpally','HYD'),
('DS02','DS','RangaReddy','RR'),
('DS03','DS','Secundarabad','SEC');

select * from empdept;

DROP TABLE IF EXISTS empsalary;
CREATE TABLE empsalary
(empid int ,
salary bigint,
ispermanent varchar(3),
date_time bigint );


INSERT INTO empsalary (empid,salary,ispermanent,date_time)
values
(2,20000,'yes',28-12-2002),
(4,40000,'no',29-12-2002),
(7,50000,'yes',01-1-2003),
(9,60000,'no',02-2-2003),
(10,70000,'yes',01-1-2004);


select * from empsalary;

-- SELECT the detail of the employee whose first name start with p

select empid,empname,department,contactno,emailid,empheadid
from employee
where empname like 'P%';

-- How many permanent candidates earn more than 5000
select empid,salary,ispermanent
from empsalary
where salary > 5000 and ispermanent = 'yes';

-- select the details of the empployee whose email id is in gmail
select empid,empname,department,contactno,emailid,empheadid
from employee
where emailid like ('%gmail.com')

-- 3 what is total salary that is paid to permanent employee
 select sum(salary) 
 from empsalary
 where ispermanent = 'yes';



-- List name of all employees whose name ends wirh a.
select empid,empname,department,contactno,emailid,empheadid
from employee
where empname like ('%a');

-- Nested query
-- select the name of the employee who is working under Rahul
select empid,empname,department,contactno,emailid,empheadid
from employee
where  empname > 'Rahul';
select * from employee;



-- select the name of all employee head who is permanent
select * from employee
where empid in (select empid
from empsalary
where ispermanent = 'yes');
select * from employee
where empid in (select empid
from empsalary
where ispermanent = 'no');

-- 5 Inner join
select * from employee
inner join empsalary
on employee.empid = empsalary.empid

-- left join
select * from employee
left join empsalary
on employee.empid = empsalary.empid

-- right join
select * from employee
cross join empsalary
on employee.empid = empsalary.empid

-- cross join
select * from employee
cross join empsalary
on employee.empid = empsalary.empid

-- Difference in joins
-- Inner join - Return records that have matching values in both tables
-- left join - return all records from the left table and the matched records from the right table
-- right join - Return all records from the right table and the matched records from the left table
-- common join - during the join all rows from the two tables are distrubuted to all nodes based on the join keys.
-- Full join - left join and right join each return unmatched rows from one of the table but in full join return unmatched rows from both tables

-- 6 Update a value in employee table

update employee set empname = 'Maria'
where empid = 10

select * from employee;

-- 7 delete the entire row in employee table
delete from  employee 
where empid = 10;

select * from employee;

-- 8 alterning table
-- a  adding additional colunm in employee table

INSERT INTO employee(empid,empname,department,contactno,emailid,empheadid)
value
(10,'Shy','DS',9993432994,'234@gmail.com',127);

select * from employee;

-- b remove new added column
delete from employee
where empid = 10;
select * from employee;

-- 9 Find the count of salary given to the employee
select empid , salary, count(*) from empsalary group by empid,salary;

-- 10 List of employees and there common salary sorted high to low
select * from empsalary order by salary desc;
-- or
select empid,salary,ispermanent
from empsalary
order by salary desc;

-- 11 Explain about JOINS
-- Join is an SQL clause used to query and access data from multiple tables, based on logical relationship between those tables.

-- 12  what are UNION,MINUS AND INTERSECT commands
-- You can combine multiple queries using the set operators union, moinus and intersect.
-- Union combine result from both tables. It combine two or more result sets into a single set.
-- Intersect takes the rows from both the result sets which are common in both.
-- Minus takes to subtract one result set from another result set to evalute the result set difference.


-- 13 what is difference btw truncate , delete and drop
-- Truncate is used for deliting all table data .
-- Delete is used for delete only selected row in a data set
--  Drop table commmand to drop a table from the database.

-- Filter methods

select * from empsalary
where empid between 1 and 3
order by empid;


-- filtering by condition
select * from empsalary
where empid = 2 ;

-- Sum -------

select ispermanent, sum(salary) as Sum_of_total_salary_groupby
from empsalary
group by ispermanent;

-- Having -----
select ispermanent, sum(salary) as Sum_of_total_salary_groupby
from empsalary
group by ispermanent
Having  Sum_of_total_salary_groupby > 100000
order by  Sum_of_total_salary_groupby desc;

select * from employee;
select * from empdept;
select * from empsalary;

select c1.empname, c2.empname from employee c1
CROSS join employee c2;

select o1.empid,empname,department,empheadid
from employee o1 right join empsalary o2
on o1.empid = o2.empid;

select o1.empid,empname,department
from employee o1 cross join empsalary o2
on o1.empid = o2.empid;

-- In this join shows two columns empid, ispermanent
select o1.empid,ispermanent
from empsalary o1 right join employee o2
on o1.empid = o2.empid;

-- count how much employee id same salary
select c.empid, count(salary) as total_salary
from empsalary as c
inner join employee as o
on c.empid = o.empid
group by c.empid;

select * from empsalary 
count(salary) as total_salary
from empsalary
group by empid;

select empid, count(*) from empsalary group by empid;

-- Inner Join ----
select e.empid,e.empname,r.empid,r.ispermanent
from employee as e
inner join empsalary as r
on e.empid = r.empid

-- left join
select  e.empid,e.empname,r.empid,r.ispermanent
from employee as e
left join empsalary as r
on e.empid = r.empid;

select  e.empid,e.empname,r.salary,r.ispermanent
from employee as e
right join empsalary as r
on e.empid = r.empid;

select  e.empid,e.empname,r.empid,r.ispermanent
from employee as e
full join empsalary as r
on e.empid = r.empid;

-- Temporary tables

CREATE temporary TABLE products_planes(
productcode varchar(15) NOT NULL,
productname varchar(70) NOT NULL,
productLine varchar(50) NOT NULL,
productScale varchar(10) NOT NULL,
productVendor varchar(50) NOT NULL,
productDescription text NOT NULL,
quantityInStock smallint NOT NULL,
buyPrice decimal(10,2) NOT NULL,
MSRP decimal(10,2) NOT NULL,
PRIMARY KEY (productcode));

insert into products_planes
select * from employee where productline = 'Planes';

select * from empsalary;

select max(salary) from empsalary;
select sum(salary) from empsalary;

select * from employee;



select * from empsalary;

select sysdate(), sleep(5),sysdate();
select sysdate(), sleep(1),sysdate();

select *, current_date(),day()

 DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
  customerNumber int NOT NULL,
  checkNumber varchar(50) NOT NULL,
  paymentDate date NOT NULL,
  amount decimal(10,2) NOT NULL
);

INSERT  INTO `payments`(`customerNumber`,`checkNumber`,`paymentDate`,`amount`) 
VALUES 
(103,'HQ336336','2004-10-19','6066.78'),
(103,'JM555205','2003-06-05','14571.44'),
(103,'OM314933','2004-12-18','1676.14'),
(112,'BO864823','2004-12-17','14191.12'),
(112,'HQ55022','2003-06-06','32641.98'),
(112,'ND748579','2004-08-20','33347.88'),
(114,'GG31455','2003-05-20','45864.03'),
(114,'MA765515','2004-12-15','82261.22'),
(114,'NP603840','2003-05-31','7565.08'),
(114,'NR27552','2004-03-10','44894.74'),
(119,'DB933704','2004-11-14','19501.82'),
(119,'LN373447','2004-08-08','47924.19'),
(119,'NG94694','2005-02-22','49523.67');


alter table payments
add primary key(checkNumber);

describe payments;
select * from payments;
select *, current_date(),day(paymentdate),month(paymentdate),year(paymentdate)
from payments;


select *, current_date(),
datediff(current_date,paymentdate) as days,
datediff(current_date,paymentdate)/365 as years
from payments;


select *, current_date(),
datediff(current_date,paymentdate) as days,
datediff(current_date,paymentdate)/365 as years,
date_add(paymentdate,interval 1 day)
from payments;


select *, date_add(paymentdate, INTERVAL 1 HOUR) FROM payments;
select *, date_add(paymentdate, INTERVAL 1 MINUTE) FROM payments;

-- reduce time
select *, date_add(paymentdate, INTERVAL '-1 5' DAY_HOUR) FROM payments;

select *, date_add(paymentdate, INTERVAL '-1 5' SECOND_MICROSECOND) FROM payments;

select *, date_add(paymentdate, INTERVAL 1 WEEK) FROM payments;

select *, date_sub(paymentdate, INTERVAL '-1 ' WEEK) FROM payments;

select *, date_format(paymentdate, '%a') FROM payments;
select *, date_format(paymentdate, '%e/%c/%Y') FROM payments;
select * from payments;

-- check sub queries

select dayname(paymentdate) as weekday,
count(*) as total_payments
from payments
where year(paymentdate) = 2004
group by weekday;

-- extract
select *, EXTRACT(WEEK FROM paymentdate) FROM payments;

select*,extract(DAY FROM paymentdate) FROM payments;

select *, EXTRACT(MONTH FROM paymentdate) FROM payments;

-- string functions
select customernumber, length(customernumber) from payments;


select * from payments;

select
checknumber,
INSTR(checknumber,' '),
LENGTH(checknumber),
LENGTH(RTRIM(checknumber)),
LENGTH(LTRIM(checknumber)),
LENGTH(TRIM(checknumber))
FROM payments 

-- Greatest or Least
select * from payments;
select customerNumber,greatest(amount,checkNumber),least(amount,checkNumber) from payments;

select customerNumber,isnull(amount) as isnullvalues, paymentdate from payments;

-- Datediff
select*,current_date(),
datediff(current_date,paymentdate) as days,
datediff(current_date,paymentdate)/365 as year
from payments;

select * from payments
where customerNumber in (103,112,114);
order by payments desc;

select count(*) from payments;

delete from payments
where customerNumber = 103;

select 
checkNumber as checkno
from payments;

select * from payments;

update customerNumber set customerNumber = 119
where checknumber = 'HQ336336';
from payments;

delimiter $$
create procedure getofficebycountry(in checknumber )
begin
select * from payments where payments = checknumber;
end $$
call getofficebycountry('HQ336336')
delimiter $$
begin
select count(amount)
into total
from payments
where status = amount;
end $$


call getorderbystatus('amount',@total);
select @total;