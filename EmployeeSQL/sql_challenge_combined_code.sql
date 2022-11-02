
CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title varchar(5) NOT NULL,
    birth_date varchar(10) NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date varchar(10) NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE departments (
    dept_no varchar(4) NOT NULL,
    dept_name varchar NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(4) NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE dept_manager (
    dept_no varchar(4) NOT NULL,
    emp_no int NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE titles (
    title_id varchar(5) NOT NULL,
    title varchar NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title FOREIGN KEY(emp_title)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

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

