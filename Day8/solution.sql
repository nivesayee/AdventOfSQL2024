with recursive cte as (
select staff_id,staff_name,manager_id,array[staff_id] as path from staff where staff_id=1
	union all
	select s.staff_id,s.staff_name,s.manager_id,c.path || s.staff_id as path from staff s join cte c on c.staff_id = s.manager_id
)
select staff_id,staff_name,array_length(path,1) as level,array_to_string(path,',') as path from cte
order by level desc;