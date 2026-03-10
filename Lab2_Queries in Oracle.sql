CREATE TABLE employee(
    EmployeeID VARCHAR2(20) PRIMARY KEY,
    FirstName VARCHAR2(20),
    LastName VARCHAR2(20),
    Gender CHAR(1),
    DateofBirth DATE,
    Designation VARCHAR2(50),
    DepartmentName VARCHAR2(20),
    ManagerId VARCHAR2(20),
    JoinedDate DATE,
    Salary NUMBER(10)
);

INSERT INTO employee (
EmployeeID, FirstName, LastName, Gender, DateofBirth, Designation,
DepartmentName, ManagerId, JoinedDate, Salary
) VALUES (
'0004','Supriya','Shrestha','F',
DATE '2007-10-26','Engineer',
'Software Engineering','0005',
DATE '2022-04-02',5000000
);

INSERT INTO employee (
EmployeeID, FirstName, LastName, Gender, DateofBirth, Designation,
DepartmentName, ManagerId, JoinedDate, Salary
) VALUES (
'0012','Subasna','Rai','F',
DATE '2000-04-02','Manager',
'Software Engineering','0003',
DATE '2022-04-02',1000000
);

SELECT * FROM employee;

UPDATE employee
SET Gender = 'F'
WHERE EmployeeID = '0009';

SELECT FirstName,
       DateofBirth,
       SYSDATE AS CurrentDate,
       FLOOR(MONTHS_BETWEEN(SYSDATE, DateofBirth)/12) AS Age
FROM employee
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, DateofBirth)/12) > 25;

SELECT FirstName, LastName, DateofBirth,
       FLOOR(MONTHS_BETWEEN(SYSDATE, DateofBirth)/12) AS Age
FROM employee
ORDER BY DateofBirth ASC;

SELECT DepartmentName, MAX(Salary) AS max_salary
FROM employee
GROUP BY DepartmentName;

SELECT FirstName
FROM employee
WHERE EmployeeID IN (
    SELECT ManagerID FROM employee
);

SELECT *
FROM employee
WHERE JoinedDate = (
    SELECT MAX(JoinedDate) FROM employee
);