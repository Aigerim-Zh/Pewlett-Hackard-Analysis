--Deliverable 1
--1. Retirement Titles
SELECT e.emp_no, 
       e.first_name, 
       e.last_name, 
       t.title, 
       t.from_date, 
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t 
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no; 

--2. Remove duplicates and get the most recent job title for current employees
SELECT DISTINCT ON (emp_no) emp_no, 
       first_name, 
       last_name, 
       title
INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no ASC, to_date DESC; 

--3. Number of retiring employees by their most recent job title
SELECT COUNT(title), title
INTO retiring_by_title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable 2. The Employees Eligible for the Mentorshio Program
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
       e.first_name, 
       e.last_name, 
       e.birth_date, 
       epd.from_date, 
       epd.to_date,
       t.title
INTO mentorship_eligibility
FROM employees as e 
INNER JOIN employees_per_dept as epd
ON (e.emp_no=epd.emp_no)
INNER JOIN titles as t
ON (epd.emp_no=t.emp_no)
WHERE (t.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC, t.to_date DESC; 

--Deliverable 3. Additional Queries
--Number of retiring employees per title per department 
SELECT DISTINCT ON (ut.emp_no) d.dept_no, 
		d.dept_name, 
		ut.emp_no, 
		ut.first_name, 
		ut.last_name, 
		ut.title
INTO unique_titles_per_dept
FROM unique_titles as ut
INNER JOIN employees_per_dept as epd
ON ut.emp_no=epd.emp_no
INNER JOIN departments as d
ON epd.dept_no=d.dept_no;

SELECT dept_no, dept_name, title, COUNT(title)
INTO retiring_per_title_dept
FROM unique_titles_per_dept
GROUP BY dept_no, dept_name, title
ORDER BY dept_name DESC, COUNT(title) ASC

--Number of mentorship eligible employees per title by department 
SELECT COUNT(emp_no) FROM mentorship_eligibility; 

SELECT DISTINCT ON (me.emp_no) d.dept_no, 
		d.dept_name, 
		me.emp_no, 
		me.first_name, 
		me.last_name, 
		me.title
INTO mentorship_eligibility_dept
FROM mentorship_eligibility as me
INNER JOIN employees_per_dept as epd
ON me.emp_no=epd.emp_no
INNER JOIN departments as d
ON epd.dept_no=d.dept_no;

SELECT dept_no, dept_name, title, COUNT(title)
INTO mentorship_eligibility_per_title_dept
FROM mentorship_eligibility_dept
GROUP BY dept_no, dept_name, title
ORDER BY dept_name DESC, COUNT(title) ASC;


