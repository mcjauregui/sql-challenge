# sql-challenge

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, respectively.

SQL Database tables and relationships
![SQL Database](https://github.com/mcjauregui/sql-challenge/blob/main/DB_Model.png)

Specifying the following tables, rows, and relationships produced the schema query shown below:  
departments
---  
dept_no VARCHAR PK  
dept_name VARCHAR

dept_emp  
---  
emp_no VARCHAR PK FK >- salaries.emp_no  
dept_no VARCHAR PK FK >- departments.dept_no  

dept_manager  
----  
dept_no VARCHAR FK >- departments.dept_no  
emp_no  VARCHAR FK - employees.emp_no  

employees  
---  
emp_no VARCHAR PK  
emp_title_id VARCHAR FK >- titles.title_id  
birth_date DATE  
first_name VARCHAR  
last_name VARCHAR  
sex VARCHAR  
hire_date DATE  

salaries  
---  
emp_no VARCHAR PK  
salary INT  

titles  
---  
title_id VARCHAR PK  
title VARCHAR  

***SCHEMA QUERY***  
CREATE TABLE departments (  
    dept_no VARCHAR   NOT NULL,  
    dept_name VARCHAR   NOT NULL,  
    CONSTRAINT pk_departments PRIMARY KEY (  
        dept_no  
     )  
);  

CREATE TABLE dept_emp (  
    emp_no VARCHAR   NOT NULL,  
    dept_no VARCHAR   NOT NULL,  
    CONSTRAINT pk_dept_emp PRIMARY KEY (  
        emp_no,dept_no  
     )  
);  

CREATE TABLE dept_manager (  
    dept_no VARCHAR   NOT NULL,  
    emp_no VARCHAR   NOT NULL  
);  

CREATE TABLE employees (  
    emp_no VARCHAR   NOT NULL,  
    emp_title_id VARCHAR   NOT NULL,  
    birth_date DATE   NOT NULL,  
    first_name VARCHAR   NOT NULL,  
    last_name VARCHAR   NOT NULL,  
    sex VARCHAR   NOT NULL,  
    hire_date DATE   NOT NULL,  
    CONSTRAINT pk_employees PRIMARY KEY (  
        emp_no  
     )  
);  

CREATE TABLE salaries (  
    emp_no VARCHAR   NOT NULL,  
    salary INT   NOT NULL,  
    CONSTRAINT pk_salaries PRIMARY KEY (  
        emp_no  
     )  
);  

CREATE TABLE titles (  
    title_id VARCHAR   NOT NULL,  
    title VARCHAR   NOT NULL,  
    CONSTRAINT pk_titles PRIMARY KEY (  
        title_id  
     )  
);  

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)  
REFERENCES salaries (emp_no);  

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)  
REFERENCES departments (dept_no);  

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)  
REFERENCES departments (dept_no);  

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)  
REFERENCES employees (emp_no);  

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)  
REFERENCES titles (title_id);  

***DATA ANALYSIS***  

![Question 01 Query](https://github.com/mcjauregui/sql-challenge/blob/main/Question01.png)

![Question 02 Query](https://github.com/mcjauregui/sql-challenge/blob/main/Question02.png)

![Question 03 Query](https://github.com/mcjauregui/sql-challenge/blob/main/Question03.png)

![Question 04 Query](https://github.com/mcjauregui/sql-challenge/blob/main/Question04.png)

![Question 05 Query](https://github.com/mcjauregui/sql-challenge/blob/main/Question05.png)

![Question 06 Query a](https://github.com/mcjauregui/sql-challenge/blob/main/Question06_01.png)

![Question 06 Query b](https://github.com/mcjauregui/sql-challenge/blob/main/Question06_02.png)

![Question 07 Query a](https://github.com/mcjauregui/sql-challenge/blob/main/Question07_01.png)

![Question 07 Query b](https://github.com/mcjauregui/sql-challenge/blob/main/Question07_02.png)

![Question 08](https://github.com/mcjauregui/sql-challenge/blob/main/Question08.png)


