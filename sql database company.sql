create database TCS_company_db;
use TCS_company_db;
drop table employees;

create table employees(
emp_id int primary key,
emp_name varchar(50),
gender varchar(10),
department varchar(30),
joining_date date,
salary decimal(10,2)
);

drop table employees;
insert into employees
(emp_id,emp_name,gender,department,joining_date,salary)
values
(1,'Rahul Sharma','Male','Finance','2023-01-15',45000),
(2,'Anjali Menon','Female','HR','2023-02-10',42000),
(3,'Aarav Patel','Male','IT','2023-03-05',65000),
(4,'Priya Pillai','Female','HR','2022-01-12',85000),
(5,'Ananya Das','Female','Finance','2021-08-18',95000),
(6,'Vikram Fernandes','Male','Marketing','2024-02-14',70000),
(7,'Rohan Roy','Male','Operations','2025-06-01',55000),
(8,'Amit Nair','Male','HR','2024-02-25',131000),
(9,'Aditi Singh','Female','Marketing','2023-05-17',109000),
(10,'Pradeep Menon','Male','Marketing','2023-04-21',102000),
(11,'Swati Pillai','Female','IT','2024-07-08',142000),
(12,'Rajesh Sharma','Male','Legal','2021-07-23',88000),
(13,'Kavita Menon','Female','Sales','2020-07-08',58000),
(14,'Sunil Menon','Male','Sales','2023-05-20',89000),
(15,'Tanvi Joseph','Female','Finance','2020-11-20',65000),
(16,'Arjun Das','Male','Legal','2021-12-10',44000),
(17,'Vivek Nair','Male','IT','2021-08-24',66000),
(18,'Manoj Pillai','Male','Sales','2023-11-13',149000),
(19,'Abhishek Sharma','Male','Legal','2022-08-01',129000),
(20,'Ritu Singh','Female','Sales','2024-02-14',100000),
(21,'Sunita Thomas','Female','Finance','2021-10-31',114000),
(22,'Harish Kumar','Male','Finanace','2024-06-25',143000),
(23,'Suresh Kumar','Male','Finance','2022-03-09',105000),
(24,'Riya Menon','Female','Legal','2022-10-18',45000),
(25,'Manish Pandey','Male','HR','2020-04-22',60000);

select * from employees;
create table attendance (
attendance_id int primary key,
emp_id int,
attendance_date date,
check_in time,
check_out time,
status varchar(15),
foreign key (emp_id)
references employees(emp_id)
);

select * from attendance;
insert into attendance (attendance_id,emp_id,attendance_date,check_in,check_out,status)
values
(101,1,'2026-08-01','09:00:00','17:30:00','Present'),
(102,2,'2026-08-01','09:05:00','17:35:00','Present'),
(103,3,'2026-08-01','09:15:00','17:20:00','Late'),
(104,4,'2026-08-01','09:00:00','17:30:00','Present'),
(105,5,'2026-08-01',NULL,NULL,'Absent'),
(106,6,'2026-08-01','09:10:00','17:40:00','Present'),
(107,7,'2026-08-01','09:20:00','17:25:00','Late'),
(108,8,'2026-08-01','09:00:00','17:30:00','Present'),
(109,9,'2026-08-01','09:30:00','17:45:00','Late'),
(110,10,'2026-08-01','09:00:00','17:30:00','Present'),
(111,11,'2026-08-01','09:05:00','17:35:00','Present'),
(112,12,'2026-08-01',NULL,NULL,'Absent'),
(113,13,'2026-08-01','09:00:00','17:30:00','Present'),
(114,14,'2026-08-01','09:25:00','17:40:00','Late'),
(115,15,'2026-08-01','09:00:00','17:30:00','Present'),
(116,16,'2026-08-01','09:10:00','17:35:00','Present'),
(117,17,'2026-08-01',NULL,NULL,'Absent'),
(118,18,'2026-08-01','09:00:00','17:30:00','Present'),
(119,19,'2026-08-01','09:15:00','17:25:00','Late'),
(120,20,'2026-08-01','09:00:00','17:30:00','Present'),
(121,21,'2026-08-01','09:05:00','17:35:00','Present'),
(122,22,'2026-08-01','09:20:00','17:40:00','Late'),
(123,23,'2026-08-01','09:00:00','17:30:00','Present'),
(124,24,'2026-08-01',NULL,NULL,'Absent'),
(125,25,'2026-08-01','09:10:00','17:35:00','Present');

select * from attendance;
select * from employees limit 2;
select * from employees order by salary asc;
select * from employees where department = 'Finance';
select * from employees where salary >= 80000;
select * from employees where department <> 'HR';
select * from employees where department = 'Finance' and salary > 80000;
select * from employees where department = 'HR' or department = 'Finance';
select * from employees where not department = 'Sales';
select * from employees where department = 'Finance';
select * from employees where salary between 50000 and 100000;
select * from employees where department not in ('HR','IT');

