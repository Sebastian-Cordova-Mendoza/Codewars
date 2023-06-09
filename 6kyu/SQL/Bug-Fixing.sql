

-- Code done in March 2023

"""
Oh no! Timmys been moved into the database divison of his software company 
but as we know Timmy loves making mistakes. Help Timmy keep his job by fixing his query...

Timmy works for a statistical analysis company 
and has been given a task of totaling the number of sales on a given day 
grouped by each department name and then each day.
"""

SELECT 
    cast(s.transaction_date as DATE) as day,
    d.name AS department,
    COUNT(s.id) as sale_count
  
FROM department d

JOIN sale s 
on d.id = s.department_id

group by day, d.name
order by 1
  