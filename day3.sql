with cte as(
select 
case when xmlexists('//total_present/text()' passing by ref menu_data) = 'true' then (xpath('//total_present/text()',menu_data)::varchar[]::integer[])[1]
 when xmlexists('//total_guests/text()' passing by ref menu_data) = 'true' then (xpath('//total_guests/text()',menu_data)::varchar[]::integer[])[1]
 when xmlexists('//total_count/text()' passing by ref menu_data) = 'true' then (xpath('//total_count/text()',menu_data)::varchar[]::integer[])[1]
 else 0
end as head_count
,xpath('//food_item_id/text()',menu_data)::varchar[] as food_id_list
from christmas_menus)
select unnest(food_id_list) as ids,count(*) as freq  from cte
where head_count>78
group by ids
order by freq desc
limit 1;