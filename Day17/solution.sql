with cte as (select generate_series(max((current_date ||' '||business_start_time)::timestamp at time zone 
case when timezone='Europe/Kyiv' then 'Europe/Kiev' else timezone end at time zone 'UTC'),
min((current_date ||' '||business_end_time)::timestamp at time zone 
case when timezone='Europe/Kyiv' then 'Europe/Kiev' else timezone end at time zone 'UTC') - INTERVAL '1 hour','30 minutes'::interval) as start_time from workshops)
select start_time::time as meeting_start_utc,(start_time+INTERVAL '1 hour')::time as meeting_end_utc from cte;
