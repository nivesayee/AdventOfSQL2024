with cte as (
select *,unnest(string_to_array(skills,',')) as unnested_skill from elves)
select count(*) as numofelveswithsql from cte where unnested_skill='SQL';