CREATE DATABASE TechSolutionsDB;
USE TechSolutionsDB;
#create the following table wirrth appropriate data types and constraints
CREATE TABLE Department (
DeptID INT PRIMARY KEY,
DeptName VARCHAR (255) NOT NULL,
Location VARCHAR (255)
);
CREATE TABLE EMPLOYEE (
EmpID INT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
Gender CHAR(1),
Salary DECIMAL (19,0),
HireDate DATE,
DeptID INT,
FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID)
);

CREATE TABLE PROJECT (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(255),
StartDate DATE,
EndDate DATE,
Budget DECIMAL (19,0)
);
CREATE TABLE WORKS_ON (
EmpID INT,
DeptID INT,
HoursWorked TIME,
FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(DeptID),
FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID)
);
-- DROP TABLE IF EXISTS WORKS_ON;
-- DROP TABLE IF EXISTS EMPLOYEE;

#insert at least 5 records into each table
#update a salary of an employee whose EmpID = 102 by increasing it by 10%
#delete a project whose projectID = 5
INSERT INTO Department VALUES
(1,'HR','Kathmandu'),
(2,'IT','Pokhara'),
(3,'Finance','Lalitpur'),
(4,'Marketing','Bhaktapur'),
(5,'Sales','Biratnagar');

INSERT INTO Employee VALUES
(101,'Ram','Sharma','M',50000,'2023-01-10',1),
(102,'Sita','Karki','F',60000,'2022-03-15',2),
(103,'Hari','Thapa','M',55000,'2021-07-20',3),
(104,'Gita','Rai','F',52000,'2020-11-05',4),
(105,'Manish','Adhikari','M',58000,'2023-06-18',5);

DROP TABLE Project;
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10,2)
);
INSERT INTO Project (ProjectID, ProjectName, StartDate, EndDate, Budget)
VALUES
(10,'Website Development','2024-01-01','2024-06-01',50000),
(11,'Mobile App','2024-02-01','2024-07-01',65000),
(12,'Database System','2024-03-01','2024-08-01',45000),
(13,'AI Research','2024-04-01','2024-09-01',80000),
(14,'Cloud Migration','2024-05-01','2024-10-01',70000);

DROP TABLE WORKS_ON;
CREATE TABLE WORKS_ON (
  EmpID INT,
  ProjectID INT,
  HoursWorked TIME,
  FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
INSERT INTO WORKS_ON VALUES
(101,10,'05:00:00'),
(102,11,'06:30:00'),
(103,12,'04:45:00'),
(104,13,'07:15:00'),
(105,14,'03:30:00');

UPDATE Employee
SET Salary = Salary * 1.10
WHERE EmpID = 102;

DELETE FROM Works_On
WHERE ProjectID = 5;

DELETE FROM Project
WHERE ProjectID = 5;

#PART C
#Display all employees who earn more than 50,000
#Display FirstName, LastName, and Salary of employees sorted by Salary in descending order
#Display employees who belong to the IT department
#Show the total number of employees in each department 
#Display employees who were hired after Janauray 1, 2022

SELECT *
FROM Employee
WHERE Salary > 50000;

SELECT FirstName, LastName, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT e.*
FROM Employee e
JOIN Department d
ON e.DeptID = d.DeptID
WHERE d.DeptName = 'IT';

SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Department d
LEFT JOIN Employee e
ON d.DeptID = e.DeptID
GROUP BY d.DeptName;

SELECT *
FROM Employee
WHERE HireDate > '2022-01-01';

#PART- D: Join Queries
#display employee names along with their department names
SELECT e.FirstName, e.LastName, d.DeptName
FROM Employee e
JOIN Department d
ON e.DeptID = d.DeptID;

#show employees and the projects they are working on
SELECT e.FirstName, e.LastName, p.ProjectName
FROM Employee e
JOIN Works_On w ON e.EmpID = w.EmpID
JOIN Project p ON w.ProjectID = p.ProjectID;

#display project names with the total hours worked by employees
SELECT p.ProjectName, SUM(w.HoursWorked) AS TotalHours
FROM Project p
JOIN Works_On w ON p.ProjectID = w.ProjectID
GROUP BY p.ProjectName;

#PART-E: Aggregate and Advanced Queries
#find the average salary of employees in each department 
SELECT d.DeptName, AVG(e.Salary) AS AverageSalary
FROM Department d
JOIN Employee e ON d.DeptID = e.DeptID
GROUP BY d.DeptName;

#display the department with the highest number if employees
SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Department d
JOIN Employee e ON d.DeptID = e.DeptID
GROUP BY d.DeptName
ORDER BY TotalEmployees DESC
LIMIT 1;

#find employees whose salary is greater than the average salary of all employees
SELECT FirstName, LastName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);
#create a view named HighSalaryEmployees that shows emloyees with salary greater than 60,000
CREATE VIEW HighSalaryEmployees AS
SELECT *
FROM Employee
WHERE Salary > 60000;
# to check view 
SELECT * FROM HighSalaryEmployees;

#create an index on the LastName column of the EMPLOYEE table
CREATE INDEX idx_lastname
ON Employee (LastName);

# to see the index
SHOW INDEX FROM Employee;

