# sql-challenge

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, respectively.

SQL Database tables and relationships
![SQL Database](https://github.com/mcjauregui/sql-challenge/blob/main/DB_Model.png)

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
