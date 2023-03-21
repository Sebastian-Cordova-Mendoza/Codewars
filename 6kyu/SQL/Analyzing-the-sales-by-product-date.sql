

-- Code done in March 2023

"""
Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.

Notes
The sales table stores only the dates for which any data has been recorded - 
the information about individual sales (what was sold, and when) is stored in the sales_details table instead
The sales_details table stores totals per product per date
Order the result by the product_name, year, month, day columns
We're interested only in the product-specific data, so you shouldn't return the total revenue from all sales

"""

SELECT 
       product_name, year, month, day, total
FROM (
      SELECT *
             ,ROW_NUMBER() OVER ( PARTITION BY product_name, year, month, day, total )AS ORDEN
      FROM (

--producto
select 
        p.name as product_name,
        extract(year from s.date) as year,
        extract(month from s.date) as month,
        extract(DAY FROM s.date)  as day,
        SUM(price * count) as total

from sales_details as sd

left join products as p
on p.id = sd.product_id

left join sales as s
on s.id = sale_id

group by p.name ,
        extract(year from s.date),
        extract(month from s.date) ,
        extract(DAY FROM s.date)  

union all

--producto
(select 
        p.name,
        extract(year from s.date) as year,
        extract(month from s.date) as month,
        null  as day,
        sum(price * count) as total

from sales_details as sd

left join products as p
on p.id = sd.product_id

left join sales as s
on s.id = sale_id

group by p.name ,  extract(year from s.date) ,
        extract(month from s.date) 
       )
        
union all 

select 
        p.name,
        extract(year from s.date) as year,
        NULL as month,
        null  as day,
        sum(price * count)  as total

from sales_details as sd

left join products as p
on p.id = sd.product_id

left join sales as s
on s.id = sale_id

group by p.name,
        extract(year from s.date)

union all 

select 
        p.name,
        null as year,
        null as month,
        null  as day,
        sum(price * count) as total

from sales_details as sd

left join products as p
on p.id = sd.product_id

left join sales as s
on s.id = sale_id

group by  p.name, price
)A
)AS T
  
WHERE ORDEN = 1
order by 1,2,3,4