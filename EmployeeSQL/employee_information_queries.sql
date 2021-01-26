-- Data Analysis
-- -----------------------------------------------------------------------------------------------------------------------------

-- 1. List the following details of each employee: employee number,
-- last name, first name, sex, and salary.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no;
-- -----------------------------------------------------------------------------------------------------------------------------
-- 2. List first name, last name, and hire date for employees
-- who were hired in 1986.
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date) = '1986'
ORDER BY employees.hire_date;
-- -----------------------------------------------------------------------------------------------------------------------------

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
JOIN departments ON (departments.dept_no = dept_manager.dept_no)
JOIN employees ON (employess.emp_no = data_manager.emp_no);

-- ERROR:  missing FROM-clause entry for table "data_manager"
-- LINE 8: JOIN employees ON (data_manager.emp_no = employess.emp_no);
-- -----------------------------------------------------------------------------------------------------------------------------

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_manager, departments
JOIN employees ON (employees.emp_no = dept_manager.emp_no)
JOIN departments ON (deptartments.dept_no = dept_manager.dept_no);

-- ERROR:  missing FROM-clause entry for table "deptartments"
-- LINE 7: JOIN departments ON (deptartments.dept_no = dept_manager.dep...

-- -----------------------------------------------------------------------------------------------------------------------------

-- 5. List first name, last name, and sex for employees whose
-- first name is "Hercules" and last names begin with "B."

SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE (employees.first_name) = 'Hercules' AND (employees.last_name) LIKE 'B%';
-- -----------------------------------------------------------------------------------------------------------------------------

-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	department.dept_name
FROM employees
WHERE (departments.dept_no) LIKE 'd007%';
JOIN departments ON (departments)

-- -----------------------------------------------------------------------------------------------------------------------------

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	department.dept_name
FROM employees
WHERE (departments.dept_no) LIKE 'd007%' AND (departments.dept_no) LIKE 'd005%';
JOIN departments ON (departments)
-- -----------------------------------------------------------------------------------------------------------------------------

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name,
	count(employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY count(employees.last_name) DESC;
-- -----------------------------------------------------------------------------------------------------------------------------

-- Epilogue
-- -----------------------------------------------------------------------------------------------------------------------------
-- Evidence in hand, you march into your boss's office and present the visualization.
-- With a sly grin, your boss thanks you for your work. On your way out of the office,
-- you hear the words, "Search your ID number." You look down at your badge to see
-- that your employee ID number is 499942.

SELECT *
FROM employees
WHERE (employees.emp_no) = '499942';
-- -----------------------------------------------------------------------------------------------------------------------------

-- -- Step One: Create your tables and import CSVs.
-- -- -------------------------------------------------

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- -- --------------------------------------------------

CREATE TABLE "employees" (
    "emp_no" VARCHAR   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no","emp_title_id"
     )
);

-- -- --------------------------------------------------

CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

-- -- --------------------------------------------------
DROP TABLE dept_manager;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
	"emp_no" VARCHAR   NOT NULL
);

-- -- --------------------------------------------------

CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL,
    "salary" INT   NOT NULL
);

-- -- --------------------------------------------------

SELECT *
FROM salaries;

CREATE TABLE "title" (
    "title" VARCHAR   NOT NULL,
    "title_id" VARCHAR   NOT NULL
);

-- -- ------------------------------------------------------------------------------

-- Step Two: Add foreign keys
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- --------------------------------------------------------------------------------

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- --------------------------------------------------------------------------------

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- --------------------------------------------------------------------------------

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- --------------------------------------------------------------------------------

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- --------------------------------------------------------------------------------

ALTER TABLE "title" ADD CONSTRAINT "fk_title_title" FOREIGN KEY("title")
REFERENCES "employees" ("emp_title_id");

-- --------------------------------------------------------------------------------
