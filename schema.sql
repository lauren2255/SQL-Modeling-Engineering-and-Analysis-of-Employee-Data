DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
  dept_no varchar NOT NULL primary key,
  dept_name varchar NOT NULL
);
CREATE TABLE titles (
  title_id varchar NOT NULL primary key,
  title varchar NOT NULL
);
CREATE TABLE employees (
  emp_no int NOT NULL primary key,
  emp_title_id varchar NOT NULL,
	foreign key (emp_title_id) references titles (title_id),
  birth_date date NOT NULL,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  sex varchar NOT NULL,
  hire_date date NOT NULL
);
CREATE TABLE dept_emp (
  emp_no int NOT NULL,
	foreign key (emp_no) references employees (emp_no),
  dept_no varchar NOT NULL,
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
CREATE TABLE dept_manager (
  dept_no varchar NOT NULL,
	foreign key (dept_no) references departments (dept_no),
  emp_no int NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no int NOT NULL,
	foreign key (emp_no) references employees (emp_no),
  salary int NOT NULL,
	primary key (emp_no, salary)
)
