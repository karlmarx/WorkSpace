DROP DATABASE IF EXISTS WarhorseDB;
CREATE DATABASE WarhorseDB;
USE WarhorseDB;

CREATE TABLE Employee_of_Week (
	employee_of_week_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    week_of_date DATE NOT NULL,
    description VARCHAR(500) NOT NULL,
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

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    user_role_id INT NOT NULL,
    job_role_id INT NOT NULL,
    email VARCHAR(320) NOT NULL,
    password VARCHAR(20) NOT NULL,
    emergency_contact_name VARCHAR(100) NOT NULL,
    emergency_contact_number CHAR(10) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100)NOT NULL,
    state CHAR(2) NOT NULL,
    zip CHAR(5) NOT NULL,
    hire_date DATE NOT NULL,
    termination_date DATE,
    onsite_clearance VARCHAR(10) NOT NULL,
    hours_of_pto TINYINT NOT NULL,
    SSN CHAR(9) NOT NULL,
    manager_id INT,
    FOREIGN KEY (job_role_id)
        REFERENCES job_role (job_role_id),
	FOREIGN KEY (user_role_id)
        REFERENCES user_role (user_role_id)
    );