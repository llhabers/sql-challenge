# Employee Database: A Mystery in Two Parts

![Employee_Database](https://github.com/llhabers/sql-challenge/blob/main/EmployeeSQL/employee_database.svg)

## Situation
I was task to use my Data Engineering and Analytical skills to research employees of a corporation from the 1980s and 1990s. I was given six CSV files to review, modify and to analyize to explain my findings through coding and visualzations. I decieded to push myself and completed the Epilouge and the bonus assignment. 

## Task
I decided to break the task down in four sections.
<br>
1. Creating the ERD and importing the CSVs with primary and foreign keys.
<br>
2. Using my coding skills to run statisically anaylsis on the datasets.
<br>
3. Completing the epilouge.
<br>
4. Completing the bonus.

## Action

### ERD, CSVs and Keys.
![ERD_Quick_Database_Diagrams](https://github.com/llhabers/sql-challenge/blob/main/EmployeeSQL/ERD.png)
As a starting place, I decided to open the CSVs on my excel workbook to view all column names. Reviewing the column names would help me create the correct database with the appropriate primary and foriegn keys. It is important to know which columns to make primary and foreign keys so that you can pull accurate date to help explain your analysis.

### Coding Time: Analysis
After setting up the appropraite database, CSVs and Keys, I was able to successful answer the following questions.
<br>
1. List the following details of each employee: employee number, last name, first name, sex, and salary.
<br>
2. List first name, last name, and hire date for employees who were hired in 1986.
<br>
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
<br>
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
<br>
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
<br>
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
<br>
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
<br>
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
<br>

I was able to answer the questions usign the join, groupby and orderby functions. It was interesting to see the salaries during the 80's. 

### Epilouge
Epilogue
The Epilouge asked me to "Search your ID number." I was told my ID number was 499942. I was able to use the following code to get the results. I was impressed with what came back. (Please review the following photo.)

SELECT *
FROM employees
JOIN salaries ON (salaries.emp_no) = (employees.emp_no)
WHERE (employees.emp_no) = '499942';

![Epilouge](https://github.com/llhabers/sql-challenge/blob/main/EmployeeSQL/most_common_salary_ranges_for_employees.png)
### Bonus Time
I decided to take on the challenge to get a deeper dive of the dataset. From looking at the graph, I notice a few observations;
<br>
1. Senior Staff 
<br>
2.
<br>
3.
## Results

![Average_Employee_Salaries](https://github.com/llhabers/sql-challenge/blob/main/EmployeeSQL/average_salary_by_titles.png)

![Most_Common_Salary_Ranges_For_Employees](https://github.com/llhabers/sql-challenge/blob/main/EmployeeSQL/most_common_salary_ranges_for_employees.png)
