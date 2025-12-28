	create database tasks;
    use tasks;
    
    CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department VARCHAR(50),
  salary DECIMAL(10,2),
  city VARCHAR(50),
  email VARCHAR(100)
);






INSERT INTO employees (emp_id, first_name, last_name, department, salary, city, email) VALUES
(1, 'Priya',   'Sharma',    'Sales',     72000,  'New York',        'priya.sharma@company.com'),
(2, 'Rohan',   'Verma',     'IT',        95000,  'San Francisco',   'rohan.verma@company.com'),
(3, 'Ananya',  'Gupta',     'HR',        58000,  'Chicago',         'ananya.gupta@company.com'),
(4, 'Meera',   'Iyer',      'Finance',   88000,  'Boston',          'meera.iyer@company.com'),
(5, 'Ishaan',  'Khanna',    'IT',       105000,  'New York',        'ishaan.khanna@company.com'),
(6, 'Neha',    'Singh',     'Sales',     67000,  'Newark',          'neha.singh@company.com'),
(7, 'Kabir',   'Bhatia',    'Marketing', 64000,  'New Orleans',     'kabir.bhatia@company.com'),
(8, 'Heena',   'Andrews',   'Finance',   99000,  'Chicago',         'heena.andrews@company.com'),
(9, 'Vikram',  'Sethi',     'IT',        78000,  'New York',        'vikram.sethi@company.com'),
(10,'Jia',     'Kapoor',    'Sales',     73000,  'San Jose',        'jia.kapoor@company.com'),
(11,'Nikhil',  'Arora',     'IT',       120000,  'New York',        'nikhil.arora@company.com'),
(12,'Rhea',    'Mukherjee', 'HR',        61000,  'Nashville',       'rhea.mukherjee@company.com'),
(13,'Aarav',   'Nair',      'Marketing', 70000,  'Newark',          'aarav.nair@company.com'),
(14,'Noah',    'Thompson',  'Finance',   83000,  'New Orleans',     'noah.thompson@company.com'),
(15,'Olivia',  'Garcia',    'IT',        91000,  'Chicago',         'olivia.garcia@company.com'),
(16,'Pooja',   'Jain',      'Sales',     68000,  'New York',        'pooja.jain@company.com'),
(17,'Quinn',   'Robinson',  'Finance',  102000,  'Boston',          'quinn.robinson@company.com'),
(18,'Samaira', 'Jain',      'HR',        59000,  'San Francisco',   'samaira.jain@company.com'),
(19,'Zain',    'Hussain',   'Marketing', 75000,  'Chicago',         'zain.hussain@company.com'),
(20,'Tina',    'Lewis',     'IT',        87000,  'New York',        'tina.lewis@company.com');


select * from employees;

-- 1.Display each employee’s full name in uppercase as a single column named EMPLOYEE_NAME.

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS EMPLOYEE_NAME
FROM employees;
-- 2.Show all employees’ email IDs in lowercase with the domain “@company.com” replaced by “@myorg.com”.
select lower(replace(email,'@company.com','@myorg.com')) as email from employees;

-- 3.Display the first 3 letters of each employee’s first name along with the reversed last name.
select substring(first_name,1,3) as first_1,
reverse(last_name) as reversed
from employees;

-- 4.List all employees sorted by the length of their first name (shortest to longest). If lengths are equal, sort by first name alphabetically.

SELECT first_name
FROM employees
ORDER BY LENGTH(first_name), first_name ASC;

-- 5.Find all employees whose city name starts with the letter “n” (case-insensitive).
select * from employees 
where city like 'n%';

-- 6.Find how many distinct departments exist in the company.
select count(distinct(department)) from employees;

-- 7.Show the average salary for each department, ordered by average salary descending.
select department,avg(salary) as avg_salary 
from employees 
group by department
order by(avg_salary) desc;

-- 8.Display total salary by department, but only include departments whose total salary exceeds 200000.
select department,sum(salary) as total_salary 
from employees 
group by department
having sum(salary)>200000;

-- 9.Return the top 3 highest-paid employees and, in a separate query, the bottom 3 lowest-paid employees.
select * from employees
order by salary desc
limit 3;

select * from employees
order by salary asc
limit 3;

-- 10.For each department, display DEPARTMENT (in uppercase), number of employees, minimum salary, maximum salary, and average salary; include only departments with more than 3 employees and an average salary below 90000. Order by average salary descending and return only the first 5 rows.
select upper(department),count(emp_id),min(salary),
max(salary),avg(salary) from employees
group by department
having count(emp_id)>3 and avg(salary)<90000
order by avg(salary) desc
limit 5;