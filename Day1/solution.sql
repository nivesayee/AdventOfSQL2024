select name,
w.wishes->>'first_choice' as primary_wish,
w.wishes->>'second_choice' as backup_wish,
w.wishes->'colors'->>0 as favorite_color,
jsonb_array_length((w.wishes->'colors')::jsonb) as color_count,
case when difficulty_to_make=1 then 'Simple Gift'
when difficulty_to_make=2 then 'Moderate Gift'
else 'Complex Gift'
end as gift_complexity,
case when category='outdoor' then 'Outside Workshop'
when category='educational' then 'Learning Workshop'
else 'General Workshop' end as workshop_assignment
from children c join wish_lists w on c.child_id=w.child_id
join toy_catalogue t on t.toy_name = w.wishes->>'first_choice'
order by name
limit 5;