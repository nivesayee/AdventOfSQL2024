with cte as (
select 
production_date,
toys_produced,
lead(toys_produced) over(order by production_date desc) as previous_day_production
from toy_production
)
select 
*,
toys_produced - previous_day_production as production_change,
round(100*(toys_produced - previous_day_production)/previous_day_production,2) as production_change_percentage from cte
order by production_change_percentage desc nulls last;