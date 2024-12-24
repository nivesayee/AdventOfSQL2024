select s.song_title, 
count(up.song_id) as total_plays,
sum(case when s.song_duration <> up.duration then 1 else 0 end) as total_skips
from user_plays up join users u on up.user_id=u.user_id join songs s on s.song_id=up.song_id
group by s.song_title
order by total_plays desc,total_skips;