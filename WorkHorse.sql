DROP DATABASE IF EXISTS WorkHorseDB;
CREATE DATABASE WorkHorseDB;
USE WorkHorseDB;

create table user_role
(
    user_role_id int primary key auto_increment,
    name         varchar(30)  not null,
    description  varchar(140) not null
);

create table job_role
(
    job_role_id     int primary key auto_increment,
    name            varchar(30) not null,
    description     varchar(140),
    department_name varchar(30)
);

create table category
(
    category_id int primary key auto_increment,
    name        varchar(30),
    description varchar(140)
);

create table event
(
    event_id    int primary key auto_increment,
    name        varchar(30),
    category_id int,
    foreign key (category_id)
        references category (category_id),
    start_time  datetime,
    end_time    datetime,
    description varchar(140),
    location    varchar(140),
    latitude    decimal(9, 6) not null default 42.434718,
    longitude   decimal(9, 6) not null default -84.002509,
    is_required TINYINT       not null default 0
);

create table event_category
(
    event_id    int not null,
    foreign key (event_id)
        references event (event_id),
    category_id int not null,
    PRIMARY KEY pk_Event_Attendee (category_id, event_id),
    foreign key (category_id)
        references category (category_id)
);

CREATE TABLE Employee
(
    employee_id              INT PRIMARY KEY AUTO_INCREMENT,
    first_name               VARCHAR(50),
    last_name                VARCHAR(50),
    user_role_id             INT         NOT NULL,
    job_role_id              INT         NOT NULL,
    email                    VARCHAR(320),
    password                 VARCHAR(20),
    emergency_contact_name   VARCHAR(100),
    emergency_contact_number CHAR(10),
    address                  VARCHAR(500),
    hire_date                DATE,
    termination_date         DATE,
    hours_of_pto             TINYINT,
    SSN                      CHAR(9),
    manager_id               INT,
    is_good                  TINYINT     not null DEFAULT 0,
    image_url                CHAR(2083),
    is_hr                    TINYINT     not null DEFAULT 0,
    is_admin                 tinyint     not null default 0,
    FOREIGN KEY (job_role_id)
        REFERENCES job_role (job_role_id),
    FOREIGN KEY (user_role_id)
        REFERENCES user_role (user_role_id)
);

create table event_employee_invited
(
    employee_id int not null,
    foreign key (employee_id)
        references employee (employee_id),
    event_id    int not null,
    PRIMARY KEY  (employee_id, event_id),
    foreign key (event_id)
        references event (event_id)
);
create table event_employee_attending
(
    employee_id int not null,
    foreign key (employee_id)
        references employee (employee_id),
    event_id    int not null,
    PRIMARY KEY  (employee_id, event_id),
    foreign key (event_id)
        references event (event_id)
);


CREATE TABLE Employee_of_Week
(
    employee_of_week_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id         INT  NOT NULL,
    week_of_date        DATE NOT NULL,
    description         VARCHAR(500),
    FOREIGN KEY (employee_id)
        REFERENCES Employee (employee_id)
);

CREATE TABLE Contact
(
    contact_id  INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    type        VARCHAR(10),
    number      CHAR(10),
    FOREIGN KEY (employee_id)
        REFERENCES Employee (employee_id)
);
CREATE TABLE org_group
(
    org_group_id int primary key auto_increment,
    group_name   varchar(40)
);
create table employee_org_group
(
    employee_id int not null,
    foreign key (employee_id)
        references employee (employee_id),
    org_group   int not null,
    foreign key (org_group)
        references org_group (org_group_id),
    PRIMARY KEY (employee_id, org_group)
);

