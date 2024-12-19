with cte as(
select *,round(avg((to_json(year_end_performance_scores)->>-1)::numeric) over(),2) as avg_rating from employees)
select round(sum(salary+case when (to_json(year_end_performance_scores)->>-1)::numeric > avg_rating then (salary*15)/100 else 0 end),2) from cte;