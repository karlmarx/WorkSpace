DROP DATABASE IF EXISTS WarhorseDB;
CREATE DATABASE WarhorseDB;
USE WarhorseDB;

create table user_role (
user_role_id int primary key auto_increment,
name varchar(30) not null,
description varchar(140) not null
);

create table job_role (
job_role_id int primary key auto_increment,
name varchar(30) not null,
description varchar(140),
department_name varchar(30)
);

create table category (
category_id int primary key auto_increment,
name varchar(30),
description varchar(140) 
);

create table event (
event_id int primary key auto_increment,
name varchar(30),
category_id int,
foreign key (category_id)
references category(category_id),
start_time datetime,
end_time datetime,
description varchar(140),
location varchar(140)
);

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    user_role_id INT NOT NULL,
    job_role_id INT NOT NULL,
    email VARCHAR(320),
    password VARCHAR(20),
    emergency_contact_name VARCHAR(100),
    emergency_contact_number CHAR(10),
    address VARCHAR(500),
    hire_date DATE,
    termination_date DATE,
    onsite_clearance VARCHAR(10) NOT NULL DEFAULT "LOW",
    hours_of_pto TINYINT,
    SSN CHAR(9),
    manager_id INT,
    FOREIGN KEY (job_role_id)
        REFERENCES job_role (job_role_id),
	FOREIGN KEY (user_role_id)
        REFERENCES user_role (user_role_id)
    );
    
create table event_attendee (
employee_id int not null,
foreign key (employee_id)
references employee(employee_id),
event_id int not null,
PRIMARY KEY pk_Event_Attendee (employee_id , event_id),
foreign key (event_id)
references event(event_id)
);

CREATE TABLE Employee_of_Week (
	employee_of_week_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    week_of_date DATE NOT NULL,
    description VARCHAR(500),
    FOREIGN KEY (employee_id)
        REFERENCES Employee (employee_id)
	);
    
CREATE TABLE Contact (
	contact_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    type VARCHAR(10),
    number CHAR(10),
    FOREIGN KEY (employee_id)
        REFERENCES Employee (employee_id)
    );