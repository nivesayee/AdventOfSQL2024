with avg_speed as (select reindeer_name,exercise_name,avg(speed_record) as avg_speed from training_sessions t join reindeers r on t.reindeer_id=r.reindeer_id 
where r.reindeer_name <> 'Rudolph'
group by reindeer_name, exercise_name
order by exercise_name),
highest_avg_speed_cte as (select reindeer_name,max(avg_speed) as max_speed from avg_speed group by reindeer_name)
select reindeer_name,round(max_speed,2) from highest_avg_speed_cte order by max_speed desc limit 3;