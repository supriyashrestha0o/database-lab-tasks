create database jointable;
create table employees (
	employeeID INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(255),
    departmentID int
    );
    
INSERT INTO employees (name, departmentID)
VALUES('Homer Simpson',4),
('Ned Flanders', 1),
('Barney Gumble', 5),
('Claney Wiggum', 3),
('Moe Syzslak', NULL);

create table departments (
departmentID INT PRIMARY KEY AUTO_INCREMENT,
department_name varchar(255)
);

INSERT INTO departments (department_name)
VALUES ('Sales'), ('Engineering'), ('Human Resources'), ('Customer Service'), ('Research And Development');

SELECT *FROM employees;
SELECT *FROM departments;

SELECT employees.name, departments.department_name
FROM employees
JOIN departments ON employees.departmentID = departments.departmentID;

#left join: Prioritizes the Left table (employees). You get every employee. If an employee (like Moe) isn't assigned to a department, the department columns just show NULL.
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.departmentID = departments.departmentID;

#right join: RIGHT JOIN: Prioritizes the Right table (departments). You get every department. If a department (like "Research and Development") has no employees assigned to it, the employee columns show NULL.
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.departmentID = departments.departmentID;

#cross join: Prioritizes nothing. It ignores the departmentID connection entirely and just mashes every possible name with every possible department
SELECT employees.name, departments.department_name
FROM employees
CROSS JOIN departments;
