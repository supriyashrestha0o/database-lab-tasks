CREATE DATABASE testDB;
DROP DATABASE testDB;
#again creating after deleting the database for further sql program
CREATE DATABASE testDB;
#creating table
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
#displaying table
SELECT *FROM Persons;

#using ALTER: add, delete, rename columns
ALTER TABLE Persons
ADD Email varchar(255);

#renaming the column name
ALTER TABLE Persons
RENAME COLUMN City to Designation;

#displaying table
SELECT *FROM Persons;

#personID not null
ALTER TABLE Persons
MODIFY COLUMN PersonID int NOT NULL;

#age not null
ALTER TABLE Persons
ADD Age int NOT NULL;

#inserting values
INSERT INTO Persons (PersonID, LastName, FirstName, Address, Designation, Email, Age)
VALUES ('101', 'Shrestha', 'Supriya', 'Kathmandu', 'Manager', 'supriya11@gmail.com', '19'),
('102', 'Maharjan', 'Shreya', 'Patan', 'Founder', 'shreya089@gmail.com', '20'),
('205', 'Thapa', 'Armita', 'Lalitpur', 'Officer', 'armita2007@gmail.com', '21'),
('406', 'Adhikari', 'Binaya', 'Dharan', 'Marketing Officer', 'thebinaya@gmail.com', '22');

#displaying values in a table
SELECT *FROM Persons;

#selecting PersonID, firstname and email
SELECT PersonID, FirstName, Email FROM Persons;

#operators
#OR
SELECT *FROM Persons
WHERE Address = 'Kathmandu' OR Age = '20';
#AND
SELECT *FROM Persons
WHERE Address = 'Patan' AND Age = '20';
#NOT
SELECT * FROM Persons
WHERE NOT Age = '22';

#join

DROP TABLE Office;

CREATE TABLE Persons;

--------------------------
SELECT *FROM Persons;
CREATE TABLE Office (
    OfficeNo int,
    OfficeName varchar(255),
    Salary int
);
INSERT INTO Office (OfficeNo, OfficeName, Salary)
VALUES ('008', 'Kanchanjungha', '100000'),
('002', 'Annapurna', '90000'),
('006', 'Lhotse', '120000');

CREATE TABLE Persons (
    PersonID int PRIMARY KEY,
    FirstName varchar(255),
    Designation varchar(255),
    OfficeNo int
);

INSERT INTO Persons (PersonID, FirstName, Designation, OfficeNo)
VALUES 
(101, 'Alice', 'Manager', 8),
(102, 'Bob', 'Developer', 2),
(103, 'Charlie', 'Designer', 6);

SELECT 
    Persons.PersonID, 
    Persons.FirstName, 
    Persons.Designation, 
    Office.OfficeName, 
    Office.Salary
FROM Persons
INNER JOIN Office ON Persons.OfficeNo = Office.OfficeNo;



 