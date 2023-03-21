

-- Code done in March 2023

"""
Given a posts table that contains a created_at timestamp column write a query that 
returns date (without time component), 
a number of posts for a given date and a running (cumulative) total number of posts up until a given date.
The resulting set should be ordered chronologically by date.
"""

select 
    created as date,
    counto as count,
    cast(sum(counto) OVER (ORDER BY created) as int) as total

from(
SELECT 
       cast(created_at as DATE) as created,
       COUNT(created_at) AS counto  
FROM POSTS
GROUP BY cast(created_at as DATE) 
)base
order by 1