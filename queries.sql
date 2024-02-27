-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
left join salaries as s
on s.emp_no = e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where
extract (year from e.hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments as d
	join dept_manager as m
		on d.dept_no = m.dept_no
	join employees as e
		on e.emp_no = m.emp_no;
		
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	join dept_emp as de
		on de.emp_no = e.emp_no
	join departments as d
		on de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.first_name, e.last_name
from employees as e
	join dept_emp as de
		on de.emp_no = e.emp_no
	join departments as d
		on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	join dept_emp as de
		on de.emp_no = e.emp_no
	join departments as d
		on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(e.last_name) as frequency
from employees as e
group by e.last_name
order by count(e.last_name) desc;



