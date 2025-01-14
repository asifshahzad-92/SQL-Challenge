-- Create Tables to Import Data
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Creating Temporary Table for data Formatting

CREATE TABLE employees_temp (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id CHAR(5) NOT NULL,
    birth_date TEXT, 
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20),
    sex CHAR(1) NOT NULL,
    hire_date TEXT NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

INSERT INTO employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
SELECT 
	et.emp_no, 
	et.emp_title_id, 
	TO_DATE(et.birth_date, 'MM-DD-YYYY'),
	et.first_name, 
	et.last_name,
	et.sex,
	TO_DATE(et.hire_date, 'MM-DD-YYYY')
FROM employees_temp AS et;


SELECT * FROM employees;

DROP TABLE employees_temp;