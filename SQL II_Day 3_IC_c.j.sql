# Datasets used: AirlineDetails.csv, passengers.csv and senior_citizen.csv
-- -----------------------------------------------------
-- Schema Airlines
create database Airlines;
use Airlines;
-- -----------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a table Airline_Details. Follow the instructions given below: 
-- -- Q1. Values in the columns Flight_ID should not be null.
-- -- Q2. Each name of the airline should be unique.
-- -- Q3. No country other than United Kingdom, USA, India, Canada and Singapore should be accepted
-- -- Q4. Assign primary key to Flight_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

Create table if not exists Airline_Details (
  Flight_ID INT NOT NULL primary key,
  Airline varchar(50) null unique,
  Country varchar(50) null check (Country IN ('United Kingdom, USA, India, Canada, Singapore ')),
  Punctuality float NULL,
  Service_Quality float null,
  AirHelp_Score float null
  );

-- 2. Create a table Passengers. Follow the instructions given below: 
-- -- Q1. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q2. Only passengers having age greater than 18 are allowed.
-- -- Q3. Assign primary key to Traveller_ID

create table if not exists Passengers (
	Traveller_ID varchar(5) NOT NULL,
    Name varchar(50) NULL,
    PNR varchar(10) NOT NULL,
    Flight_ID INT NULL,
    Ticket_Price INT NULL,
    age int check (age>18),
    primary key (Traveller_ID)
    );
-- Questions for table Passengers:  
-- -- Q3. PNR status should be unique and should not be null.

alter table passengers
modify PNR varchar(10) not null unique;

-- -- Q4. Flight Id should not be null.

alter table passengers
modify Flight_ID int not null;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Create a table Senior_Citizen_Details. Follow the instructions given below: 
-- -- Q1. Column Traveller_ID should not contain any null value.
-- -- Q2. Assign primary key to Traveller_ID
-- -- Q3. Assign foreign key constraint on Traveller_ID such that if any row from passenger table is updated, then the Senior_Citizen_Details table should also get updated.
-- -- --  Also deletion of any row from passenger table should not be allowed.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

create table Senior_Citizen_Details (
Traveller_id varchar(5) not null,
Senior_Citizen varchar(5),
Discounted_price int,
primary key (Traveller_id),
constraint fk_Traveller_id foreign key(Traveller_id) references Passengers(Traveller_id)
on update cascade
on delete restrict
);
desc Senior_Citizen_Details;
-- -----------------------------------------------------
-- Table Senior_Citizen_Details
-- -- Q6. Create a new column Age in Passengers table that takes values greater than 18. 
 #done in question 2.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Create a table books. Follow the instructions given below: 
-- -- Columns: books_no, description, author_name, cost
-- -- Qa. The cost should not be less than or equal to 0.
-- -- Qb. The cost column should not be null.
-- -- Qc. Assign a primary key to the column books_no.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

create table books (
	books_no varchar(18) primary key,
	description varchar(250),
	author varchar(250),
	cost decimal(10,2) not null 
	check (cost > 0));

# Q8. Update the table 'books' such that the values in the columns 'description' and author' must be unique.

alter table books
add constraint uni_desc_auth unique(description, author);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Create a table bike_sales. Follow the instructions given below: 
-- -- Columns: id, product, quantity, release_year, release_month
-- -- Q1. Assign a primary key to ID. Also the id should auto increment.
-- -- Q2. None of the columns should be left null.
-- -- Q3. The release_month should be between 1 and 12 (including the boundries i.e. 1 and 12).
-- -- Q4. The release_year should be between 2000 and 2010.
-- -- Q5. The quantity should be greater than 0.

create table bike_sales(
id int not null primary key  auto_increment,
product varchar(500) not null,
quantity int not null check (quantity >0),
release_year year not null check(release_year between 2000 and 2010),
release_month int not null
check (release_month between 1 and 12)
);
-- --------------------------------------------------------------------------
-- Use the following comands to insert the values in the table bike_sales
/*('1','Pulsar','1','2001','7');
('2','yamaha','3','2002','3');
('3','Splender','2','2004','5');
('4','KTM','2','2003','1');
('5','Hero','1','2005','9');
('6','Royal Enfield','2','2001','3');
('7','Bullet','1','2005','7');
('8','Revolt RV400','2','2010','7');
('9','Jawa 42','1','2011','5');*/
-- --------------------------------------------------------------------------
insert into bike_sales  values (1,'Pulsar',1,2001,7);
insert into bike_sales  values(2,'yamaha',3,2002,3);
insert into bike_sales  values(3,'Splender',2,2004,5);
insert into bike_sales  values(4,'KTM',2,2003,1);
insert into bike_sales values(5,'Hero',1,2005,9);
insert into bike_sales values(6,'Royal Enfield',2,2001,3);
insert into bike_sales  values(7,'Bullet',1,2005,7);
insert into bike_sales values(8,'Revolt RV400',2,2010,7);
insert into bike_sales values(9,'Jawa 42',1,2011,5); 

#select * from bike_sales; 
#unlock tables;...
