CREATE TABLE "departments" (
    "dept_no" serial NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no", "dept_name"
     )
);

SELECT *
FROM departments;

DROP TABLE departments;

CREATE TABLE "dept_emp" (
    "emp_no" id   NOT NULL,
    "dept_no" serial   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "emp_no" id   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "emplyoees" (
    "emp_no" id   NOT NULL,
    "emp_title_id" serial   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" id   NOT NULL,
    "salary" VARCHAR   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salary"
     )
);

CREATE TABLE "title" (
    "title" VARCHAR   NOT NULL,
    "title_id" serial   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "emplyoees" ADD CONSTRAINT "fk_emplyoees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "emplyoees" ADD CONSTRAINT "fk_emplyoees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "title" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_manager" ("emp_no");

