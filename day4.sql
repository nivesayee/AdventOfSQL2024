select toy_id,toy_name,array(select unnest(new_tags) except select unnest(previous_tags)) as added_tags,
array(select unnest(new_tags) intersect select unnest(previous_tags)) as unchanged_tags,
array(select unnest(previous_tags) except select unnest(new_tags)) as removed_tags,
coalesce(array_length(array(select unnest(new_tags) except select unnest(previous_tags)),1),0) as added_tags_len from toy_production
order by added_tags_len desc
limit 1;