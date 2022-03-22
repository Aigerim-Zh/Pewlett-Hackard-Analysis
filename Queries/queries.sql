--Employees born between 1952 and 1955
SELECT first_name, last_name FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT COUNT(emp_no) FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Retirement eligibility
--41,830 employees eligible for the retirement package
SELECT COUNT(emp_no) FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' and '1988-12-31'
);

--Storing these employees into a new table
SELECT first_name, last_name 
INTO retirement_info
FROM employees 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' and '1988-12-31');

SELECT * FROM retirement_info;

--Selecting the list of CURRENT employees eligible for the package
SELECT re.emp_no, 
	re.first_name, 
	re.last_name, 
	epd.to_date,
INTO current_emp
FROM retirement_info as re
LEFT JOIN employees_per_dept as epd
ON re.emp_no=epd.emp_no
WHERE epd.to_date = ('9999-01-01');

--Eligible current employee count by department number
SELECT d.dept_no, d.dept_name, COUNT(ce.emp_no)
INTO retiring_per_dept
FROM current_emp as ce
LEFT JOIN employees_per_dept as epd
ON ce.emp_no=epd.emp_no
LEFT JOIN departments as d
ON epd.dept_no=d.dept_no
GROUP BY d.dept_no
ORDER BY COUNT(ce.emp_no) DESC;

--Checking the employment date in the Salaries table
SELECT * FROM salaries
ORDER BY to_date DISC;


--Employee Information List
SELECT e.emp_no, e.first_name, e.last_name, e.gender,
        s.salary, epd.to_date
-- INTO emp_info 
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no=s.emp_no)
INNER JOIN employees_per_dept as epd
ON (e.emp_no=epd.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
;

-- List of managers per department
SELECT  m.dept_no,
        d.dept_name,
        m.emp_no,
        ce.last_name,
        ce.first_name,
        m.from_date,
        m.to_date
INTO manager_info
FROM managers AS m
INNER JOIN departments AS d
ON (m.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
ON (m.emp_no = ce.emp_no);

--Retiring Employees with Department 
SELECT ce.emp_no, 
	 d.dept_no, 
	 d.dept_name, 
	 ce.first_name, 
	 ce.last_name, 
	 ce.to_date
INTO dept_info
FROM current_emp as ce
INNER JOIN employees_per_dept as epd
ON ce.emp_no=epd.emp_no
INNER JOIN departments as d
ON epd.dept_no=d.dept_no;

--Table tailored to sales department
SELECT ce.emp_no, 
	 d.dept_no, 
	 d.dept_name, 
	 ce.first_name, 
	 ce.last_name, 
	 ce.to_date
INTO sales_info
FROM current_emp as ce
INNER JOIN employees_per_dept as epd
ON ce.emp_no=epd.emp_no
INNER JOIN departments as d
ON epd.dept_no=d.dept_no
WHERE d.dept_no=('d007');

--Table tailored to sales and development department
SELECT ce.emp_no, 
	 d.dept_no, 
	 d.dept_name, 
	 ce.first_name, 
	 ce.last_name, 
	 ce.to_date
INTO sales_dev_info
FROM current_emp as ce
INNER JOIN employees_per_dept as epd
ON ce.emp_no=epd.emp_no
INNER JOIN departments as d
ON epd.dept_no=d.dept_no
WHERE d.dept_no IN ('d005','d007'); 