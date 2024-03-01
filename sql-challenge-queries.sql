--SQL CHALLENGE
--DATA ANALYSIS
--1. List the employee number, last name, first name, sex, and salary of 
--each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e 
JOIN salaries s ON s.emp_no = e.emp_no; 


-- 2. List the last name, first name, and hire date for the employees who 
-- were hired in 1986.
-- https://bootcampspot.instructure.com/courses/4981/external_tools/313
-- provided correct formatting for date values
SELECT last_name, first_name, hire_date 
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


-- 3. List the manager of each department along with their department 
-- number, department name, employee number, last name, and first name.
-- https://bootcampspot.instructure.com/courses/4981/external_tools/313
-- provided correct WHERE statement
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name 
FROM departments d 
JOIN dept_manager m ON m.dept_no = d.dept_no 
JOIN employees e ON m.emp_no = e.emp_no 
WHERE e.emp_no IN (SELECT emp_no FROM dept_manager);


-- 4. List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
CREATE VIEW details_employees AS
SELECT p.emp_no, p.dept_no, d.dept_name, e.last_name, e.first_name
FROM dept_emp p
JOIN departments d ON p.dept_no = d.dept_no
JOIN employees e ON p.emp_no = e.emp_no;
SELECT * FROM details_employees;

-- 5. List first name, last name, and sex of each employee whose first 
-- name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- 6. List each employee in the Sales department, including their 
-- employee number, last name, and first name
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);	


-- 7. List each employee in the Sales and Development departments, 
-- including employee number, last name, first name, and dept name. 
-- https://bootcampspot.instructure.com/courses/4981/external_tools/313
-- provided correct WHERE statement
CREATE VIEW sales_develop AS
SELECT d.dept_name, p.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp p ON p.dept_no = d.dept_no
JOIN employees e ON e.emp_no = p.emp_no 
WHERE d.dept_name IN ('Sales','Development');
-- View results
SELECT * FROM sales_develop;


-- 8. List the frequency counts, in descending order, of all the employee last names 
SELECT last_name, COUNT(last_name) AS "last_name_counts"
FROM employees
GROUP BY last_name
ORDER BY "last_name_counts" DESC;