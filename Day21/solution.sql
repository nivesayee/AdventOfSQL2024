with total_sales_cte as (select extract(year from sale_date) as year,extract(quarter from sale_date) as quarter,sum(amount) as total_sales
from sales
group by year,quarter),
previous_sales_cte as(
select *,lag(total_sales) over(order by year,quarter) as previous_sales
from total_sales_cte),growth_cte as(
select *,(total_sales - previous_sales)/previous_sales as growth_rate from previous_sales_cte)
select year,quarter,total_sales,growth_rate from growth_cte order by growth_rate desc nulls last;