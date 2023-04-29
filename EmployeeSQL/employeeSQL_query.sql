--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no as "Employee Number", 
	e.last_name as "Last Name", 
	e.first_name as "First Name",
	e.sex as "Sex",
	s.salary as "Salary"
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT e.first_name as "First Name",
		e.last_name as "Last Name",
		e.hire_date AS "Hire Date"
FROM employees e
WHERE e.hire_date >= '01/01/1986' 
	AND e.hire_date <= '12/31/1986'
ORDER BY e.hire_date;


--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name (2 points)
SELECT dpt.dept_no AS "Department Number",
		dpt.dept_name AS "Department Name",
		dptm.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name"
FROM departments dpt
JOIN dept_manager dptm
ON dpt.dept_no = dptm.dept_no
JOIN employees e
ON e.emp_no = dptm.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, 
--first name, and department name (2 points)
SELECT dpt.dept_no AS "Department Number",
		empt.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		dpt.dept_name AS "Department Name"
FROM departments dpt
JOIN dept_emp empt
ON dpt.dept_no = empt.dept_no
JOIN employees e
ON e.emp_no = empt.emp_no
ORDER BY dpt.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name 
--begins with the letter B (2 points)

SELECT e.first_name AS "First Name",
		e.last_name AS "Last Name",
		e.sex AS "Sex"
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, 
--and first name (2 points)
SELECT dpt.dept_name AS "Department Name",
		empt.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name"
FROM departments dpt
JOIN dept_emp empt
ON dpt.dept_no = empt.dept_no
AND dpt.dept_name = 'Sales'
JOIN employees e
ON e.emp_no = empt.emp_no


--List each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name (4 points)
SELECT empt.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		dpt.dept_name AS "Department Name"
FROM departments dpt
JOIN dept_emp empt
ON dpt.dept_no = empt.dept_no
AND (dpt.dept_name = 'Sales' OR dpt.dept_name = 'Development')
JOIN employees e
ON e.emp_no = empt.emp_no

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees 
--share each last name) (4 points)
SELECT e.last_name, COUNT(e.last_name) AS "Frequency"
FROM employees e
GROUP BY last_name
ORDER BY last_name desc;