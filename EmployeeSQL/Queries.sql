-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employee".emp_no, 
"Employee".last_name,
"Employee".first_name,
"Employee".sex,
"Salaries".salary
FROM "Employee"
LEFT JOIN "Salaries"
ON "Employee".emp_no = "Salaries".emp_no
ORDER BY emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT "Employee".first_name,
"Employee".last_name,
"Employee".hire_date
FROM "Employee"
WHERE hire_date >= '01/01/1986' AND hire_date <= '12/31/1986'
ORDER BY hire_date;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_manager".dept_no,
"Departments".dept_name,
"Dept_manager".emp_no,
"Employee".last_name,
"Employee".first_name
FROM "Dept_manager"
LEFT JOIN "Employee"
ON "Employee".emp_no = "Dept_manager".emp_no
LEFT JOIN "Departments"
ON "Dept_manager".dept_no = "Departments".dept_no
ORDER BY dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "Employee".emp_no, 
"Employee".last_name,
"Employee".first_name,
"Departments".dept_name
FROM "Employee"
LEFT JOIN "Dep_emp"
ON "Employee".emp_no = "Dep_emp".emp_no
LEFT JOIN "Departments"
ON "Departments".dept_no = "Dep_emp".dept_no
ORDER BY emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT "Employee".first_name,
"Employee".last_name,
"Employee".sex
FROM "Employee"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT "Dep_emp".dept_no,
"Employee".emp_no,
"Employee".last_name,
"Employee".first_name,
"Departments".dept_name
FROM "Dep_emp"
LEFT JOIN "Employee"
ON "Dep_emp".emp_no = "Employee".emp_no
LEFT JOIN "Departments"
ON "Dep_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales'
ORDER BY emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT "Dep_emp".dept_no,
"Employee".emp_no,
"Employee".last_name,
"Employee".first_name,
"Departments".dept_name
FROM "Dep_emp"
LEFT JOIN "Employee"
ON "Dep_emp".emp_no = "Employee".emp_no
LEFT JOIN "Departments"
ON "Dep_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name in ('Sales', 'Development')
ORDER BY emp_no;

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "Total employees"
FROM "Employee"
GROUP BY last_name
ORDER BY "Total employees" DESC;
