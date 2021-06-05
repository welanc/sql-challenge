# SQL Challenge

## Task

Importing CSV data into an SQL database (PostgreSQL) containing dummy employee data to perform data engineering and data analysis. 

### Data Modelling
Entity Relationship Diagram (ERD) sketched out as a basis for creating the table schemas of the SQL database.

### Data Engineering 
Table schemas created, defining data types, primary keys, foreign keys and other constraints.
Six tables were created with the following relationships:

* Departments
  * Department Number (Primary key)
  * Department Name
* Titles
  * Title ID (Primary key)
  * Title 
* Employees
  * Employee Number (Primary key)
  * Employee Title ID (Foreign key, references Titles(Title ID)
  * Birth Date
  * First Name
  * Last Name
  * Sex
  * Hire Date
* Department Employees
  * Employee Number (Foreign key, references Employees(Employee Number))
  * Department Number (Foreign key, references Departments(Department Number))
  * (Composite key as Primary key, Employee Number and Department Number)
* Department Managers
  * Department Number (Foreign key, references Departments(Department Number))
  * Employee Number (Foreign key, references Employees(Employee Number))
  * (Composite key as Primary key, Department Number and Employee Number)
* Salaries
  * Employee Number (Foreign key, references Employees(Employee Number))
  * Salary

### Data Analysis
Various queries called to filter the database based on various criteria:
1. List the following details of each employee: employee number, last name, first name, sex, and salary.
2. List first name, last name, and hire date for employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

--- 

## Technologies

PostgreSQL