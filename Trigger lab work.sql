#STORED PROCEDURE
create database BankDB;
USE BankDB;
create table accounts (
account_id INT,
account_holder VARCHAR(255),
balance DECIMAL(15,2)
);
insert INTO accounts VALUES
(1, 'Supriya Shrestha', 19999),
(2, 'Genelia Pradhan', 20099),
(3, 'Gracy Maharjan', 13999);
SELECT *FROM accounts;
ALTER TABLE accounts ADD PRIMARY KEY (account_id);

# write the transaction that transfers rs. 5000 from genelia's account to supriya
start transaction;
update accounts set balance = balance - 5000 
where account_id =2;
update accounts set balance = balance + 5000 
where account_id = 1;
commit;

# write the transaction that transfers rs. 10000 from genelia's account to gracy and demonstrate the use of rollback
start transaction;
update accounts set balance = balance - 10000 
where account_id =2;
update accounts set balance = balance + 10000 
where account_id = 3;
rollback;

# write the transaction that demonstrates the use of SAVEPOINT while updating account balances
start transaction;
update accounts set balance = balance - 2000
where account_id = 2;
savepoint sp1;
update accounts set balance = balance + 2000
where account_id = 1;
rollback to sp1;
commit;

#Triggers CASE
create table employees (
emp_id INT primary key,
emp_name VARCHAR(255),
salary DECIMAL(15,2)
);

#important log table
create table salary_log (
log_id int auto_increment primary key,
emp_id int,
old_salary decimal (15,2),
new_salary decimal (15,2),
updated_at timestamp default current_timestamp
);

#create a befire insert trigger on employees that prevents inserting employees whose salary is less than 10000.
Delimiter $$
create trigger check_salary
before insert on employees
for each row
BEGIN
if new.salary < 10000 then
signal sqlstate '45000'
set message_text = 'salary must be atleast 10000';
end if ;
END
$$
Delimiter ;

# create an affter update trigger on employees that records salary changes into the salary_log table.
Delimiter $$
create trigger salary_update
after update on employees
for each row
BEGIN
insert into salary_log(emp_id, old_salary, new_salary)
values
(old.emp_id, old.salary, new.salary);
END
$$
Delimiter ;
#stored procedure
#!. create a stored procedures that retrieves all records from the employees table
Delimiter $$
create procedure getEmployees()
Begin
select *from employees;
end
$$
Delimiter ;
call getEmployees();

#parameters
#2. create a stored procedure that inserts a new employee into the employees table using parameters.
Delimiter $$
create procedure addEmployee(
in p_id int, in p_name varchar(100), in p_salary decimal(10,2))
begin
insert into employees 
values (p_id, p_name, p_salary);
end
$$
Delimiter ;
call addEmployee(6, 'Odesa', 20000);
select *from employees;

#3. create a stored procedure that updates the salary of an employee based on employee ID.
DELIMITER $$
CREATE PROCEDURE updatedSalary(
    IN p_id INT, 
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = p_salary   
    WHERE emp_id = p_id;
END $$
DELIMITER ;
CALL updatedSalary(1, 31000);

#4. create a stored procedure that transfers money between two accounts using a transation;
Delimiter $$
create procedure tranferMoney(
in from_account int, to_account int, in amount decimal (10,2))
begin
start transaction;
update accounts
set balance = balance - amount 
where
account_id = from_account;
update accounts
set balance = balance + amount 
where
account_id = to_account;
commit;
end
$$
Delimiter ;
call tranferMoney (2,1,5000);

