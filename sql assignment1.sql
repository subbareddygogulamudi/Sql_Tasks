-- creating database
create database assignments;

-- using created database
use assignments;

-- creating table students
create table students(
student_id int primary key not null,
name varchar(50)not null,
gender char(1) check (gender='M' or gender='F'),
age int check (age>0),
course varchar(50) default 'BCA',
email varchar(100) null
);

-- inserting rows
insert into students(student_id,name,gender,age,course,email)
values
(1,'Aarav Sharma','M',20,'BCA','aarav@example.com'),
(2,'Anaya Iyer','F',21,'BBA','ananya@example.com'),
(3,'Rohan Mehtha','M',19,'Bsc','rohan@example.com'),
(4,'Isha kapoor','F',22,'Bcom','isha@example.com'),
(5,'Vikram Rao','M',20,'BCA','vikram@example.com'),
(6,'Neha varma','F',23,'BSc','neha@example.com'),
(7,'Arjun Nair','M',18,'BA','arjun@example.com'),
(8,'Sara khan','F',21,'BBA','sara@example.com'),
(9,'Kabir Singh','M',24,'BCom','kabir@example.com'),
(10,'Priya Das','F',22,'BCA','priya@example.com');

-- checking the structure of the table
desc students;

-- selecting the table
select * from students;

-- 1.changing according to the questions
alter table students
modify course varchar(80);

-- 2.
alter table students
modify email varchar(100) not null unique;

-- 3.
alter table students
add full_name varchar(60) after name;

-- 4.
alter table students
drop column full_name;
alter table students
drop column age;

-- 5.
alter table students
add age int check(age>0) after gender,
add phone varchar(15);

-- 6.
alter table students
drop column phone;
alter table students
modify gender char(1) default 'F' check(gender='M'or gender='F' );

-- 7.
alter table students
modify gender char(1) check(gender='M'or gender='F' );
alter table students
add created_at datetime default CURRENT_TIMESTAMP;

-- 8.
alter table students
drop column created_at;
alter table students
modify student_id bigint;

-- 9.
alter table students
modify student_id int,
modify course varchar(50),
modify email varchar(100) null;

-- 10.
alter table students
modify email varchar(50) default 'BCA';

desc students;
















