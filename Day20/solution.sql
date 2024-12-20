with split_cte as (
select url,regexp_split_to_table(split_part(url,'?',2),'&') as keyvalue from web_requests),
key_value_cte as (
select url,split_part(keyvalue,'=',1) as key,split_part(keyvalue,'=',2) as value from split_cte)
select url,json_object_agg(key,value) as query_parameters,count(distinct (key,value)) as count_params from key_value_cte
group by url
order by count_params desc,url;