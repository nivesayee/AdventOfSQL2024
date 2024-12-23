with cte as (
select id,lag(id) over(order by id) as last_id from sequence_table)
select last_id+1 as gap_start,id-1 as gap_end,array(select * from generate_series(last_id+1,id-1)) as missing_numbers from cte where id-last_id > 1;