with cte as (
select chr(value) as message from letters_a 
union all
select chr(value) as message from letters_b)
select regexp_replace(string_agg(message,''),'[^a-zA-Z !.;:,?"''()-]','','g') from cte;