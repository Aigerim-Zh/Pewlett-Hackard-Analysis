# Pewlett-Hackard-Analysis

## Overview of the Project

The purpose of this project is to help the company, Pewlett Hackard, with over 300,00 employees prepare for upcoming retirements. The company is offering retirement packages for people who meet certain criteria, and it wants to know who will be retiring and how many positions it will need to fill in the near future. 

The employee data needed is only available in the form of 6 CSV files because the company has been mainly using Excel and VBA to work with their data. Now, they decided to update their methods and use SQL instead. Our task is to help the company build an employee database using SQL. 

## Data 
- The company provided us with six initial datasets with one worksheet each in a CSV format located in the [Data](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/tree/main/Data) folder. 
- The schema file of the database is located [Data](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/schema.sql) folder.
- All queries for the below analysis are located in the [Queries](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/tree/main/Queries) folder.

## Database Connections

To get a database's layout, using Quick DBD ("Quick Database Diagrams"), the ERD (Entity Relationship Diagram) was created below. This diagram shows a map of the database and the flow of the data from one table to another.

![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png)

As can be seen in the ERD below, there are six tables in which different data is stored. Department and Employees tables have unique department and employee numbers, respectively. All other tables reference the department or employee or both in these tables. 

- Managers table 
    - connects one-to-one to the Department table because the Managers table references the same department only once. 
    - connects one-to-one to the Employees table because the Managers table references the same employee (manager) only once. 
- EmployeesPerDeparment table 
    - connects one-to-many to the Employees table because the EmployeesPerDepartment table has instances of referencing one employee number in the Employees table more than once. 
    - connects one-to-many to the Department table because the EmployeesPerDepartment table has instances of referencing one department number in the Department table more than once. This can be explained by the fact that there are the same employees who worked in different departments. 
- Titles table 
    - connects one-to-many to the Employees table because the Title table has instances of referencing one employee in the Employees table more than once (mostly due to promotions). 
- Salaries table 
    - connects one-to-one to the Employees table because it references each employee in the Employees table only once.

## Analysis

## Count of Employees Eligible for Retirement Package Per Department 

To create a list of the count of employees for each department, a separate table (retirement_info) was created containing the employee number, first name, and last name filtered to the retirement package criteria as follows:

Now that we have the list of employees eligible for the retirement package, we need to break it down by each department. For that, we will join the retirement_info table with the employees_per_dept (EmployeesPerDepartment) table because it has a department number for each employee. However, as indicated earlier, we need to apply these eligibility criteria on employees who still work at the firm with the _to_date_ value of '9999-01-01'.

![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/retirement_pckg_per_dept.png)

- The Development department has the highest number of employees eligible for the retirement package, while the Finance department has the lowest number. 
- There are 36,619 current employees in total eligible for the retirement package. 

The exported CSV file of the data is [here](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/retiring_per_dept.csv). 

## Deliverable 1. The Number of Retiring Employees Per Title. 

### Retirement Titles
We need to create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952, and December 31, 1955. 

The exported CSV file of the data is [here](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv). 

![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/retirement_titles.png)

### Retirement Titles Without Duplicates

The table has duplicate values of employees due to promotions and also includes employees that have left the firm. It is important to select current employees and the most recent title of each employee needs to be used. 

![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/unique_titles.png)

### Number of Retiring Employees By Title
![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/retiring_by_title.png)

The exported CSV file of the data is [here](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/retiring_by_title.csv). 

### Results
- There are 72,458 employees ready for retirement in the upcoming years.
- The position that will need most fillings is the Senior Engineer position. 
- There are only 2 managers that need to be filled in for the whole company. 
- This analysis can help the company assess what job titles need to be filled in the most. 

## Deliverable 2. The Employees Eligible for the Mentorship Program.
![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship_eligibility.png)

The company also wants to create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965, and December 31, 1965. It is important to select unique values for each employee and their most recent title. 

The exported CSV file of the data is [here](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv). 

### Results
- There are 1,549 employees eligible for the mentorship program. 
- The table contains the employee number, first name, last name, birth_date, hire date, and the most recent title. 
- This file can help the company assess who is available for the mentorship program as the surge of retirements is coming. 
- Please see below for more insights on mentorship eligibility. 

# Summary

- **How many roles will need to be filled as the "silver tsunami" begins to make an impact?**

In total, there are 72,458 employees ready for retirement in the upcoming years. Out of these 72,458 employees, 36,619 employees are eligible for the retirement package based on their hired date. We saw the breakdown of retiring employees by most recent job title. However, it would be further beneficial to look at positions that will need to be filled in within each department. In this way, each department can assess what roles need to be filled in.  

![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/unique_titles_per_dept.png)

The exported CSV file of the data is [here](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles_per_dept.csv). 

- **Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**

There are 1,549 retirement-ready employees who can mentor the next generation of the company's employees. However, it would be more useful to count the number of mentors available in each position within each department. In this way, each department can compare the number of retiring people for each position and the number of available mentors for each position. 

![](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship_eligibility_per_title_dept.png)

The exported CSV file of the data is [here](https://github.com/Aigerim-Zh/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility_per_dept.csv). 

