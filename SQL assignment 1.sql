use demo;
DROP TABLE IF EXISTS student;
CREATE TABLE student
(studentid int primary key,
studentname  varchar(10),
marks int);

INSERT INTO student(studentid,studentname,marks)
values
(101,'Ankit',81),
(102,'Sahil',82),
(103,'Rockey',67),
(104,'Revi',55),
(105,'Chinu',88),
(106,'Sanjay',98),
(107,'Lucky',45),
(108,'Aarju',78),
(109,'Naveen',87);


-- 2 Insert the detail of new student
INSERT INTO student(studentid,studentname,marks)
value
(110,'Ajay',98);
select * from student;

-- 3 delete the details of student in the above table

truncate table student;
select * from student;

-- 4 Insert more record to the above student table more than 7
INSERT INTO student(studentid,studentname,marks)
values
(101,'Ankit',81),
(102,'Sahil',82),
(103,'Rockey',67),
(104,'Revi',55),
(105,'Chinu',88),
(106,'Sanjay',98),
(107,'Lucky',45),
(108,'Aarju',78),
(109,'Naveen',87);
select * from student;

 -- 5 select students whose marks more than 80
 select studentid,studentname,marks
 from student
 where marks > 80;
 
 -- 6 Find min , max, sum, and average of tha marks in student table
 select max(marks) from student;
 select min(marks) from student;
 select avg(marks) from student;
 select sum(marks) from student;
 
 -- 7   Find the students names whose marks are greater than 60 or less than 40
 select studentid,studentname,marks
 from student
 where marks > 60 or marks <40;
 
 -- 8 write sql query to order the studentid or marks in desc order
  select studentid,studentname,marks
 from student
 order by studentid desc, marks desc;
 
 -- 9 write a SQL query to display marks without decimal places, display the remainder after dividing marks by 3 and display the square of marks
 
 select floor(marks) as int_dtype ,round(marks/3,2) as remainder , power(marks,2) as sq_marks from student;

-- 10 write a sql query to display names intp capital letters, small leteres display first three letter of name or display last three letter of name 
 
select upper(studentname) from student;

select lower(studentname) from student;

select substr(studentname ,1,3) from student;
select * from student;

select substr(studentname,3,3) from student;

-- Additional questions

-- 11  Remove extra spaces from left, right and both side from the text
-- we use strip() for removing the spaces
-- let's suppose data in 'a'
-- we wriiten a.strip() 


-- 12 Display today's date in "Date/month/year" format
select sysdate();
select now();

-- 13 select today date dayname, yearname, monthname, yearweek name
select sysdate();
select dayname(sysdate());
select monthname(sysdate());
select year(sysdate());
select yearweek(sysdate());

-- 14 primary keys = The primary key constraints uniquely identifies each record in a table. primary keys have must contain unique values not contain null values.
-- Foreign keys = A formal key is primary key in other table