select * from employees where emp_name like 'A%';
select * from employees where emp_name like '%an%';
select * from employees where emp_name like '_____';
select * from employees where emp_name like 'R_____';
select * from employees where joining_date is not null;
select * from employees where joining_date is null;
select * from employees limit 5,3;

select count(*) as total_employees from employees;
select count(*) as finance_employees from employees where department = 'Finance';
select sum(salary) as total_salary from employees;
select avg(salary) as average_salary from employees;
select max(salary) as highest_salary from employees;
select min(salary) as lowest_salary from employees;

select department,avg(salary) as average_salary
from employees 
group by department;

select department,count(*) as total_employees
from employees 
group by department;

select gender,department,avg(salary) from employees
where salary>50000
group by gender,department;

select department,count(*) from employees
group by department
having count(*) >2;

-- string funtions
select emp_id,
emp_name,
upper(emp_name) as employee_name_upper
from employees;

select emp_id,
emp_name,
lower(emp_name) as employee_name_lower
from employees;

select emp_id,
department,
trim(department)as trimmed_name
from employees;

select emp_name,
department,
concat(emp_name,'-',department)
from employees;

select emp_name,
length(emp_name)as emp_name_length
from employees;

select emp_name,
LEFT(emp_name,5) as left_name
from employees;

select emp_name,
right(emp_name,5)as right_name
from employees;

select department,
replace(department,'IT','information technology') as
new_dept
from employees;

-- numeric functions

select round(75.678,2);
select ceil(75.2);
select floor(75.2);
select abs(-45);

-- date functions
select now();
select curdate();
select curtime();
select year(curdate());
select month(curdate());
select day(curdate());
select datediff('2026-07-06','2005-01-05');
select timestampdiff(year,'2005-01-05',curdate());  -- for year
select timestampdiff(month,'2005-05-01',curdate()); -- for month
select timestampdiff(day,'2005-05-01',curdate()); -- for days

-- date format
select date_format(curdate(),'%d-%m-%y');
select date_format(curdate(),'%d-%m-%Y');
select date_format(curdate(),'%D-%m-%Y');
select date_format(curdate(),'%d-%M-%Y');

-- case
select emp_name, salary,
case 
when salary >= 120000 then 'High Salary'
when salary >= 80000 then 'Medium Salary'
else 'Low Salary'
end as salary_grade
from employees;

select emp_name,gender,
case
when gender='male' then 'm'
when gender='female'then 'f'
end as gender_info
from employees;

select * from employees
order by
case
when gender='male' then 1
when gender='female' then 2
else 3
end;

select * from employees;

select 
sum(case when salary >= 100000 then 1 else 0 end) as high_salary,
sum(case when salary < 100000 then 1 else 0 end) as low_salary
from employees;

select emp_name,salary,
if(salary>=100000,'high salary','low salary')as result
from employees;

select emp_name,salary,
if(salary>=50000,if(salary>=100000,"high salary","average salary"),"fail") as employees
from employees;

select * , ifnull(salary,0) as NullReplaced
from employees;

select salary,nullif(salary,0) from employees;

select emp_name, department,
coalesce(department, 'No Department') as dept_fixed
from employees;


-- joins --

select  -- Inner Join --
e.emp_id,
e.emp_name,
e.department,
e.salary,
a.attendance_date,
a.status
FROM employees e
inner JOIN attendance a
ON e.emp_id = a.emp_id;

select   -- Left Join --
e.emp_id,
e.emp_name,
e.department,
a.attendance_date,
a.status
from employees e
left join attendance a
on e.emp_id = a.emp_id;

select -- Right Join --
e.emp_id,
e.emp_name,
e.department,
a.attendance_date,
a.status
from employees e
right join attendance a
on e.emp_id = a.emp_id;

select -- Join with Where --
e.emp_name,
e.department,
a.attendance_date,
a.status
from employees e
join attendance a
on e.emp_id = a.emp_id
where a.status = 'late';

select -- Join + Group By --
a.status,
count(*) as total_employees
from employees e
join attendance a
on e.emp_id = a.emp_id
group by a.status;

-- Employees earning more than the average salary--

select emp_name, salary
from employees
where salary > (
select avg(salary)
from employees
);

-- Employees with the highest salary --

select emp_name, salary
from employees
where salary = (
select max(salary)
from employees
);

-- Employee with the highest salary --

select emp_name, salary
from employees
where salary =(
select max(salary)
from employees
);

-- Employee with the lowest salary --

select emp_name, salary
from employees
where salary = (
select min(salary)
from employees
);

-- Highest-paid employee in each department --

select emp_name,department, salary
from employees e
where salary = (
select max(salary)
from employees
where department  = e.department
);


SELECT emp_name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);




