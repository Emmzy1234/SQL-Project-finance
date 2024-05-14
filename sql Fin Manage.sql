-- employee_db--

create database if not exists Employee_db;
drop database employer_db;


use Employee_db;

create table employee (
	   employee_id int auto_increment primary key,
       firstname varchar(14) not null,
       lastname varchar(14) not null,
       birthdate date not null,
       gender Enum('M','F') not null,
       Hiredate date not null
       );
       
create table Department (
       Department_id char(14) auto_increment primary key,
       Departmentname varchar(40) not null unique
		);	
        
        create table Department (
       Department_id char(14) auto_increment primary key,
       Departmentname varchar(40) not null unique
		);	

drop table department;

create table dept_manager (
        employee_id int not null,
        department_id char(4) not null,
        fromdate date not null,
        Todate date not null,
        foreign key (employee_id) references employee(employee_id),
        foreign key (department_id) references department(department_id)
        );
        
 create table Dept_employee(
         employee_id int not null,
        department_id char(4) not null,
        fromdate date not null,
        Todate date not null,
        foreign key (employee_id) references employee(employee_id),
        foreign key (department_id) references department(department_id)
        );
        
 
        
        drop table title;
        
        create table title(
			   employee_id int not null,
               title varchar(50) unique not null,
               fromdate date not null,
               todate date not null,
               foreign key(employee_id) references employee(employee_id)
               );
               
        
        
        
  create table salaries(
		employee_id int not null,
        salary double not null,
        fromdate date not null,
        Todate date not null,
        foreign key (employee_id) references employee(employee_id)
        );
        
 insert into department (department_id, departmentname)
 values ('d001', 'marketing'),
        ('d002', 'finance'),
        ('d003', 'human resource'),
        ('d004', 'production'),
        ('d005', 'development'),
        ('d006', 'quality management'),
        ('d007', 'sales'),
        ('d008', 'research'),
        ('d009', 'customer service');
        
        drop table department;
        drop table department;
        truncate table department;
        
       
       
       select distinct *
        from department
        order by department_id asc;
        
------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- what is the salary of a specific employee with employeeNo = 1016 --

   select employee_id, salary
   from salaries
   having employee_id = '1016';
   
   -- What is the average salary of male employees in the company? --
   
   select avg(salary)
   from salaries
   inner join employee on salaries.employee_id= employee.employee_id
   where gender = 'm';
   
   -- to create view --
   
   
   create view avg_male_salary as
   select employee.gender, avg(salaries.salary)
   from employee 
   inner join salaries on employee.employee_id = salaries.employee_id
   where employee.gender = 'm'
   group by employee.gender;
   
   -- to get the above stored query--
   
   select *
   from avg_male_salary;
   
   select birthdate,
        year(current_date())- year(birthdate) as age
   from employee;  
   
   -- create a view called employee details with firstname and lastname of every employee --
   
   create view employee_details as
   select firstname, lastname
   from employee;
   
   select *
   from employee
   where employee_id = '1015';
   
   delete from employee 
   where employee_id = '1015';
      
   
   
   -- What is the average salary of Female employees in the company? --
    select avg(salary)
   from salaries
   inner join employee on salaries.employee_id= employee.employee_id
   where gender = 'f';
   
   select avg(salary)
   from salaries
   inner join employee on salaries.employee_id = employee.employee_id
   where gender = 'f';
-- How many employees are there in each department? --
select *
from department;





Select *
from department;

-- to create index --
create index firstname_idx
on employee(firstname);




   

   -- what is the salary of a specific employee with employeeNo = 1016 --

   select employee_id, salary
   from salaries
   having employee_id = '1016';
   
    -- What is the average salary of male employees in the company? --
   
   select avg(salary)
   from salaries
   inner join employee on salaries.employee_id= employee.employee_id
   where gender = 'm';
   
           
	-- question 5 youngest age --
    select firstname, lastname, birthdate
    from employee
    order by birthdate desc
    limit 1;
    
    -- question 5 --
    select departmentname, avg(salary)
    from dept_employee
    inner join department on dept_employee.department_id= department.department_id
    inner join salaries on dept_employee.employee_id = salaries.employee_id
    group by departmentname;
        
 
        