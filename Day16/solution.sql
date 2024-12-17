with cte as(
select place_name,min(timestamp) as mintime,max(timestamp) as maxtime from sleigh_locations s join areas a on st_contains(a.polygon,s.coordinate)
group by place_name)
select place_name,maxtime-mintime as hours_spent from cte
order by hours_spent desc;