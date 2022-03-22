-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] varchar  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Employees] (
    [emp_no] int  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar  NOT NULL ,
    [last_name] varchar  NOT NULL ,
    [gender] varchar  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [EmployeesPerDepartment] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL 
)

CREATE TABLE [Managers] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED (
        [dept_no] ASC,[emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Titles] (
    [emp_no] int  NOT NULL ,
    [title] varchar  NOT NULL ,
    [from_date] date  NOT NULL ,
    [to_date] date  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

ALTER TABLE [EmployeesPerDepartment] WITH CHECK ADD CONSTRAINT [FK_EmployeesPerDepartment_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [EmployeesPerDepartment] CHECK CONSTRAINT [FK_EmployeesPerDepartment_emp_no]

ALTER TABLE [EmployeesPerDepartment] WITH CHECK ADD CONSTRAINT [FK_EmployeesPerDepartment_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [EmployeesPerDepartment] CHECK CONSTRAINT [FK_EmployeesPerDepartment_dept_no]

ALTER TABLE [Managers] WITH CHECK ADD CONSTRAINT [FK_Managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Managers] CHECK CONSTRAINT [FK_Managers_dept_no]

ALTER TABLE [Managers] WITH CHECK ADD CONSTRAINT [FK_Managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Managers] CHECK CONSTRAINT [FK_Managers_emp_no]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_no]

COMMIT TRANSACTION QUICKDBD