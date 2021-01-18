-- -- SELECT *
-- -- FROM dept_emp;

-- "\\copy public.dept_emp (emp_no, dept_no) FROM '/Users/lhabersham/code/sql-challenge/data/dept_emp.csv' DELIMITER ',' CSV HEADER QUOTE '\"' ESCAPE '''';""

-- COPY dept_emp [ ( emp_no, dept_no ) ]
--     FROM { dept_emp.csv | STDIN }
--     [ [ WITH ]
--           [ BINARY ]
--           [ DELIMITER AS ',' ]
--           [ NULL AS 'null_string' ]
--           [ CSV [ HEADER ]
--                 [ QUOTE AS \" ]
--                 [ ESCAPE AS ;" ]
--                 [ FORCE NOT NULL emp_no, dept_no ]]]