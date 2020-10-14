--List the following details of each employee: employee number,
--last name, first name, sex, and salary.
SELECT emp.emp_no AS "employee number",
	emp.last_name AS "last name",
	emp.first_name AS "first name",
	emp.sex AS "sex",
	sal.salary AS "salary"
FROM employees AS emp
JOIN salaries AS sal
ON (emp.emp_no = sal.emp_no);

--below is using the same thing as above but using a subquery method.
--SELECT emp_no, last_name, first_name, sex, (
--	SELECT salary FROM salaries
--	WHERE emp_no = employees.emp_no)
--FROM employees

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "first name",
	last_name AS "last name",
	hire_date AS "hire date"
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT demp.dept_no AS "department number",
	dep.dept_name AS "department name",
	emp.emp_no AS "manager employee number",
	emp.last_name AS "last name",
	emp.first_name AS "first name"
FROM employees AS emp
JOIN department_employee AS demp
ON emp.emp_no = demp.emp_no
INNER JOIN department_manager
ON emp.emp_no = department_manager.emp_no
JOIN departments AS dep
ON demp.dept_no = dep.dept_no;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT emp.emp_no AS "employee number",
	emp.last_name AS "last name",
	emp.first_name AS "first name",
	dep.dept_name AS "department name"
FROM employees AS emp
JOIN department_employee AS demp
ON emp.emp_no = demp.emp_no
JOIN departments AS dep
ON demp.dept_no = dep.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules"
--and last names begin with "B."
SELECT first_name AS "first name",
	last_name AS "last_name",
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT emp.emp_no AS "employee number",
	emp.last_name AS "last name",
	emp.first_name AS "first name",
	dep.dept_name AS "department name"
FROM employees AS emp
JOIN department_employee AS demp
ON emp.emp_no = demp.emp_no
JOIN departments AS dep
ON demp.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
SELECT emp.emp_no AS "employee number",
	emp.last_name AS "last name",
	emp.first_name AS "first name",
	dep.dept_name AS "department name"
FROM employees AS emp
JOIN department_employee AS demp
ON emp.emp_no = demp.emp_no
JOIN departments AS dep
ON demp.dept_no = dep.dept_no
WHERE dep.dept_name = 'Sales'
OR dep.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name.
SELECT last_name AS "last name",
	COUNT(last_name) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;