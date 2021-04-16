SELECT first_name, last_name 
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT(first_name) 
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name 
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no, first_name, last_name 
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT r.emp_no,
	r.first_name,
	r.last_name,
	e.dept_no,
	e.from_date,
	e.to_date
FROM retirement_info as r 
LEFT JOIN dept_emp as e
ON r.emp_no = e.emp_no;

-- Joining retirement_info and dept_emp tables to find current emp
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT cu.first_name, 
	cu.last_name,
	de.dept_no
FROM current_emp as cu LEFT JOIN dept_emp as de
ON cu.emp_no = de.emp_no;

-- Employee count by department number
SELECT COUNT(cu.first_name), 
		de.dept_no
FROM current_emp as cu LEFT JOIN dept_emp as de
ON cu.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee information (Salary list)
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender,
	s.salary,
	de.to_date
-- INTO emp_info
FROM employees as e INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- Management
SELECT dem.dept_no,
	de.dept_name,
	dem.emp_no,
	em.last_name,
	em.first_name,
	dem.from_date,
	dem.to_date
FROM departments as de INNER JOIN dept_manager as dem 
ON de.dept_no = dem.dept_no
INNER JOIN employees as em
ON dem.emp_no = em.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (em.hire_date BETWEEN '1985-01-01' AND '1988-12-31')

--DEpartment retirees info
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	de.dept_name
INTO dept_info
FROM current_emp as ce INNER JOIN dept_emp as dem
ON ce.emp_no = dem.emp_no
INNER JOIN departments as de

-- List of SALES and DEVELOPMENT departments ready to retire
SELECT e.emp_no,
	r.first_name,
	r.last_name,
	d.dept_name
FROM retirement_info as r LEFT JOIN employees as e
ON r.emp_no = e.emp_no
INNER JOIN dept_emp as de
ON r.emp_no = de.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE dept_name IN ('Sales', 'Development')

-- Employee count by department number
SELECT COUNT(cu.first_name), 
		de.dept_no
INTO dept_current_emp
FROM current_emp as cu LEFT JOIN dept_emp as de
ON cu.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee Information
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	em.gender,
	sa.salary,
	sa.to_date
FROM emp_info as em INNER JOIN salaries as sa
ON em.emp_no = sa.emp_no;