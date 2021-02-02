-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/9TwkiD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Set datestyle to suit CSV data
-- SET datestyle TO MDY;

-- Confirm datestyle has been set correctly per data.
-- SHOW datestyle;

-- Drop table if it already exists
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS department_employees CASCADE;
DROP TABLE IF EXISTS department_managers CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- Start Import: Create tables to hold imported data 
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY	NOT NULL,
    dept_name VARCHAR   NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(50)	NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    sex VARCHAR(2)   NOT NULL,
    hire_date VARCHAR  NOT NULL
);

CREATE TABLE department_employees (
    emp_no INT  NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR(4)    NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)    
);

CREATE TABLE department_managers (
    dept_no VARCHAR(4)    NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),	
    salary INT   NOT NULL
);
-- End Import: Create tables to hold imported data

-- Alter column data types **AFTER** data has been imported
ALTER TABLE employees
ALTER COLUMN birth_date TYPE DATE
USING to_date(birth_date, 'MM/DD/YYYY'),
ALTER COLUMN hire_date TYPE DATE
USING to_date(hire_date, 'MM/DD/YYYY');

SELECT * FROM employees;