# Datasets used: employee.csv and membership.csv

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Schema EmpMemb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS EmpMemb;
USE EmpMemb;


-- 1. Create a table Employee by refering the data file given. Follow the instructions given below: 
-- -- Q1. Values in the columns Emp_id and Members_Exclusive_Offers should not be null.
-- -- Q2. Column Age should contain values greater than or equal to 18.
-- -- Q3. When inserting values in Employee table, if the value of salary column is left null, then a value 20000 should be assigned at that position. 
-- -- Q4. Assign primary key to Emp_ID
-- -- Q5. All the email ids should not be same.

create table employee (
Emp_id varchar(100) not null primary key,
Members_Exclusive_Offers int not null,
age int check(age>=18),
salary decimal(10,2) default 20000,
email_id varchar(100) unique
);
desc employee;


-- 2. Create a table Membership by refering the data file given. Follow the instructions given below: 
-- -- Q6. Values in the columns Prime_Membership_Active_Status and Employee_Emp_ID should not be null.
-- -- Q7. Assign a foreign key constraint on Employee_Emp_ID.
-- -- Q8. If any row from employee table is deleted, then the corresponding row from the Membership table should also get deleted.
create table Membership(
Prime_Membership_Active_Status varchar(20) not null,
Emp_ID varchar(20) not null,
constraint fk_Emp_ID foreign key(Emp_ID) references employee(Emp_ID)
on update cascade
); 
desc membership;