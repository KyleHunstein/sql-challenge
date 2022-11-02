--Data Analysis
--Question 1
SELECT 
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.sex, 
	salaries.salary
FROM employees
LEFT OUTER JOIN salaries ON 
employees.emp_no=salaries.emp_no;

-- Question 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'

--Question 3
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.first_name, 
	employees.last_name
FROM dept_manager
LEFT OUTER JOIN departments ON dept_manager.dept_no = departments.dept_no
LEFT OUTER JOIN employees ON dept_manager.emp_no = employees.emp_no
;

--Question 4
SELECT
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM employees
LEFT OUTER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
LEFT OUTER JOIN departments ON dept_emp.dept_no=departments.dept_no
;

--Question 5
SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE 
	first_name = 'Hercules'
AND 
	last_name LIKE 'B%'	
;

--Question 6
SELECT
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM employees
LEFT OUTER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
LEFT OUTER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales'

--Question 7
SELECT
	employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM employees
LEFT OUTER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
LEFT OUTER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE 
	departments.dept_name = 'Sales'
OR 
	departments.dept_name = 'Development'
;

--Question 8
SELECT
	last_name,
	COUNT(last_name) 
FROM employees
GROUP BY 
	last_name
ORDER BY 
	COUNT(last_name)
DESC
;

