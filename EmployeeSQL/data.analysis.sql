--- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--- List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--- List the department number for each employee along with that employee's employee number, last name, first name, and department name
SELECT departments.dept_name, employees.emp_no, employees.first_name, employees.last_name, dept_manager.dept_no
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%';

--- List each employee in Sales department, including their employee number, last name, first name, and department name 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

--- List each employee in the Sales and Development departments, including their employee number, last name, frist name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT employees.last_name
COUNT(last_name) AS 'frequency'
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;