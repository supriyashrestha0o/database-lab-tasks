-- #1.	Create a database named dbemp and switch to it.

-- create database dbemp;
-- use dbemp;
-- #2.	Create an employee table with appropriate data types 
-- #and constraints for employee details.
-- create table employee(
-- 		EmployeeID varchar(20) NOT NULL PRIMARY KEY,
--         FirstName varchar(20),
--         LastName varchar(20),
--         Gender char(1),
--         DateofBirth DATE,
--         Designation varchar(50),
--         DepartmentName varchar(20),
--         ManagerId varchar(20),
--         JoinedDate DATE,
--         Salary decimal(10,0)
-- );
#3.	Insert at least two employee records into the employee table.
insert into employee (
EmployeeID,FirstName,LastName,Gender,DateofBirth,Designation,
DepartmentName,ManagerId,JoinedDate,Salary)
values (
'0004','Supriya','Shrestha','F','2007-10-26','Engineer',
'Software Engineering', '0005','2022-04-02','5000000'
),(
'0012','Subasna','Rai','F','2000-04-02','Manager',
'Software Engineering', '0003','2022-04-02','1000000'
);
select * from employee;
use dbemp;
-- update employee
-- SET Gender = 'F'
-- WHERE EmployeeID = '0009';
#5. display the first name, current date, date of birth, and age of employees
#who are older than 30 years.
-- SELECT FirstName,DateofBirth, current_date() as CurrentDate,
-- timestampdiff(YEAR,DateofBirth,CURRENT_DATE()) as Age from employee
-- where
-- timestampdiff(YEAR,DateofBirth,CURRENT_DATE())>25;
#6. write a query to find the oldest employee.
-- SELECT FirstName, LastName, DateofBirth, 
--        TIMESTAMPDIFF(YEAR, DateofBirth, CURDATE()) AS Age
-- FROM employee
-- ORDER BY DateofBirth Desc

#7.display maximum slary department-wise
select DepartmentName, MAX(Salary) as max_salary
from employee
GROUP BY DepartmentName;

#8. list the employees who act as managers.
select *from employee;
select FirstName from employee where
EmployeeID in (Select ManagerID from employee);

#9. display the details of the most recently joined employee

