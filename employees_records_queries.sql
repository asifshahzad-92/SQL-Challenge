-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
	JOIN salaries as s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired during the year 1986.
SELECT
	first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager's department number, department name, employee number, last name, and first name of each department along with their.
SELECT 
	d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments as d
	JOIN dept_manager as dm ON d.dept_no = dm.dept_no
	JOIN employees as e ON dm.emp_no = e.emp_no
ORDER BY d.dept_no;

-- 4. List the department number, employee number, last name, first name, and department name for each employee.
SELECT 
	e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees as e
	JOIN dept_emp as de ON e.emp_no = de.emp_no
	JOIN departments as d ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- 5. List first name, last name, and sex of employee whose first name is Hercules and last name begins with B.
SELECT first_name, last_name, sex 
FROM employees 
WHERE 
	first_name = 'Hercules'
	AND
	last_name LIKE 'B%'

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
	JOIN dept_emp as de ON e.emp_no = de.emp_no
	JOIN departments as d ON de.dept_no = d.dept_no
		WHERE dept_name = 'Sales';
		
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
		WHERE d.dept_name IN ('Sales', 'Development')


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
	last_name, COUNT(last_name) as frequency_counts
FROM employees 
GROUP BY last_name
ORDER BY frequency_counts DESC;
