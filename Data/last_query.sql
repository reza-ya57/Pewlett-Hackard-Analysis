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

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp

SELECT cu.first_name, 
	cu.last_name,
	de.dept_no
FROM current_emp as cu LEFT JOIN dept_emp as de
ON cu.emp_no = de.emp_no;

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

DROP TABLE emp_info;
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

--Management
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
-- AND (dem.to_date = '9999-01-01');







