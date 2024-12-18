with recursive cte as (
select staff_id,staff_name,array[staff_id] as path,manager_id from staff where staff_id=1
union all
select s.staff_id,s.staff_name, c.path || s.staff_id as path,s.manager_id from cte c join staff s on c.staff_id=s.manager_id 
)
select staff_id,staff_name,array_length(path,1) as level,path,manager_id,count(*) over(partition by manager_id) as peers_same_manager,count(*) over(partition by array_length(path,1)) as total_peers_same_level from cte
order by total_peers_same_level desc,staff_id;