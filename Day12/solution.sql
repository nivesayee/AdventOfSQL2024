with request_count_cte as (
select gift_id,count(*) as request_count from gift_requests
group by gift_id),
percent_cte as (
select gift_name, round(percent_rank() over(order by request_count)::numeric,2) as percentile
from request_count_cte r join gifts g
on r.gift_id=g.gift_id),
dense_rank_cte as(
select *,dense_rank() over(order by percentile desc)
from percent_cte)
select * from dense_rank_cte where dense_rank=2
order by gift_name limit 1;
