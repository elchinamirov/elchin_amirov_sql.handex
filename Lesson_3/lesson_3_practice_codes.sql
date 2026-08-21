select e.*, case when job_id='IT_PROG' and salary>5000 then 'A'
            when (department_id=50 or department_id=80) and commission_pct is null then 'B'
            else 'diger'
            end as grade
            from employees e;