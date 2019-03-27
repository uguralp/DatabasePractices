create database Company
go

use Company

create table Journal(
PartID varchar(50) not null,
Customer varchar(50) not null,
PartType varchar(50) not null,
Employee varchar(50) not null,
Plant varchar(50) not null,
Time int not null
)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('MOTO001', 'Suzuki', 'Crankshaft','Joe', 'Guelph', 45)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('MOTO001', 'Suzuki', 'Crankshaft', 'Frank', 'Waterloo', 40)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('MOTO002', 'Suzuki', 'Piston', 'Joe', 'Guelph', 20)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('CAR001', 'Suzuki', 'Piston', 'Mary', 'Waterloo', 15)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('CAR001', 'BMW', 'Piston', 'Mary', 'Waterloo', 20)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('MOTO002', 'BMW', 'Piston', 'Mary', 'Waterloo', 10)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('MOTO001', 'BMW', 'Crankshaft', 'Thomas', 'Guelph', 65)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('CAR002', 'BMW', 'Exhaust', 'Thomas', 'Guelph', 110)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('MOTO003', 'Suzuki', 'Exhaust', 'John', 'Waterloo', 45)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('CAR001', 'Suzuki', 'Crankshaft', 'John', 'Waterloo', 25)

insert into Journal(PartID, Customer, PartType, Employee, Plant, Time)
values('CAR001', 'BMW', 'Crankshaft', 'Frank', 'Waterloo', 45)

create database NewCompanyDB
GO
use NewCompanyDB

--The database was split up because it was complicated to track the different information in one place. 
--Now we have 3 tables which we can track every information easily and fast.

/*This table provides the parts that the company has. 
The part should have a unique table because that is the effective option to track them and provide the available ones to the customers. 
For this reason, I split up the part records from the Journal table to the Part table.*/
create table Part(
ID int identity(1,1) not null primary key,
PartID varchar(50) not null,
PartType varchar(50) not null,
Plant varchar(50) not null,
Time int not null
)
/*
This table provides the information of the employees. 
I moved out the employee’s name into the Employee table to track them easily.
*/
create table Employee(
ID int identity(1,1) not null primary key,
name varchar(255) not null
)
/*
This table provides the information about the customers. 
Since the customer has an employee that they were bonded and parts that they bought, there should be a unique customer table to track this information. 
I moved out the customer name into the Customer table and added the PartID and EmployeeID to make a relationship between Part and Employee table.
*/
create table Customer(
ID int identity(1,1) not null primary key,
Name varchar(255) not null,
EmployeeID int not null,
PartID int not null,
foreign key (EmployeeID) references Employee(ID) on delete cascade,
foreign key (PartID) references Part(ID) on delete cascade
)

insert into Part(PartID, PartType, Plant, Time)
select PartID, PartType, Plant, Time from Company.dbo.Journal

insert into Employee(name)
select distinct Employee from Company.dbo.Journal

insert into Customer(Name, EmployeeID, PartID)
select Customer, 
(select top 1 ID from Employee where j.Employee = name),
(select top 1 ID from Part  where j.PartID = PartID )
from Company.dbo.Journal j 