

-- Code done in June 2022

"""
Given a payment table, which is a part of DVD Rental Sample Database, 
with the following schema

Column       | Type                        | Modifiers
-------------+-----------------------------+----------
payment_id   | integer                     | not null 
customer_id  | smallint                    | not null
staff_id     | smallint                    | not null
rental_id    | integer                     | not null
amount       | numeric(5,2)                | not null
payment_date | timestamp without time zone | not null
produce a result set for the report that shows a side-by-side comparison of the number 
and total amounts of payments made in Mike's and Jon's stores broken down by months.

The resulting data set should be ordered by month using natural order (Jan, Feb, Mar, etc.).

Note: You don't need to worry about the year component. Months are never repeated because 
the sample data set contains payment information only for one year.

The desired output for the report

month | total_count | total_amount | mike_count | mike_amount | jon_count | jon_amount
------+-------------+--------------+------------+-------------+-----------+-----------
2     |             |              |            |             |           |           
5     |             |              |            |             |           |           
...


"""


--My solution

select 
       extract(month from payment_date) as month,
       count(payment_id) as total_count,
       sum(amount) as total_amount,
       sum(case when staff_id = 1 then 1 else 0 end) as mike_count,
       sum (case when staff_id = 1 then amount else 0 end) as mike_amount,
       sum(case when staff_id = 2 then 1 else 0 end) as jon_count,
       sum (case when staff_id = 2 then amount else 0 end) as jon_amount
from payment
where staff_id = 1 or staff_id = 2
group by extract(month from payment_date)
order by 1