

-- Code done in March 2023

"""
For this challenge you need to create a UNION statement, 
there are two tables ussales and eusales the parent company 
tracks each sale at its respective location in each table, 
you must all filter the sale price so it only returns rows with a sale greater than 50.00.
You have been tasked with combining that data for future analysis. 
Order by location (US before EU), then by id.

"""

select  
      'US' as location,
      id,
      name,
      price,
      card_name,
      card_number,
      transaction_date

from ussales
where price > 50.0

union all

select  
      'EU' as location,
      id,
      name,
      price,
      card_name,
      card_number,
      transaction_date

from eusales
where price > 50.0