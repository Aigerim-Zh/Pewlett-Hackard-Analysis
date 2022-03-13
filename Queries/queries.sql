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
AND (hire_date BETWEEN '1985-01-01' and '1988-12-31'
);

SELECT * FROM retirement_info;
