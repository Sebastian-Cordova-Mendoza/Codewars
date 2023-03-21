

-- Code done in March 2023

"""
return a table with player_name, games, and batting_average.

We want batting_average to be rounded to the nearest thousandth, 
since that is how baseball fans are used to seeing it. 
Format it as text and make sure it has 3 digits to the right of the decimal (pad with zeroes if neccesary).

Next, order our resulting table by batting_average, with the highest average in the first row.

Finally, since batting_average is a rate statistic, a small number of at_bats can change the average dramatically.
To correct for this, exclude any player who doesn't have at least 100 at bats.
"""


select 
        player_name,
        games as games,
        cast(cast(cast(hits as float)/cast(at_bats as float) as numeric (36,3)) as varchar) as batting_average
        
from yankees
where at_bats > 99
order by 3 desc