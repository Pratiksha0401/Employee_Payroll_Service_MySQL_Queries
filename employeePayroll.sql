show databases;

#UC1 
create database employee_payroll_service;
use employee_payroll_service;
select database();

#UC2
create table employee_payroll
(
	id INT unsigned NOT NULL AUTO_INCREMENT,
	name VARCHAR(150) NOT NULL,
    salary double NOT NULL ,
    start DATE NOT NULL,
    primary key (id)
);
describe employee_payroll;

#UC3
insert into employee_payroll (name,salary,start) values
	('Bill',1000000.0,'2018-01-03'),
    ('Mark',2000000.0,'2019-11-13'),
    ('Charlie',3000000.0,'2020-05-21');
    
#UC4    
select * from employee_payroll;  

#UC5
select salary from employee_payroll where name='Bill';
select * from employee_payroll where start between cast( '2018-01-01' as date) and date((now()));

#UC6
alter table employee_payroll add gender char(1) not null after name  ;
update employee_payroll_service.employee_payroll set gender ='F' where name='Charlie';
select * from employee_payroll;
update employee_payroll set gender ='M' where name='Bill' or name='Mark';
select * from employee_payroll;

#UC7
select sum(salary) from employee_payroll where gender='M' group by gender;
select avg(salary) from employee_payroll where gender='M' group by gender;
select max(salary) from employee_payroll;
select min(salary) from employee_payroll;
select count(id) from employee_payroll;

#UC8
alter table employee_payroll add phone_number int(10) not null ;
alter table employee_payroll modify phone_number int(10) after name;
select * from employee_payroll;
update employee_payroll set phone_number='1325469781' where name='Bill';
select * from employee_payroll;
update employee_payroll set phone_number='978546132' where name='Mark';
select * from employee_payroll;
update employee_payroll set phone_number='654978132' where name='Charlie';
select * from employee_payroll;
alter table employee_payroll add address varchar(225) not null  default 'Mumbai,Maharashtra' after phone_number ;
select * from employee_payroll;
alter table employee_payroll add department varchar(50) not null after address;
update employee_payroll set department='Finance' where name='Bill';
update employee_payroll set department='Marketing' where name='Mark';
update employee_payroll set department='Consultanting' where name='Charlie';
select * from employee_payroll;

#UC9
alter table employee_payroll drop salary;
alter table employee_payroll add basic_pay float(10) not null default '500000.0' after department;
select * from employee_payroll;
alter table employee_payroll add Deductions float(10) not null default '60000.0' after basic_pay;
select * from employee_payroll;
alter table employee_payroll add Taxable_pay float(10) not null default '7000.0' after Deductions;
alter table employee_payroll add Income_Tax float(10) not null default '200000.0' after Taxable_pay;
alter table employee_payroll add Net_Pay float(10) not null default '1000000.0' after Income_Tax;
select * from employee_payroll;

#UC11
create table employee_department
(
	id INT unsigned NOT NULL AUTO_INCREMENT,
    department varchar(50) not null,
    primary key (id)
);
insert into employee_department (department) values ('Finance'),('Marketing'),('Consultanting');
select * from employee_department;

#UC12
select * from employee_payroll emp1 , employee_department emp2
		 where  emp1.id=emp2.id;
select sum(Net_Pay) from employee_payroll emp1 , employee_department emp2
		 where  emp1.id=emp2.id;
select gender,sum(Net_Pay) from employee_payroll emp1 , employee_department emp2
		 where  emp1.id=emp2.id group by gender;
select gender,avg(Net_Pay) from employee_payroll emp1 , employee_department emp2
		 where  emp1.id=emp2.id group by gender; 
select count(name) from employee_payroll emp1 , employee_department emp2
		 where  emp1.id=emp2.id group by gender; 
select count(name) from employee_payroll emp1 , employee_department emp2
		 where  emp1.id=emp2.id ; 

